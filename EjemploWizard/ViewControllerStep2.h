//
//  ViewControllerStep2.h
//  EjemploWizard
//
//  Created by Leandro Fantin on 15/07/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewControllerStep2 : UIViewController
- (IBAction)handleChangeTitulo:(id)sender;
//- (IBAction)handleChangeTittle:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *textFieldTitulo;
- (IBAction)pushButtonSiguiente:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *buttonSiguiente;

@end
