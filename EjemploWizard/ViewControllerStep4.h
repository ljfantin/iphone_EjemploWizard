//
//  ViewControllerStep4.h
//  EjemploWizard
//
//  Created by Leandro Fantin on 15/07/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CarInformationDTO.h"

@interface ViewControllerStep4 : UIViewController<UITextViewDelegate>

@property (retain, nonatomic) CarInformationDTO * carInformation;
@property (weak, nonatomic) IBOutlet UIButton *buttonSiguiente;
@property (weak, nonatomic) IBOutlet UITextView * textViewDescripcion;

- (IBAction)pushButtonSiguiente:(id)sender;

@end
