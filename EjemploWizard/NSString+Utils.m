//
//  NSString+Utils.m
//  EjemploWizard
//
//  Created by Leandro Fantin on 22/07/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "NSString+Utils.h"

@implementation NSString (Utils)

-(NSString *) trim
{
 return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

@end
