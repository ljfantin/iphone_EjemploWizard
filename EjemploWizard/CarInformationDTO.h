//
//  CarInformation.h
//  EjemploWizard
//
//  Created by Leandro Fantin on 16/07/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CarInformationDTO : NSObject

@property (nonatomic,retain) NSString * titulo;
@property (nonatomic,retain) NSString * subtitulo;
@property (nonatomic,retain) NSString * descripcion;
@property (nonatomic,retain) NSString * kilometraje;
@property (nonatomic,retain) NSString * precio;

-(void) reset;

@end
