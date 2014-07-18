//
//  ViewControllerStep4.m
//  EjemploWizard
//
//  Created by Leandro Fantin on 15/07/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "ViewControllerStep4.h"
#import "ViewControllerStep5.h"
#import "UIButton+Copado.h"

@interface ViewControllerStep4 ()
@property UITextField * activeField;
@end

@implementation ViewControllerStep4

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title=@"Paso 3";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //Le seteo el content size
    [[self scroll] setContentSize:[[self view] frame].size];
    
    //hago el boton copado
    [self.buttonSiguiente makeCopado];
    
    //Me atacho a los eventos del teclado
    [self registerForKeyboardNotifications];
    
    //Creo identificador de gestos.
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scrollViewPulsado)];
    [tapRecognizer setCancelsTouchesInView:NO];
    
    //agrego al scroll view el identificador de gestos
    [[self scroll] addGestureRecognizer:tapRecognizer];
}

- (void) viewDidUnload
{
    [self unregisterForKeyboardNotifications];
}

- (void)viewWillAppear:(BOOL)animated
{
    self.textViewDescripcion.text = self.carInformation.descripcion;
    [self textViewDidChange:self.textViewDescripcion];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    NSLog(@"Houston! Me estoy quedando sin memoria");
}

- (IBAction)pushButtonSiguiente:(id)sender {
    ViewControllerStep5 *nextView = [[ViewControllerStep5 alloc] initWithNibName:nil bundle:nil];
    self.carInformation.descripcion = self.textViewDescripcion.text;
    nextView.carInformation = self.carInformation;
    [self.navigationController pushViewController:nextView animated:YES];
}

- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(apareceElTeclado:)
                                                 name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(desapareceElTeclado:)
                                                 name:UIKeyboardWillHideNotification object:nil];
    
}

- (void)unregisterForKeyboardNotifications
{
    //me desatacho los eventos del teclado
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardDidShowNotification
                                                  object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardDidHideNotification
                                                  object:nil];
}

#pragma mark - Notificaciones del teclado
- (void) apareceElTeclado:(NSNotification *)laNotificacion
{
    NSLog(@"Aparece el teclado");
    NSDictionary* info = [laNotificacion userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0);
    self.scroll.contentInset = contentInsets;
    self.scroll.scrollIndicatorInsets = contentInsets;
    
    // If active text field is hidden by keyboard, scroll it so it's visible
    // Your app might not need or want this behavior.
    CGRect aRect = self.view.frame;
    aRect.size.height -= kbSize.height;
    if (!CGRectContainsPoint(aRect, self.buttonSiguiente.frame.origin) ) {
        [self.scroll scrollRectToVisible:self.buttonSiguiente.frame animated:YES];
    }
}


- (void) desapareceElTeclado:(NSNotification *)laNotificacion
{
    NSLog(@"Desaparece el teclado");
    //[UIView beginAnimations:nil context:NULL];
    //[UIView setAnimationDuration:0.3];
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    self.scroll.contentInset = contentInsets;
    self.scroll.scrollIndicatorInsets = contentInsets;
    //[UIView commitAnimations];
}

- (void) scrollViewPulsado
{
    [[self view] endEditing:YES];
}

#pragma mark implementacion de protocolo
- (void)textViewDidChange:(UITextView *)textView    {

    //saco los espacios en blanco y los saltos de linea
    NSString * titulo = [textView.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    //habilito el boton si tengo al menos un caracter
    self.buttonSiguiente.enabled=(titulo.length > 0);
}

#pragma mark Delegate textfield
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    _activeField = textField;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    _activeField = nil;
}

@end
