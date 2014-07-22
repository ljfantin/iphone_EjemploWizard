//
//  ValidatorImpl.h
//  EjemploWizard
//
//  Created by Leandro Fantin on 22/07/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Validator.h"

@interface ValidatorImpl : NSObject<Validator>

@property (nonatomic,retain) NSCharacterSet *nonNumberSet;

@end
