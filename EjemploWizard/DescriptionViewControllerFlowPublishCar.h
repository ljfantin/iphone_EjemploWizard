//
//  ViewControllerStep4.h
//  EjemploWizard
//
//  Created by Leandro Fantin on 15/07/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CarInformationDTO.h"
#import "UiTextViewCopado.h"
#import "AbstractViewControllerFlowPublishCar.h"

@interface DescriptionViewControllerFlowPublishCar : AbstractViewControllerFlowPublishCar<UITextViewDelegate,UITextFieldDelegate>

@property (assign, nonatomic) IBOutlet UiTextViewCopado *textViewDescripcion;

@end
