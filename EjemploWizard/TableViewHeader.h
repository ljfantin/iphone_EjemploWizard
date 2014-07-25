//
//  TableViewHeader.h
//  EjemploWizard
//
//  Created by Leandro Fantin on 25/07/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewHeader : UIView
+ (id)initFromXib:(NSString *) xib;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
- (IBAction)changePage:(id)sender;

@property (retain, nonatomic) NSArray * images;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@end
