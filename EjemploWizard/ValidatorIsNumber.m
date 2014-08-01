//
//  ValidatorIsNumber.m
//  EjemploWizard
//
//  Created by Leandro Fantin on 01/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "ValidatorIsNumber.h"

@implementation ValidatorIsNumber

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.nonNumberSet = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789."] invertedSet];
    }
    return self;
}

-(BOOL) isValid:(NSString*)field
{
    return [field stringByTrimmingCharactersInSet:self.nonNumberSet].length > 0;
}

@end
