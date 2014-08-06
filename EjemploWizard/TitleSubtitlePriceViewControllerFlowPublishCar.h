//
//  ViewControllerStep2.h
//  EjemploWizard
//
//  Created by Leandro Fantin on 15/07/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CarInformationDTO.h"
#import "AbstractViewControllerFlowPublishCar.h"


@interface TitleSubtitlePriceViewControllerFlowPublishCar : AbstractViewControllerFlowPublishCar<UITextFieldDelegate>


//textfields
@property (assign, nonatomic) IBOutlet UITextField *textFieldTitulo;
@property (assign, nonatomic) IBOutlet UITextField *textFieldSubtitulo;
@property (assign, nonatomic) IBOutlet UITextField *textFieldPrecio;

//actions
- (IBAction)textFieldChangePrecio:(id)sender;
- (IBAction)textFieldChangeSubtitulo:(id)sender;
- (IBAction)textFieldChangeTitulo:(id)sender;

@end
