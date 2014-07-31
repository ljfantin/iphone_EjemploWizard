//
//  WorkflowImpl.h
//  EjemploWizard
//
//  Created by Leandro Fantin on 30/07/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Workflow.h"

@interface WorkflowImpl : NSObject<Workflow>

@property (nonatomic,retain) NSMutableDictionary * transitions;

@end
