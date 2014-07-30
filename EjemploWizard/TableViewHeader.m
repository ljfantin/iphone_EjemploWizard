//
//  TableViewHeader.m
//  EjemploWizard
//
//  Created by Leandro Fantin on 25/07/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "TableViewHeader.h"

@implementation TableViewHeader

/*  + (id)initFromXib:(NSString *) xib
{
    NSString * xibName = @"TableViewHeader";
    if (xib!=nil) {
        xibName = xib;
    }
    
    TableViewHeader * instance = nil;
    NSArray *arrayOfViews = [[NSBundle mainBundle] loadNibNamed:@"TableViewHeader" owner:nil options:nil];
        //[self addSubview:self.categoryNameLabel];
        
        if ([arrayOfViews count] < 1) {
            return nil;
        }
        
        if (![[arrayOfViews objectAtIndex:0] isKindOfClass:[self class]]) {
            return nil;
        }
        
        instance = [arrayOfViews objectAtIndex:0];
    
    return instance;
}
*/

- (void)loadGallery:(NSArray*)images
{
    for (NSUInteger i = 0; i < [images count]; i++) {
        //We'll create an imageView object in every 'page' of our scrollView.
        CGRect frame;
        frame.origin.x = self.scroll.frame.size.width * i;
        frame.origin.y = 0;
        frame.size = self.scroll.frame.size;
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
        imageView.image = [images objectAtIndex:i];
        [self.scroll addSubview:imageView];
        [imageView release];
    }
    //Set the content size of our scrollview according to the total width of our imageView objects.
    self.scroll.contentSize = CGSizeMake(self.frame.size.width * [images count], self.scroll.frame.size.height);

    self.pageControl.currentPage = 0;
    self.pageControl.numberOfPages = [images count];
}



@end
