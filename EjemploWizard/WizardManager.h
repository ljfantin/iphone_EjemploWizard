//
//  WizardManager.h
//  EjemploWizard
//
//  Created by Leandro Fantin on 31/07/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <Foundation/Foundation.h>
@class AbstractViewControlWizard;

@protocol WizardManager <NSObject>

- (AbstractViewControlWizard *) nextController:(NSString *) from;

// Se puede hacer esto en objective c?
//+ (instancetype)sharedInstance;

@end
