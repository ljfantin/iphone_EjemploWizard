//
//  UIButton+Copado.m
//  EjemploWizard
//
//  Created by Leandro Fantin on 15/07/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "UIButton+Copado.h"

@implementation UIButton (Copado)

- (void) makeCopado   {

    // Round button corners
    CALayer *layer = [self layer];
    [layer setMasksToBounds:YES];
    [layer setCornerRadius:5.0f];
    
    // Apply a 1 pixel, black border around Buy Button
    [layer setBorderWidth:2.0f];
    [layer setBorderColor:[[UIColor blackColor] CGColor]];

}
@end
