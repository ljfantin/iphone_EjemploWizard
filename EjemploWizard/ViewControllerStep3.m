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
#import "ValidatorNotEmpty.h"
#import "ValidatorIsNumber.h"

@interface ViewControllerStep3 ()

@property (nonatomic,retain) ValidatorIsNumber * validatorIsNumber;
@property (nonatomic,retain) ValidatorNotEmpty * validatorNotEmpty;

@end

@implementation ViewControllerStep3

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

        self.validatorIsNumber = [[[ValidatorIsNumber alloc] init] autorelease];
        self.validatorNotEmpty = [[[ValidatorNotEmpty alloc] init] autorelease];
    }
    return self;
}

- (void) fillDto
{
    self.dto.kilometraje = self.textfieldKilometraje.text;
}

- (void) fillView
{
    self.textfieldKilometraje.text = self.dto.kilometraje;
}

- (IBAction)handleChangeKilometraje:(id)sender
{
    self.buttonSiguiente.enabled = [self validateChange];
}

#pragma mark Implementacion
- (BOOL) textField: (UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString: (NSString *)string {

    if (range.length == 1){
        return YES;
    }else{
        return ([[self.validatorIsNumber isValid:string] count]==0);
    }
}

- (BOOL) validate
{
    //Deberian mostrarse los errores
    NSMutableArray * errors = [[[NSMutableArray alloc] init] autorelease];
    
    [errors addObjectsFromArray:[self.validatorNotEmpty isValid:self.textfieldKilometraje.text]];
    [errors addObjectsFromArray:[self.validatorIsNumber isValid:self.textfieldKilometraje.text]];
    
    return ([errors count]==0);
}

- (BOOL) validateChange
{
    //por ahora llamo al mismo metodo, pero la idea es que tenga su propia implementacion
    return [self validate];
}



@end
