//
//  ViewControllerImage.h
//  EjemploWizard
//
//  Created by Leandro Fantin on 22/07/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CarInformationDTO.h"

@interface ViewControllerStep5 : UIViewController<UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UICollectionViewDataSource, UICollectionViewDelegate>

- (IBAction)addImagePushButton:(id)sender;

- (IBAction)siguientePushButton:(id)sender;

@property (assign, nonatomic) IBOutlet UIButton *buttonAddImage;
@property (assign, nonatomic) IBOutlet UIButton *buttonSiguiente;
@property (assign, nonatomic) IBOutlet UIScrollView *scroll;
@property (assign, nonatomic) IBOutlet UICollectionView *collectionViewGallery;

@property (retain, nonatomic) CarInformationDTO * carInformation;

@end
