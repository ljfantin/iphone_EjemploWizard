//
//  ViewControllerStep2.m
//  EjemploWizard
//
//  Created by Leandro Fantin on 15/07/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "ViewControllerStep2.h"
#import "ViewControllerStep3.h"
#import "UIButton+Copado.h"

@interface ViewControllerStep2 ()

@end

@implementation ViewControllerStep2

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title=@"Paso 1";
        // Custom initialization
        self.carInformation = [[CarInformationDTO alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.buttonSiguiente makeCopado];
    
    //seteo el content size
    [[self scroll] setContentSize:[[self view] frame].size];
    
    //Me atacho a los eventos del teclado
    [self registerForKeyboardNotifications];
    
    //Creo identificador de gestos.
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scrollViewPulsado)];
    [tapRecognizer setCancelsTouchesInView:NO];
    //agrego al scroll view el identificador de gestos
    [[self scroll] addGestureRecognizer:tapRecognizer];
    
    self.automaticallyAdjustsScrollViewInsets = NO;

}

- (void)viewWillAppear:(BOOL)animated
{
    self.textFieldTitulo.text = self.carInformation.titulo;
    //[self handleChangeTitulo:self.textFieldTitulo];
}


- (IBAction)pushButtonSiguiente:(id)sender {
    ViewControllerStep3 *nextView = [[ViewControllerStep3 alloc] initWithNibName:nil bundle:nil];
    self.carInformation.titulo = self.textFieldTitulo.text;
    nextView.carInformation = self.carInformation;
    [self.navigationController pushViewController:nextView animated:YES];
}

/*
- (IBAction)handleChangeTitulo:(id)sender {
    
    UITextField* textField = (UITextField*)sender;
    //saco los espacios en blanco y los saltos de linea
    NSString * titulo = [textField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    //habilito el boton si tengo al menos un caracter
    self.buttonSiguiente.enabled=(titulo.length > 0);
}*/

- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardDidHideNotification object:nil];
    
}

- (void)unregisterForKeyboardNotifications
{
    //me desatacho los eventos del teclado
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillShowNotification
                                                  object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardDidHideNotification
                                                  object:nil];
}


#pragma mark - Notificaciones del teclado
- (void) keyboardWasShown:(NSNotification *)notificacion
{
    //Nota: El ScrollView no tiene que estar en autolayout para que funcione
    NSDictionary* info = [notificacion userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    //Es como un padding
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0);
    self.scroll.contentInset = contentInsets;
    self.scroll.scrollIndicatorInsets = contentInsets;
    
    CGRect aRect = self.view.frame;
    aRect.size.height = kbSize.height;
    if (!CGRectContainsPoint(aRect, self.activeField.frame.origin) ) {
        CGRect rect = self.activeField.frame;
        //rect.origin.y = rect.origin.y + self.navigationController.view.frame.size.height;
        //CGFloat height = self.navigationController.navigationBar.frame.size.height;
        //rect.origin.y = rect.origin.y + 100;
        [self.scroll scrollRectToVisible:rect animated:YES];
    }
}

- (void) keyboardWillBeHidden:(NSNotification *)notificacion
{
    
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    self.scroll.contentInset = contentInsets;
    self.scroll.scrollIndicatorInsets = contentInsets;
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

- (void) scrollViewPulsado
{
    [[self view] endEditing:YES];
}

@end
