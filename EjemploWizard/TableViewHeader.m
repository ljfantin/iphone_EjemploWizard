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
    if (self) {
        NSArray *arrayOfViews = [[NSBundle mainBundle] loadNibNamed:@"TableViewHeader" owner:self options:nil];
        //[self addSubview:self.categoryNameLabel];
        
        if ([arrayOfViews count] < 1) {
            return nil;
        }
        
        if (![[arrayOfViews objectAtIndex:0] isKindOfClass:[self class]]) {
            return nil;
        }
        
        instance = [arrayOfViews objectAtIndex:0];
    }
    return instance;
}

- (IBAction)changePage:(id)sender {
    self.pageControl.
}
@end
