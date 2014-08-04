//
//  Error.m
//  EjemploWizard
//
//  Created by Leandro Fantin on 03/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "Error.h"

@implementation Error

+ (id) errorWith:(ERROR_TYPE)type message:(NSString *) message
{
    Error * error = [[[Error alloc] init] autorelease];
    error.errorType = type;
    error.message = message;
    return error;
}
@end
