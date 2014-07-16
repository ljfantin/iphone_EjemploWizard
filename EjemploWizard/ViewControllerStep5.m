//
//  ViewControllerStep5.m
//  EjemploWizard
//
//  Created by Leandro Fantin on 15/07/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "ViewControllerStep5.h"
#import "UIButton+Copado.h"

@interface ViewControllerStep5 ()

@end

@implementation ViewControllerStep5

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
    self.labelTitulo.text=self.titulo;
    self.labelDescripcion.text=self.descripcion;
    self.labelKilometraje.text=self.kilometraje;
 
    [self.buttonAceptar makeCopado];
    [self.buttonCancelar makeCopado];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pushButtonAceptar:(id)sender {
}

- (IBAction)pushButtonCancelar:(id)sender {
    
}
@end
