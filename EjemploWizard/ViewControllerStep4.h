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

@interface ViewControllerStep4 : UIViewController<UITextViewDelegate,UIScrollViewDelegate,UITextFieldDelegate>

@property (assign, nonatomic) IBOutlet UIScrollView *scroll;
@property (retain, nonatomic) CarInformationDTO * carInformation;

@property (assign, nonatomic) IBOutlet UiTextViewCopado *textViewDescripcion;


- (IBAction)pushButtonSiguiente:(id)sender;
@property (assign, nonatomic) IBOutlet UIButton *buttonSiguiente;

@end
