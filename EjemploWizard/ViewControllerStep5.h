//
//  ViewControllerStep5.h
//  EjemploWizard
//
//  Created by Leandro Fantin on 15/07/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CarInformationDTO.h"

@interface ViewControllerStep5 : UIViewController

@property (retain, nonatomic) CarInformationDTO * carInformation;
@property (weak, nonatomic) IBOutlet UIButton *buttonCancelar;
@property (weak, nonatomic) IBOutlet UIButton *buttonAceptar;
@property (weak, nonatomic) IBOutlet UILabel *labelTitulo;
@property (weak, nonatomic) IBOutlet UILabel *labelDescripcion;
@property (weak, nonatomic) IBOutlet UILabel *labelKilometraje;

- (IBAction)pushButtonCancelar:(id)sender;
- (IBAction)pushButtonAceptar:(id)sender;

@end
