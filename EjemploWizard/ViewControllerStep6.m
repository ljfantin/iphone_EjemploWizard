//
//  ViewControllerStep5.m
//  EjemploWizard
//
//  Created by Leandro Fantin on 15/07/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "ViewControllerStep6.h"
#import "ViewControllerStep2.h"
#import "UIButton+Copado.h"
#import "NSString+Utils.h"

@interface ViewControllerStep6 ()

@end

@implementation ViewControllerStep6

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title=@"Fin Publicacion";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.buttonAceptar makeCopado];
    [self.buttonCancelar makeCopado];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSString * descripcion = [self.carInformation.descripcion trim];
    
    if ([descripcion length]==0)  {
        [self.labelDescripcion removeFromSuperview];
        [self.labelTittleDescripcion removeFromSuperview];
    }   else {
        [self.view addSubview:self.labelTittleDescripcion];
        [self.view addSubview:self.labelDescripcion];
    }
    
    self.labelTitulo.text=self.carInformation.titulo;
    self.labelSubtitulo.text=self.carInformation.subtitulo;
    self.labelPrecio.text=self.carInformation.precio;
    self.labelDescripcion.text=self.carInformation.descripcion;
    self.labelKilometraje.text=self.carInformation.kilometraje;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pushButtonAceptar:(id)sender {
    [self.carInformation reset];
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
