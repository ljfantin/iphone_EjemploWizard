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
@property (weak, nonatomic) IBOutlet UITextField *textFieldTitulo;
@property (weak, nonatomic) IBOutlet UIButton *buttonSiguiente;
@property (weak, nonatomic) IBOutlet UITextField *textFieldSubtitulo;
@property (weak, nonatomic) IBOutlet UITextField *textFieldPrecio;

- (IBAction)pushButtonSiguiente:(id)sender;

@end
