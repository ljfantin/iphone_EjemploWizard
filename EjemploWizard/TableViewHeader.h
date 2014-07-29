//
//  TableViewHeader.h
//  EjemploWizard
//
//  Created by Leandro Fantin on 25/07/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewHeader : UIView

@property (assign, nonatomic) IBOutlet UIPageControl *pageControl;
@property (assign, nonatomic) IBOutlet UIScrollView *scroll;


//+ (id)initFromXib:(NSString *) xib;
- (void)loadGallery:(NSArray*)images;
@end
