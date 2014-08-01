//
//  AbstractViewControlWizard.h
//  EjemploWizard
//
//  Created by Leandro Fantin on 30/07/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewControlWizard.h"
#import "ValidatorImpl.h"
#import "WizardManager.h"


@interface AbstractViewControlWizard : UIViewController<ViewControlWizard,UIScrollViewDelegate>

@property (retain, nonatomic) CarInformationDTO * dto;

@property (retain, nonatomic) ValidatorImpl * validator;

@property (retain, nonatomic) id <WizardManager> wizardManager;

@property (assign, nonatomic) IBOutlet UIScrollView *scroll;

@property (assign, nonatomic) UIView * activeView;

- (IBAction)doNextTransition:(id)sender;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil;

@end
