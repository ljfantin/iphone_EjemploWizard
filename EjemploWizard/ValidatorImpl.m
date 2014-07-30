//
//  ValidatorImpl.m
//  EjemploWizard
//
//  Created by Leandro Fantin on 22/07/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "ValidatorImpl.h"
#import "NSString+Utils.h"


@implementation ValidatorImpl

//charset todos los caracteres menos los numeros

//= [[NSCharacterSet characterSetWithCharactersInString:@"0123456789."] invertedSet];

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.nonNumberSet = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789."] invertedSet];
    }
    return self;
}


-(BOOL) isNotEmpty:(NSString*)field
{
    return([[field trim] length]>0);
}


-(BOOL) isNumber:(NSString*)field
{
    return [field stringByTrimmingCharactersInSet:self.nonNumberSet].length > 0;
}

- (void)dealloc
{
    [_nonNumberSet release];
    [super dealloc];
}

@end
