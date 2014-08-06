//
//  AbstractViewControlWizard.h
//  EjemploWizard
//
//  Created by Leandro Fantin on 30/07/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FlowPublishCar.h"
#import "WizardManager.h"


@interface AbstractViewControllerFlowPublishCar : UIViewController<FlowPublishCar,UIScrollViewDelegate>

@property (retain, nonatomic) CarInformationDTO * dto;

@property (retain, nonatomic) id <WizardManager> wizardManager;

@property (assign, nonatomic) IBOutlet UIScrollView *scroll;

@property (assign, nonatomic) UIView * activeView;

@property (assign, nonatomic) IBOutlet UIButton *buttonSiguiente;


- (IBAction)doNextTransition:(id)sender;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil;

- (void) updateButonSiguienteState;

@end
