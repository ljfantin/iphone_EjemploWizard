//
//  ApplicationPropertiesImpl.m
//  EjemploWizard
//
//  Created by Leandro Fantin on 31/07/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "ApplicationPropertiesImpl.h"

@implementation ApplicationPropertiesImpl

- (instancetype)init
{
    self = [super init];
    if (self) {
        _dictionary = @{@"CANT_MAX_FOTOS":@"6"};
    }
    return self;
}
-(id) getProperty:(NSString *) key
{
    return self.dictionary[key];
}

@end
