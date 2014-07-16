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
}

- (void)viewWillAppear:(BOOL)animated
{
    self.textFieldTitulo.text = self.carInformation.titulo;
    [self handleChangeTitulo:self.textFieldTitulo];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pushButtonSiguiente:(id)sender {
    ViewControllerStep3 *nextView = [[ViewControllerStep3 alloc] initWithNibName:nil bundle:nil];
    self.carInformation.titulo = self.textFieldTitulo.text;
    nextView.carInformation = self.carInformation;
    [self.navigationController pushViewController:nextView animated:YES];
}

- (IBAction)handleChangeTitulo:(id)sender {
    
    UITextField* textField = (UITextField*)sender;
    //saco los espacios en blanco y los saltos de linea
    NSString * titulo = [textField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    //habilito el boton si tengo al menos un caracter
    self.buttonSiguiente.enabled=(titulo.length > 0);
}

@end
