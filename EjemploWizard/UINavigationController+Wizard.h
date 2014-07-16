//
//  UINavigationController+Wizard.h
//  EjemploWizard
//
//  Created by Leandro Fantin on 16/07/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (Wizard)

@property (nonatomic,retain) NSString * titulo;
@property (nonatomic,retain) NSString * descripcion;
@property (nonatomic,retain) NSString * kilometraje;

- (void) reset;

@end
