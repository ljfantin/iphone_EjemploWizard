//
//  ApplicationProperties.h
//  EjemploWizard
//
//  Created by Leandro Fantin on 31/07/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ApplicationProperties <NSObject>

-(NSString *) getProperty:(NSString *) key;

@end
