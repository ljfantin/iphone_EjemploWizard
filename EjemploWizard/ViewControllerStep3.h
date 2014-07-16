//
//  ViewControllerStep3.h
//  EjemploWizard
//
//  Created by Leandro Fantin on 15/07/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewControllerStep3 : UIViewController

@property (nonatomic,retain) NSString * titulo;

- (IBAction)pushButtonSiguiente:(id)sender;
- (IBAction)handleChangeTextFieldDescripcion:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *buttonSiguiente;

@end
