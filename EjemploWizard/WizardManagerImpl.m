//
//  WizardManagerImpl.m
//  EjemploWizard
//
//  Created by Leandro Fantin on 31/07/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "WizardManagerImpl.h"
#import "WelcomeViewControllerFlowPublishCar.h"
#import "TitleSubtitlePriceViewControllerFlowPublishCar.h"
#import "KilometerViewControllerFlowPublishCar.h"
#import "DescriptionViewControllerFlowPublishCar.h"
#import "PicturesViewControllerFlowPublishCar.h"
#import "PublicationViewControllerFlowPublishCar.h"
#import "WorkflowImpl.h"
#import "Validator.h"
#import "ValidatorNotEmpty.h"
#import "ValidatorIsNumber.h"


@implementation WizardManagerImpl


+ (instancetype)sharedInstance {
    
    static dispatch_once_t onceToken;
    static id instance;
    
    dispatch_once(&onceToken,^{
        instance = [[WizardManagerImpl alloc] init];
    });
    
    return instance;
}

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        NSString * class1 = NSStringFromClass([WelcomeViewControllerFlowPublishCar class]);
        NSString * class2 = NSStringFromClass([TitleSubtitlePriceViewControllerFlowPublishCar class]);
        NSString * class3 = NSStringFromClass([KilometerViewControllerFlowPublishCar class]);
        NSString * class4 = NSStringFromClass([DescriptionViewControllerFlowPublishCar class]);
        NSString * class5 = NSStringFromClass([PicturesViewControllerFlowPublishCar class]);
        NSString * class6 = NSStringFromClass([PublicationViewControllerFlowPublishCar class]);
        _workflow = [[WorkflowImpl alloc] init];
        [self.workflow addTransition:class1 to:class2];
        [self.workflow addTransition:class2 to:class3];
        [self.workflow addTransition:class3 to:class4];
        [self.workflow addTransition:class4 to:class5];
        [self.workflow addTransition:class5 to:class6];
    }
    return self;
}


/*+ (id) allocWithZone:(NSZone *)zone {
    NSString *reason = [NSString stringWithFormat:@"Se debe crear una instancia a travez de sharedInstance"];
    NSException *exception = [NSException exceptionWithName:@"Haciendo alloc a un singleton"
                                                     reason:reason
                                                   userInfo:nil];
    [exception raise];
    
    return nil;
}*/



- (AbstractViewControllerFlowPublishCar *) nextController:(NSString *) from;
{
    //obtengo el nombre del proximo controller
    NSString * nextControllesClassName = [self.workflow nextTransition:from];
    
    //instancio el proximo controller
    AbstractViewControllerFlowPublishCar * nextController = [[[NSClassFromString(nextControllesClassName) alloc] init] autorelease];
    
    return nextController;
}

- (void)dealloc
{
    [_workflow release];
    [super dealloc];
}

@end
