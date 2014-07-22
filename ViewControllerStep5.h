//
//  ViewControllerImage.h
//  EjemploWizard
//
//  Created by Leandro Fantin on 22/07/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewControllerStep5 : UIViewController<UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
- (IBAction)addImagePushButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *imageView1;
@property (weak, nonatomic) IBOutlet UIButton *buttonAddImage;
@property (weak, nonatomic) IBOutlet UIButton *buttonSiguiente;
@property (weak, nonatomic) IBOutlet UIScrollView *scroll;

@end
