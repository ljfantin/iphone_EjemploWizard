//
//  TableViewHeader.m
//  EjemploWizard
//
//  Created by Leandro Fantin on 25/07/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "TableViewHeader.h"

@implementation TableViewHeader

+ (id)initFromXib:(NSString *) xib
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

- (void)loadGallery:(NSArray*)images
{
    self.images = images;
    for (int i = 0; i < [self.images count]; i++) {
        //We'll create an imageView object in every 'page' of our scrollView.
        CGRect frame;
        frame.origin.x = self.scroll.frame.size.width * i;
        frame.origin.y = 0;
        frame.size.width = 200;
        frame.size.height=  200;//self.scroll.frame.size;
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
        imageView.image = [self.images objectAtIndex:i];
        [self.scroll addSubview:imageView];
    }
    //Set the content size of our scrollview according to the total width of our imageView objects.
    self.scroll.contentSize = CGSizeMake(self.frame.size.width * [self.images count], self.scroll.frame.size.height);
    self.pageControl.currentPage = 0;
    self.pageControl.numberOfPages = [self.images count];
}


#pragma mark - UIScrollView Delegate
/*- (void)scrollViewDidScroll:(UIScrollView *)sender
{
    // Update the page when more than 50% of the previous/next page is visible
    CGFloat pageWidth = self.scrollView.frame.size.width;
    int page = floor((self.scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    self.pageControl.currentPage = page;
}*/


- (void) updateImage:(NSInteger)page
{
    self.pageControl.currentPage = page;
}




@end
