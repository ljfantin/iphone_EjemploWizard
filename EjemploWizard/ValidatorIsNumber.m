//
//  ValidatorIsNumber.m
//  EjemploWizard
//
//  Created by Leandro Fantin on 01/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "ValidatorIsNumber.h"
#import "Error.h"

@implementation ValidatorIsNumber

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.nonNumberSet = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789."] invertedSet];
    }
    return self;
}

-(NSArray*) isValid:(NSString*)field
{
    NSArray * errores = nil;
    if ([field stringByTrimmingCharactersInSet:self.nonNumberSet].length > 0)    {
        //De alguna manera habria que indicar cual es la field que se esta validando
        Error * error = [Error errorWith:IS_NUMBER message:@"The field is not number"];
        errores = @[error];
    }
    return errores;
}

@end
