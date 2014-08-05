//
//  ViewControllerImage.h
//  EjemploWizard
//
//  Created by Leandro Fantin on 22/07/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CarInformationDTO.h"
#import "AbstractViewControlWizard.h"

@interface ViewControllerStep5 : AbstractViewControlWizard<UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UICollectionViewDataSource, UICollectionViewDelegate>

- (IBAction)addImagePushButton:(id)sender;

@property (assign, nonatomic) IBOutlet UIButton *buttonAddImage;
@property (assign, nonatomic) IBOutlet UICollectionView *collectionViewGallery;


@end
