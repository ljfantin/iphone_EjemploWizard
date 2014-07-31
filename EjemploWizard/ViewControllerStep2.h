//
//  ViewControllerStep2.h
//  EjemploWizard
//
//  Created by Leandro Fantin on 15/07/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CarInformationDTO.h"
#import "AbstractViewControlWizard.h"


@interface ViewControllerStep2 : AbstractViewControlWizard<UITextFieldDelegate>

//textfield para saber que textfield esta activo
@property (assign, nonatomic) UITextField * activeField;

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
