//
//  ViewControllerStep2.h
//  EjemploWizard
//
//  Created by Leandro Fantin on 15/07/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CarInformationDTO.h"

@interface ViewControllerStep2 : UIViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scroll;

//textfield para saber que textfield esta activo
@property (weak, nonatomic) UITextField * activeField;

@property (retain, nonatomic) CarInformationDTO * carInformation;
//textfields
@property (weak, nonatomic) IBOutlet UITextField *textFieldTitulo;
@property (weak, nonatomic) IBOutlet UITextField *textFieldSubtitulo;
@property (weak, nonatomic) IBOutlet UITextField *textFieldPrecio;
@property (weak, nonatomic) IBOutlet UIButton *buttonSiguiente;

//actions
- (IBAction)pushButtonSiguiente:(id)sender;
- (IBAction)textFieldChangePrecio:(id)sender;
- (IBAction)textFieldChangeSubtitulo:(id)sender;
- (IBAction)textFieldChangeTitulo:(id)sender;

@end
