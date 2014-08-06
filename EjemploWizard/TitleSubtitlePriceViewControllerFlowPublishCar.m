//
//  ViewControllerStep2.m
//  EjemploWizard
//
//  Created by Leandro Fantin on 15/07/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "TitleSubtitlePriceViewControllerFlowPublishCar.h"
#import "KilometerViewControllerFlowPublishCar.h"
#import "UIButton+Copado.h"
#import "NSString+Utils.h"
#import "ValidatorIsNumber.h"
#import "ValidatorNotEmpty.h"


@interface TitleSubtitlePriceViewControllerFlowPublishCar ()

@property (nonatomic,retain) ValidatorIsNumber * validatorIsNumber;
@property (nonatomic,retain) ValidatorNotEmpty * validatorNotEmpty;

@end

@implementation TitleSubtitlePriceViewControllerFlowPublishCar

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

        self.dto = [[[CarInformationDTO alloc] init] autorelease];
        self.validatorIsNumber = [[[ValidatorIsNumber alloc] init] autorelease];
        self.validatorNotEmpty = [[[ValidatorNotEmpty alloc] init] autorelease];
    }
    return self;
}

- (void) fillView
{
    self.textFieldTitulo.text = self.dto.titulo;
    self.textFieldSubtitulo.text = self.dto.subtitulo;
    self.textFieldPrecio.text = self.dto.precio;
}

- (void) fillDto
{
    self.dto.titulo = self.textFieldTitulo.text;
    self.dto.subtitulo = self.textFieldSubtitulo.text;
    self.dto.precio = self.textFieldPrecio.text;
}

- (IBAction)textFieldChangeSubtitulo:(id)sender {
    
    self.buttonSiguiente.enabled = [self validateChange];
    [self updateButonSiguienteState];
}

- (IBAction)textFieldChangeTitulo:(id)sender {
    
    self.buttonSiguiente.enabled = [self validateChange];
    [self updateButonSiguienteState];
}

- (IBAction)textFieldChangePrecio:(id)sender {
    
    self.buttonSiguiente.enabled = [self validateChange];
    [self updateButonSiguienteState];
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
        return ([[self.validatorIsNumber isValid:string] count]==0);
    }
}

- (BOOL) validate
{
    //Deberian mostrarse los errores
    NSMutableArray * errors = [[[NSMutableArray alloc] init] autorelease];

    [errors addObjectsFromArray:[self.validatorNotEmpty isValid:self.textFieldTitulo.text]];
    [errors addObjectsFromArray:[self.validatorNotEmpty isValid:self.textFieldSubtitulo.text]];
    [errors addObjectsFromArray:[self.validatorNotEmpty isValid:self.textFieldPrecio.text]];
    [errors addObjectsFromArray:[self.validatorIsNumber isValid:self.textFieldPrecio.text]];

    return ([errors count]==0);
}
        
- (BOOL) validateChange
{
    //por ahora llamo al mismo metodo, pero la idea es que tenga una propia implementacion
    //que valide menos cosas
    return [self validate];
}




@end
