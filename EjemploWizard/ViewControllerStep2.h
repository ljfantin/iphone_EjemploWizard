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
@property (assign, nonatomic) IBOutlet UIScrollView *scroll;

//textfield para saber que textfield esta activo
@property (assign, nonatomic) UITextField * activeField;
@property (retain, nonatomic) CarInformationDTO * carInformation;

//textfields
@property (assign, nonatomic) IBOutlet UITextField *textFieldTitulo;
@property (assign, nonatomic) IBOutlet UITextField *textFieldSubtitulo;
@property (assign, nonatomic) IBOutlet UITextField *textFieldPrecio;
@property (assign, nonatomic) IBOutlet UIButton *buttonSiguiente;

//actions
- (IBAction)pushButtonSiguiente:(id)sender;
- (IBAction)textFieldChangePrecio:(id)sender;
- (IBAction)textFieldChangeSubtitulo:(id)sender;
- (IBAction)textFieldChangeTitulo:(id)sender;

@end
