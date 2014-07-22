//
//  Validator.h
//  EjemploWizard
//
//  Created by Leandro Fantin on 22/07/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Validator <NSObject>

-(BOOL) isNotEmpty:(NSString*)field;
-(BOOL) isNumber:(NSString*)field;
@end
