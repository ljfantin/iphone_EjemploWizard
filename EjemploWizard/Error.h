//
//  Error.h
//  EjemploWizard
//
//  Created by Leandro Fantin on 03/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Error : NSObject

typedef NS_ENUM(NSUInteger, ERROR_TYPE) { OBLIGATORY, IS_NUMBER, MAX_LONG};

@property (nonatomic,retain) NSString * message;
@property (nonatomic) ERROR_TYPE errorType;

+ (id) errorWith:(ERROR_TYPE)type message:(NSString *) message;

@end
