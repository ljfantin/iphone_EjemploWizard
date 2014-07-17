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
    // Do any additional setup after loading the view from its nib.
    self.textViewDescripcion.delegate = self;
    [self.buttonSiguiente makeCopado];
    
    //Me atacho a los eventos del teclado
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(apareceElTeclado:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(desapareceElTeclado:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    
    //Creo identificador de gestos.
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scrollViewPulsado)];
    [tapRecognizer setCancelsTouchesInView:NO];
    
    //agrego al scroll view el identificador de gestos
    [[self scrollView] addGestureRecognizer:tapRecognizer];
    
    [[self scrollView] setContentSize:[[self view] frame].size];
    
    //[selfscrollView.setScrollEnabled:YES];
    //[scroller setContentSize:CGSizeMake(320,910)];
    //[self.view addSubView:scroller];

}

- (void) viewDidUnload
{
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillShowNotification
                                                  object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardDidHideNotification
                                                  object:nil];
}

- (void)viewWillAppear:(BOOL)animated
{
    self.textViewDescripcion.text = self.carInformation.descripcion;
    [self textViewDidChange:self.textViewDescripcion];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pushButtonSiguiente:(id)sender {
    ViewControllerStep5 *nextView = [[ViewControllerStep5 alloc] initWithNibName:nil bundle:nil];
    self.carInformation.descripcion = self.textViewDescripcion.text;
    nextView.carInformation = self.carInformation;
    [self.navigationController pushViewController:nextView animated:YES];
}

- (void) apareceElTeclado:(NSNotification *)laNotificacion
{
    //Obtenemos el tamaño del teclado
    NSDictionary *infoNotificacion = [laNotificacion userInfo];
    CGSize tamanioTeclado = [[infoNotificacion objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    //Modificamos el tamaño de la 'ventana' de nuestro scroll view
    UIEdgeInsets edgeInsets = UIEdgeInsetsMake(0, 0, tamanioTeclado.height, 0);
    [[self scrollView] setContentInset:edgeInsets];
    [[self scrollView] setScrollIndicatorInsets:edgeInsets];
    
    [[self scrollView] scrollRectToVisible:[self textFieldBorrar].frame animated:YES];
}


- (void) desapareceElTeclado:(NSNotification *)laNotificacion
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    UIEdgeInsets edgeInsets = UIEdgeInsetsZero;
    [[self scrollView] setContentInset:edgeInsets];
    [[self scrollView] setScrollIndicatorInsets:edgeInsets];
    [UIView commitAnimations];
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

@end
