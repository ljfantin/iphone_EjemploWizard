//
//  ApplicationPropertiesImpl.h
//  EjemploWizard
//
//  Created by Leandro Fantin on 31/07/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ApplicationProperties.h"

@interface ApplicationPropertiesImpl : NSObject<ApplicationProperties>

@property (nonatomic,retain) NSMutableDictionary * dictionary;

@end
