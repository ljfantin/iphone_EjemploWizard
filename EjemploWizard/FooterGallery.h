//
//  FooterGallery.h
//  EjemploWizard
//
//  Created by Leandro Fantin on 23/07/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FooterGallery : UICollectionReusableView
@property (weak, nonatomic) IBOutlet UILabel *labelCantidadFotos;

- (void) updateCantidadFotos:(NSInteger)newCant;
@end
