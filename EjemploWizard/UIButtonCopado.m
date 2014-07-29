//
//  UIButtonCopado.m
//  EjemploWizard
//
//  Created by Leandro Fantin on 29/07/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "UIButtonCopado.h"

@implementation UIButtonCopado

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.*/
- (void)drawRect:(CGRect)rect
{
    CALayer *layer = [self layer];
    [layer setMasksToBounds:YES];
    [layer setCornerRadius:5.0f];
    
    [layer setBorderWidth:2.0f];
    [layer setBorderColor:[[UIColor blackColor] CGColor]];
    [super drawRect:rect];
}

@end
