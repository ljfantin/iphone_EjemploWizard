//
//  UINavigationController+Wizard.m
//  EjemploWizard
//
//  Created by Leandro Fantin on 16/07/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "UINavigationController+Wizard.h"
#import <objc/runtime.h>

@implementation UINavigationController (Wizard)


- (void)setTitulo:(NSString *)titulo
{
    objc_setAssociatedObject(self, @selector(titulo), titulo, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)titulo
{
    return objc_getAssociatedObject(self, @selector(titulo));
}

- (void)setDescripcion:(NSString *)descripcion
{
    objc_setAssociatedObject(self, @selector(descripcion), descripcion, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)descripcion
{
    return objc_getAssociatedObject(self, @selector(descripcion));
}

- (void)setKilometraje:(NSString *)kilometraje
{
    objc_setAssociatedObject(self, @selector(kilometraje), kilometraje, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)kilometraje
{
    return objc_getAssociatedObject(self, @selector(kilometraje));
}

- (void) reset  {
    self.titulo = @"";
    self.descripcion = @"";
    self.kilometraje = @"";
}

@end
