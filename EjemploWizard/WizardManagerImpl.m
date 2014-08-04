//
//  WizardManagerImpl.m
//  EjemploWizard
//
//  Created by Leandro Fantin on 31/07/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "WizardManagerImpl.h"
#import "ViewControllerStep1.h"
#import "ViewControllerStep2.h"
#import "ViewControllerStep3.h"
#import "ViewControllerStep4.h"
#import "ViewControllerStep5.h"
#import "ViewControllerStep6.h"
#import "WorkflowImpl.h"
#import "Validator.h"
#import "ValidatorNotEmpty.h"
#import "ValidatorIsNumber.h"


@implementation WizardManagerImpl

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        NSString * class1 = NSStringFromClass([ViewControllerStep1 class]);
        NSString * class2 = NSStringFromClass([ViewControllerStep2 class]);
        NSString * class3 = NSStringFromClass([ViewControllerStep3 class]);
        NSString * class4 = NSStringFromClass([ViewControllerStep4 class]);
        NSString * class5 = NSStringFromClass([ViewControllerStep5 class]);
        NSString * class6 = NSStringFromClass([ViewControllerStep6 class]);
        _workflow = [[WorkflowImpl alloc] init];
        [self.workflow addTransition:class1 to:class2];
        [self.workflow addTransition:class2 to:class3];
        [self.workflow addTransition:class3 to:class4];
        [self.workflow addTransition:class4 to:class5];
        [self.workflow addTransition:class5 to:class6];
        
        self.titles=@{class1:@"step1.title",
                       class2:@"step2.title",
                       class3:@"step3.title",
                       class4:@"step4.title",
                       class5:@"step5.title",
                       class6:@"step6.title"};
        
        id<Validator> validatorNotEmpty = [[ValidatorNotEmpty alloc] init];
        id<Validator> validatorIsNumber = [[ValidatorIsNumber alloc] init];
        
        // validators paso 2;
        NSArray * validatorsTitulo = @[validatorNotEmpty];
        NSArray * validatorsSubtitulo = @[validatorNotEmpty];
        NSArray * validatorsPrecio = @[validatorNotEmpty,validatorIsNumber];
        NSDictionary * validatorsStep2 = @{@"titulo": validatorsTitulo,@"subtitulo" : validatorsSubtitulo, @"precio": validatorsPrecio};
        
        // validators paso 3;
        NSArray * validatorsKilometraje = @[validatorNotEmpty,validatorIsNumber];
        NSDictionary * validatorsStep3 = @{@"kilometraje": validatorsKilometraje};
       
        
        self.mappingValidations = @{class2: validatorsStep2, class3: validatorsStep3};
    }
    return self;
}

- (AbstractViewControlWizard *) nextController:(NSString *) from;
{
    //obtengo el nombre del proximo controller
    NSString * nextControllesClassName = [self.workflow nextTransition:from];
    
    //instancio el proximo controller
    AbstractViewControlWizard * nextController = [[[NSClassFromString(nextControllesClassName) alloc] init] autorelease];
    
    return nextController;
}

- (NSString *) getTitle:(NSString *) from
{
    return NSLocalizedString(self.titles[from],@"");
}

- (NSDictionary *) getValidators:(NSString *) from
{
    return self.mappingValidations[from];
}

@end
