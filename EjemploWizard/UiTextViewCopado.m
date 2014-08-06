//
//  UiTextViewCopado.m
//  EjemploWizard
//
//  Created by Leandro Fantin on 15/07/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "UiTextViewCopado.h"

@implementation UiTextViewCopado

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
    
    [layer setBorderWidth:0.1f];
    //[layer setBorderColor:[[UIColor grayColor] CGColor]];
    [super drawRect:rect];
}


@end
