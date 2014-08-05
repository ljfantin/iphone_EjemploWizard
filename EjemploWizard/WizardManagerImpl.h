//
//  WizardManagerImpl.h
//  EjemploWizard
//
//  Created by Leandro Fantin on 31/07/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WizardManager.h"
#import "Workflow.h"

@interface WizardManagerImpl : NSObject<WizardManager>

@property (retain,nonatomic) id<Workflow> workflow;

+ (instancetype)sharedInstance;

@end
