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
#import "NSString+Utils.h"
#import "ValidatorImpl.h"

@interface ViewControllerStep2 ()
@property (nonatomic, retain) ValidatorImpl * validator;
@property BOOL notEmptyTextFieldTitulo;
@property BOOL notEmptyTextFieldSubtitulo;
@property BOOL notEmptyTextFieldPrecio;
@end

@implementation ViewControllerStep2

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title=@"Paso 1";
        // Custom initialization
        self.carInformation = [[CarInformationDTO alloc] init];
        self.validator = [[ValidatorImpl alloc] init];
        self.notEmptyTextFieldTitulo = NO;
        self.notEmptyTextFieldSubtitulo = NO;
        self.notEmptyTextFieldPrecio = NO;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //seteo el content size
    [[self scroll] setContentSize:[[self view] frame].size];
    
    //Me atacho a los eventos del teclado
    [self registerForKeyboardNotifications];
    
    //Creo identificador de gestos.
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scrollViewPulsado)];
    [tapRecognizer setCancelsTouchesInView:NO];
    //agrego al scroll view el identificador de gestos
    [[self scroll] addGestureRecognizer:tapRecognizer];
    
    [tapRecognizer release];
}

- (void)viewWillAppear:(BOOL)animated
{
    self.textFieldTitulo.text = self.carInformation.titulo;
    self.textFieldSubtitulo.text = self.carInformation.subtitulo;
    self.textFieldPrecio.text = self.carInformation.precio;
}

- (IBAction)pushButtonSiguiente:(id)sender {
    ViewControllerStep3 *nextView = [[ViewControllerStep3 alloc] initWithNibName:nil bundle:nil];
    self.carInformation.titulo = self.textFieldTitulo.text;
    self.carInformation.subtitulo = self.textFieldSubtitulo.text;
    self.carInformation.precio = self.textFieldPrecio.text;
    
    nextView.carInformation = self.carInformation;
    //NSArray * arreglo = self.navigationController.viewControllers;
    [self.navigationController pushViewController:nextView animated:YES];
    //libero el nextView
    [nextView release];
}

- (IBAction)textFieldChangeSubtitulo:(id)sender {
    
    UITextField * textField = (UITextField *) sender;
    self.notEmptyTextFieldSubtitulo = [self.validator isNotEmpty:textField.text];
    self.buttonSiguiente.enabled=(self.notEmptyTextFieldSubtitulo &&
                                  self.notEmptyTextFieldTitulo &&
                                  self.notEmptyTextFieldPrecio);
}

- (IBAction)textFieldChangeTitulo:(id)sender {
    
    UITextField * textField = (UITextField *) sender;
    self.notEmptyTextFieldTitulo = [self.validator isNotEmpty:textField.text];
    self.buttonSiguiente.enabled=(self.notEmptyTextFieldSubtitulo &&
                                  self.notEmptyTextFieldTitulo &&
                                  self.notEmptyTextFieldPrecio);
}

- (IBAction)textFieldChangePrecio:(id)sender {
    
    UITextField * textField = (UITextField *) sender;
    self.notEmptyTextFieldPrecio = [self.validator isNotEmpty:textField.text];
    self.buttonSiguiente.enabled=(self.notEmptyTextFieldSubtitulo &&
                                  self.notEmptyTextFieldTitulo &&
                                  self.notEmptyTextFieldPrecio);
}

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
    
    //Es como un padding, y lo pones del tamanio del teclado para que active las barras de scroll
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0);
    self.scroll.contentInset = contentInsets;
    self.scroll.scrollIndicatorInsets = contentInsets;
    
    //muevo las scrollbars hasta el active field que tenia el foco del usuario
    CGRect aRect = self.view.frame;
    aRect.size.height = kbSize.height;
    if (!CGRectContainsPoint(aRect, self.activeField.frame.origin) ) {
        CGRect rect = self.activeField.frame;
        [self.scroll scrollRectToVisible:rect animated:YES];
    }
}

- (void) keyboardWillBeHidden:(NSNotification *)notificacion
{
    //cuando el teclado desaparece, le sacamos el "padding" al scrollview
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
//
#pragma mark Implementacion
- (BOOL) textField: (UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString: (NSString *)string {
    
    //Si no es el precio entonces le doy ok
    if (![textField isEqual:self.textFieldPrecio])  {
        return YES;
    }
    
    if (range.length == 1){
        return YES;
    }else{
        return [self.validator isNumber:string];
    }
}

- (void)dealloc
{
    [self.carInformation release];
    [super dealloc];
}
@end
