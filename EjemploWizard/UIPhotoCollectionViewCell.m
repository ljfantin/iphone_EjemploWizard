//
//  UIPhotoCollectionViewCell.m
//  EjemploWizard
//
//  Created by Leandro Fantin on 22/07/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "UIPhotoCollectionViewCell.h"

@implementation UIPhotoCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //Ver esto nose que onda
        // Initialization code
        NSArray *arrayOfViews = [[NSBundle mainBundle] loadNibNamed:@"UIPhotoCollectionViewCell" owner:self options:nil];
        
        if ([arrayOfViews count] < 1) {
            return nil;
        }
        
        if (![[arrayOfViews objectAtIndex:0] isKindOfClass:[UICollectionViewCell class]]) {
            return nil;
        }
        
        self = [arrayOfViews objectAtIndex:0];
        /*self.backgroundColor = [UIColor whiteColor];
        self.layer.shadowColor = [UIColor blackColor].CGColor;
        self.layer.shadowRadius = 5.0f;
        self.layer.shadowOffset = CGSizeMake(2.0f, 2.0f);
        self.layer.shadowOpacity = 0.5f;
        
        // Selected background view
        UIView *backgroundView = [[UIView alloc]initWithFrame:self.bounds];
        backgroundView.layer.borderColor = [[UIColor colorWithRed:0.529 green:0.808 blue:0.922 alpha:1]CGColor];
        backgroundView.layer.borderWidth = 10.0f;
        self.selectedBackgroundView = backgroundView;
        
        // set content view
        CGRect frame  = CGRectMake(self.bounds.origin.x+5, self.bounds.origin.y+5, self.bounds.size.width-10, self.bounds.size.height-10);
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
        self.imageView = imageView;
        //[imageView release];
        self.imageView.contentMode = UIViewContentModeScaleAspectFill ;
        self.imageView.clipsToBounds = YES;
        [self.contentView addSubview:self.imageView];*/

    }
    
    return self;
}

- (void) updateCell:(UIImage*)image;
{
    [self.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [self.imageView setImage:image];
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
