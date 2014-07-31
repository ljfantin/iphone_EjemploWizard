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

- (NSString *) getTitle:(NSString *) from;
- (AbstractViewControlWizard *) nextController:(NSString *) from;

@end
