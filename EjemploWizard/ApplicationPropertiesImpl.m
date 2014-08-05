//
//  ApplicationPropertiesImpl.m
//  EjemploWizard
//
//  Created by Leandro Fantin on 31/07/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "ApplicationPropertiesImpl.h"

@implementation ApplicationPropertiesImpl

static ApplicationPropertiesImpl * instance = nil;

+ (ApplicationPropertiesImpl*)sharedInstance {
    
    static dispatch_once_t onceToken = 0;
    
    dispatch_once(&onceToken,^{
        instance = [[[self alloc] init] retain];
    });
    
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _dictionary = @{@"CANT_MAX_FOTOS": @"6"};
    }
    return self;
}

-(NSString *) getProperty:(NSString *) key
{
    return[self.dictionary objectForKey:key];
}


- (void)dealloc {
    [_dictionary release];
    [super dealloc];
}


@end
