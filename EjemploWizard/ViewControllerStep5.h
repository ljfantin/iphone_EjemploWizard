//
//  ViewControllerStep5.h
//  EjemploWizard
//
//  Created by Leandro Fantin on 15/07/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewControllerStep5 : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *buttonCancelar;
@property (weak, nonatomic) IBOutlet UIButton *buttonAceptar;
@property (weak, nonatomic) IBOutlet UILabel *labelTitulo;
@property (weak, nonatomic) IBOutlet UILabel *labelDescripcion;
@property (weak, nonatomic) IBOutlet UILabel *labelKilometraje;

@property (retain,nonatomic) NSString * titulo;
@property (retain,nonatomic) NSString * descripcion;
@property (retain,nonatomic) NSString * kilometraje;

- (IBAction)pushButtonAceptar:(id)sender;
- (IBAction)pushButtonCancelar:(id)sender;

@end
