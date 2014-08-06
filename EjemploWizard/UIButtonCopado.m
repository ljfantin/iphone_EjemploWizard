//
//  UIButtonCopado.m
//  EjemploWizard
//
//  Created by Leandro Fantin on 29/07/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "UIButtonCopado.h"
#import "UIColor+FlowCarPalette.h"

@implementation UIButtonCopado

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
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
    //#428BCA
    //[UIColor colorWithRed:66 green:139 blue:202 alpha:1];
    //[layer setBackgroundColor: [[UIColor colorWithRed:0.25 green:0.54 blue:0.79 alpha:1] CGColor]];
    [layer setBorderColor: [[UIColor navyBlueColor] CGColor]];
    
    //53 =0.2
    //126 + 0.49
    //189 0.73
    
    self.titleLabel.textColor=[UIColor navyBlueColor];
    //[UIColor colorWithRed:0.25 green:0.54 blue:0.79 alpha:1];
    //[self setTitleColor:[UIColor colorWithRed:0.25 green:0.54 blue:0.79 alpha:1] forState:UIControlStateDisabled];
    //[self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [super drawRect:rect];
}



@end
