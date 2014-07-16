//
//  ViewControllerStep5.m
//  EjemploWizard
//
//  Created by Leandro Fantin on 15/07/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "ViewControllerStep5.h"
#import "ViewControllerStep2.h"
#import "UIButton+Copado.h"
#import "UINavigationController+Wizard.h"

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
    [self.buttonAceptar makeCopado];
    [self.buttonCancelar makeCopado];

    self.labelTitulo.text=self.navigationController.titulo;
    self.labelDescripcion.text=self.navigationController.descripcion;
    self.labelKilometraje.text=self.navigationController.kilometraje;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pushButtonAceptar:(id)sender {
    [self.navigationController reset];
    [self.navigationController popToRootViewControllerAnimated:YES];
}
- (IBAction)pushButtonCancelar:(id)sender {
    for (UIViewController * viewController in self.navigationController.viewControllers) {
        if ([viewController isKindOfClass:[ViewControllerStep2 class]]) {
            [self.navigationController popToViewController:viewController animated:YES];
        }
    }
}
@end
