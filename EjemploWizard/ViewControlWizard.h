//
//  ViewControlWizard.h
//  EjemploWizard
//
//  Created by Leandro Fantin on 30/07/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CarInformationDTO.h"

@protocol ViewControlWizard <NSObject>

- (void) fillDto;
- (void) fillView;
- (CarInformationDTO*) getDto;
- (void) setDto:(CarInformationDTO*) dto;
//- (BOOL) validateValues;
- (void) doNextTransition;
- (IBAction)doNextTransition:(id)sender;
- (BOOL) validate;
- (BOOL) validateChange;
- (NSString *) getTitle;
@end
