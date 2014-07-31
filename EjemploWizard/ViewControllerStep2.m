//
//  ViewControllerStep2.m
//  EjemploWizard
//
//  Created by Leandro Fantin on 15/07/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "ViewControllerStep2.h"
#import "ViewControllerStep3.h"
#import "UIButton+Copado.h"
#import "NSString+Utils.h"
#import "ValidatorImpl.h"

@interface ViewControllerStep2 ()
@property BOOL notEmptyTextFieldTitulo;
@property BOOL notEmptyTextFieldSubtitulo;
@property BOOL notEmptyTextFieldPrecio;
@end

@implementation ViewControllerStep2

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

        self.dto = [[[CarInformationDTO alloc] init] autorelease];
        self.notEmptyTextFieldTitulo = NO;
        self.notEmptyTextFieldSubtitulo = NO;
        self.notEmptyTextFieldPrecio = NO;
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    self.textFieldTitulo.text = self.dto.titulo;
    self.textFieldSubtitulo.text = self.dto.subtitulo;
    self.textFieldPrecio.text = self.dto.precio;
}

- (IBAction)pushButtonSiguiente:(id)sender {
    
    [super doNextTransition];
}

- (IBAction)textFieldChangeSubtitulo:(id)sender {
    
    UITextField * textField = (UITextField *) sender;
    self.notEmptyTextFieldSubtitulo = [self.validator isNotEmpty:textField.text];
    self.buttonSiguiente.enabled=(self.notEmptyTextFieldSubtitulo &&
                                  self.notEmptyTextFieldTitulo &&
                                  self.notEmptyTextFieldPrecio);
}

- (IBAction)textFieldChangeTitulo:(id)sender {
    
    UITextField * textField = (UITextField *) sender;
    self.notEmptyTextFieldTitulo = [self.validator isNotEmpty:textField.text];
    self.buttonSiguiente.enabled=(self.notEmptyTextFieldSubtitulo &&
                                  self.notEmptyTextFieldTitulo &&
                                  self.notEmptyTextFieldPrecio);
}

- (IBAction)textFieldChangePrecio:(id)sender {
    
    UITextField * textField = (UITextField *) sender;
    self.notEmptyTextFieldPrecio = [self.validator isNotEmpty:textField.text];
    self.buttonSiguiente.enabled=(self.notEmptyTextFieldSubtitulo &&
                                  self.notEmptyTextFieldTitulo &&
                                  self.notEmptyTextFieldPrecio);
}

//
#pragma mark Implementacion
- (BOOL) textField: (UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString: (NSString *)string {
    
    //Si no es el precio entonces le doy ok
    if (![textField isEqual:self.textFieldPrecio])  {
        return YES;
    }
    
    if (range.length == 1){
        return YES;
    }else{
        return [self.validator isNumber:string];
    }
}

@end
