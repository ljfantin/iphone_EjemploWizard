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
#import "UINavigationController+Wizard.h"


@interface ViewControllerStep2 ()

@end

@implementation ViewControllerStep2

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.buttonSiguiente makeCopado];
    self.textFieldTitulo.text = self.navigationController.titulo;
    [self handleChangeTitulo:self.textFieldTitulo];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pushButtonSiguiente:(id)sender {
    ViewControllerStep3 *nextView = [[ViewControllerStep3 alloc] initWithNibName:nil bundle:nil];
    self.navigationController.titulo = self.textFieldTitulo.text;
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
