//
//  Workflow.h
//  EjemploWizard
//
//  Created by Leandro Fantin on 30/07/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Workflow <NSObject>

//por simplicidad presupone que solo puede tener una posible transicion, por eso solo devuelve un id
- (NSString *) nextTransition:(NSString*)from;

@optional
- (void) addTransition:(NSString *)from to:(NSString *)to;
- (void) deleteTransition:(NSString *)from to:(NSString *)to;

@end
