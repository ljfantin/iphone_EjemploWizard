//
//  ViewControllerStep4.m
//  EjemploWizard
//
//  Created by Leandro Fantin on 15/07/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "ViewControllerStep4.h"
#import "ViewControllerStep5.h"
#import "UIButton+Copado.h"

@interface ViewControllerStep4 ()
@property UITextField * activeField;
@end

@implementation ViewControllerStep4


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.textViewDescripcion.text = self.dto.descripcion;
}

- (void) fillDto
{
    self.dto.descripcion = self.textViewDescripcion.text;
}


- (IBAction)pushButtonSiguiente:(id)sender {
    [self doNextTransition];
}

@end
