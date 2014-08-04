//
//  ValidatorIsNumber.h
//  EjemploWizard
//
//  Created by Leandro Fantin on 01/08/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Validator.h"

@interface ValidatorIsNumber : NSObject<Validator>

@property (nonatomic,retain) NSCharacterSet *nonNumberSet;

@end
