//
//  WorkflowImpl.m
//  EjemploWizard
//
//  Created by Leandro Fantin on 30/07/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "WorkflowImpl.h"
#import "ViewControllerStep1.h"
#import "ViewControllerStep2.h"
#import "ViewControllerStep3.h"
#import "ViewControllerStep4.h"
#import "ViewControllerStep5.h"
#import "ViewControllerStep6.h"


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



@end
