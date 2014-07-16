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
    //self.frame.size = CGSizeMake(150,30);
    ///[self frame.siz:CGSizeMake(30, 30)];
    
    //UIImage *buttonImage = [UIImage imageNamed:@"orangeButton.png"];
    //UIImage *buttonImageHighlight = [UIImage imageNamed:@"orangeButtonHighlight.png"];
    // Set the background for any states you plan to use
    //[saveButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
    //[saveButton setBackgroundImage:buttonImageHighlight forState:UIControlStateHighlighted];
}
@end
