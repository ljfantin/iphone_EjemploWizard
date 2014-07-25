//
//  ViewControllerStep5.h
//  EjemploWizard
//
//  Created by Leandro Fantin on 15/07/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CarInformationDTO.h"

@interface ViewControllerStep6 : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintKilometrajeSubtitulo;
//carInformation
@property (retain, nonatomic) CarInformationDTO * carInformation;
//botones
@property (weak, nonatomic) IBOutlet UIButton *buttonCancelar;
@property (weak, nonatomic) IBOutlet UIButton *buttonAceptar;
//labels
@property (weak, nonatomic) IBOutlet UILabel *labelTitulo;
@property (weak, nonatomic) IBOutlet UILabel *labelDescripcion;
@property (weak, nonatomic) IBOutlet UILabel *labelKilometraje;
@property (weak, nonatomic) IBOutlet UILabel *descripcion;
@property (weak, nonatomic) IBOutlet UILabel *labelTittleTitulo;
@property (weak, nonatomic) IBOutlet UILabel *labelTittleDescripcion;
@property (weak, nonatomic) IBOutlet UILabel *labelTittleKilometro;
@property (weak, nonatomic) IBOutlet UILabel *labelSubtitulo;
@property (weak, nonatomic) IBOutlet UILabel *labelPrecio;


- (IBAction)pushButtonCancelar:(id)sender;
- (IBAction)pushButtonAceptar:(id)sender;


@end
