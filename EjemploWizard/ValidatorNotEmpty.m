//
//  ValidatorNotEmpty.m
//  EjemploWizard
//
//  Created by Leandro Fantin on 01/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "ValidatorNotEmpty.h"
#import "NSString+Utils.h"


@implementation ValidatorNotEmpty

-(BOOL) isValid:(NSString*)field
{
    return([[field trim] length]>0);
}

@end
