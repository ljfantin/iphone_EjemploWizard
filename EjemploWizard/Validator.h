//
//  Validator.h
//  EjemploWizard
//
//  Created by Leandro Fantin on 22/07/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Validator <NSObject>

//Devuelve un array de errores
-(NSArray*) isValid:(NSString*)field;

@end
