//
//  ViewControllerStep4.h
//  EjemploWizard
//
//  Created by Leandro Fantin on 15/07/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewControllerStep4 : UIViewController<UITextViewDelegate>
- (IBAction)pushButtonSiguiente:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *buttonSiguiente;
@property (weak, nonatomic) IBOutlet UITextView *textViewDescripcion;

@end
