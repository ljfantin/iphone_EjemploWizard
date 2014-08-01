//
//  ViewControllerStep3.m
//  EjemploWizard
//
//  Created by Leandro Fantin on 15/07/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "ViewControllerStep3.h"
#import "ViewControllerStep4.h"
#import "UIButton+Copado.h"
#import "NSString+Utils.h"
#import "ValidatorImpl.h"


@interface ViewControllerStep3 ()
@property (nonatomic, retain) ValidatorImpl * validator;
@end

@implementation ViewControllerStep3

- (void) fillDto
{
    self.dto.kilometraje = self.textfieldKilometraje.text;
}

- (void) fillView
{
    self.textfieldKilometraje.text = self.dto.kilometraje;
}

- (IBAction)handleChangeKilometraje:(id)sender {
    UITextField* textField = (UITextField*)sender;
    self.buttonSiguiente.enabled=[self.validator isNotEmpty:textField.text];
}

#pragma mark Implementacion
- (BOOL) textField: (UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString: (NSString *)string {

    if (range.length == 1){
        return YES;
    }else{
        return [self.validator isNumber:string];
    }
}
@end
