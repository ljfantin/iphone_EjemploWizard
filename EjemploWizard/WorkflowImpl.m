//
//  WorkflowImpl.m
//  EjemploWizard
//
//  Created by Leandro Fantin on 30/07/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "WorkflowImpl.h"



@implementation WorkflowImpl


- (instancetype)init
{
    self = [super init];
    if (self) {
        _transitions = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (NSString *) nextTransition:(NSString*)from
{
    NSString * toClassName = [self transitions][from];
    return toClassName;
}

- (void) addTransition:(NSString *)from to:(NSString *)to;
{
    [self transitions][from] = to;
}

- (void)dealloc
{
    [_transitions release];
    [super dealloc];
}


@end
