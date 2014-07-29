//
//  ViewControllerStep1.h
//  EjemploWizard
//
//  Created by Leandro Fantin on 15/07/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CarInformationDTO.h"

@interface ViewControllerStep1 : UIViewController

@property (retain, nonatomic) CarInformationDTO * carInformation;
@property (assign, nonatomic) IBOutlet UIButton *buttonIngresar;

- (IBAction)pushButtonIngresar:(id)sender;

@end
