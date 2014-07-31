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


/*- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.textViewDescripcion.text = self.carInformation.descripcion;
    //Me atacho a los eventos del teclado
    [self registerForKeyboardNotifications];
}*/



- (IBAction)pushButtonSiguiente:(id)sender {
    [self doNextTransition];
}

/*- (void)dealloc
{
    [_carInformation release];
    [super dealloc];
}*/
@end
