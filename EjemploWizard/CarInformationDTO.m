//
//  CarInformation.m
//  EjemploWizard
//
//  Created by Leandro Fantin on 16/07/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "CarInformationDTO.h"

@implementation CarInformationDTO

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.gallery = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void) reset   {
    
    self.titulo = @"";
    self.subtitulo = @"";
    self.descripcion = @"";
    self.kilometraje = @"";
    self.precio = @"";
}
@end
