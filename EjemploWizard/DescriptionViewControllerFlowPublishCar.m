//
//  ViewControllerStep4.m
//  EjemploWizard
//
//  Created by Leandro Fantin on 15/07/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "DescriptionViewControllerFlowPublishCar.h"
#import "PicturesViewControllerFlowPublishCar.h"
#import "UIButton+Copado.h"

@interface DescriptionViewControllerFlowPublishCar ()
@end

@implementation DescriptionViewControllerFlowPublishCar


- (void) fillDto
{
    self.dto.descripcion = self.textViewDescripcion.text;
}

- (void) fillView
{
    self.textViewDescripcion.text = self.dto.descripcion;
}

@end
