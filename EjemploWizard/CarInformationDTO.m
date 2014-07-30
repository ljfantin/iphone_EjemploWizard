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
       // <#statements#>
       _gallery = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void) reset   {
    
    self.titulo = @"";
    self.subtitulo = @"";
    self.descripcion = @"";
    self.kilometraje = @"";
    self.precio = @"";
    [self.gallery removeAllObjects];
}

- (void)dealloc
{
    [_titulo release];
    [_subtitulo release];
    [_descripcion release];
    [_kilometraje release];
    [_precio release];
    [super dealloc];
}
@end
