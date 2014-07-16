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

#pragma mark implementacion de protocolo
- (void)textViewDidChange:(UITextView *)textView    {

    //saco los espacios en blanco y los saltos de linea
    NSString * titulo = [textView.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    //habilito el boton si tengo al menos un caracter
    self.buttonSiguiente.enabled=(titulo.length > 0);
}

@end
