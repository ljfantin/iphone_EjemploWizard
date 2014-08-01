//
//  ViewControllerStep1.m
//  EjemploWizard
//
//  Created by Leandro Fantin on 15/07/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "ViewControllerStep1.h"
#import "ViewControllerStep2.h"

@interface ViewControllerStep1 ()

@end

@implementation ViewControllerStep1


- (IBAction)pushButtonIngresar:(id)sender {
    //[self.navigationController]
    [self doNextTransition];
}


@end
