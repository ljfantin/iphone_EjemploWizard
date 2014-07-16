//
//  ViewControllerStep2.h
//  EjemploWizard
//
//  Created by Leandro Fantin on 15/07/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CarInformationDTO.h"

@interface ViewControllerStep2 : UIViewController

@property (retain, nonatomic) CarInformationDTO * carInformation;
@property (weak, nonatomic) IBOutlet UITextField *textFieldTitulo;
@property (weak, nonatomic) IBOutlet UIButton *buttonSiguiente;

- (IBAction)handleChangeTitulo:(id)sender;
- (IBAction)pushButtonSiguiente:(id)sender;

@end
