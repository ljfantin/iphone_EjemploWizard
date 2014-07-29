//
//  ViewControllerStep3.h
//  EjemploWizard
//
//  Created by Leandro Fantin on 15/07/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CarInformationDTO.h"

@interface ViewControllerStep3 : UIViewController<UITextFieldDelegate>

@property (assign, nonatomic) IBOutlet UITextField *textfieldKilometraje;
@property (assign, nonatomic) IBOutlet UIButton *buttonSiguiente;
@property (retain, nonatomic) CarInformationDTO * carInformation;

- (IBAction)pushButtonSiguiente:(id)sender;
- (IBAction)handleChangeKilometraje:(id)sender;

@end
