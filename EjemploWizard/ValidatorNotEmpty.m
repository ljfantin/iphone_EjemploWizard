//
//  ValidatorNotEmpty.m
//  EjemploWizard
//
//  Created by Leandro Fantin on 01/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "ValidatorNotEmpty.h"
#import "NSString+Utils.h"
#import "Error.h"


@implementation ValidatorNotEmpty

-(NSArray*) isValid:(NSString*)field
{
    NSMutableArray * errores =  [NSMutableArray array];
    if ([[field trim] length] == 0)    {
        //De alguna manera habria que indicar cual es la field que se esta validando
        Error * error = [Error errorWith:OBLIGATORY message:@"The field is empty"];
        [errores addObject:error];
    }
    return errores;
}

@end
