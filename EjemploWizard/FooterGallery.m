//
//  FooterGallery.m
//  EjemploWizard
//
//  Created by Leandro Fantin on 23/07/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "FooterGallery.h"

@implementation FooterGallery

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSArray *arrayOfViews = [[NSBundle mainBundle] loadNibNamed:@"FooterGallery" owner:self options:nil];
        //[self addSubview:self.categoryNameLabel];
        
        if ([arrayOfViews count] < 1) {
            return nil;
        }
        
        if (![[arrayOfViews objectAtIndex:0] isKindOfClass:[self class]]) {
            return nil;
        }
        
        //necesito que sea own del objeto por eso le pongo el retain
        self = [[arrayOfViews objectAtIndex:0] retain];
    }
    return self;
}



- (void) updateCantidadFotos:(NSInteger)newCant
{
    NSLog(@"%i Cantidad de fotos disponibles:",newCant);
    self.labelCantidadFotos.text =  [NSString stringWithFormat:@"%i fotos disponibles", newCant];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
