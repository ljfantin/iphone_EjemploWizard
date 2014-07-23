//
//  ViewControllerImage.m
//  EjemploWizard
//
//  Created by Leandro Fantin on 22/07/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "ViewControllerStep5.h"
#import "UIButton+Copado.h"
#import "UIPhotoCollectionViewCell.h"

@interface ViewControllerStep5 ()

@end

@implementation ViewControllerStep5

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        ///BOORRRARRRRR
        self.carInformation = [[CarInformationDTO alloc] init];
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Hago que se vea lindo el boton
    [self.buttonSiguiente makeCopado];
    [self.buttonAddImage makeCopado];
    
    //seteo el content size
    [[self scroll] setContentSize:[[self view] frame].size];

    //inicializo la gelaria
    [self setupCollectionView];
}

-(void)setupCollectionView {
    [self.collectionViewGallery registerClass:[UIPhotoCollectionViewCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addImagePushButton:(id)sender {
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle: nil
                                                             delegate:self
                                                    cancelButtonTitle: @"Cancel"
                                               destructiveButtonTitle: nil
                                                    otherButtonTitles: @"Tomar una foto", @"Elegir foto del carrete", nil];
    [actionSheet showInView:self.view];
    //[actionSheet release];
}


-(void)choosePhotoFromExistingImages
{
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypePhotoLibrary])
    {
        UIImagePickerController *controller = [[UIImagePickerController alloc] init];
        controller.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        controller.allowsEditing = NO;
        controller.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType: UIImagePickerControllerSourceTypePhotoLibrary];
        controller.delegate = self;
        [self.navigationController presentViewController: controller animated: YES completion: nil];
    }
}

- (void)takeNewPhotoFromCamera
{
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera])
    {
        UIImagePickerController *controller = [[UIImagePickerController alloc] init];
        controller.sourceType = UIImagePickerControllerSourceTypeCamera;
        controller.allowsEditing = NO;
        controller.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType: UIImagePickerControllerSourceTypeCamera];
        controller.delegate = self;
        [self.navigationController presentViewController: controller animated: YES completion: nil];
    }
}

#pragma mark Implementacion protocolo UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
            NSLog(@"Saca foto");
            [self takeNewPhotoFromCamera];
            break;
        case 1:
            NSLog(@"Elige foto de las imagenes");
            [self choosePhotoFromExistingImages];
            break;
        default:
            break;
    }
}

#pragma mark Implementacion protocolo UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [self.navigationController dismissViewControllerAnimated: YES completion: nil];
    UIImage *image = [info valueForKey: UIImagePickerControllerOriginalImage];
    [self.carInformation.gallery addObject:image];
    //NSData *imageData = UIImageJPEGRepresentation(image, 0.1);
    ////self.imageView1.image = image;
    
    [self.collectionViewGallery performBatchUpdates:^{
        NSArray* itemPaths = [self.collectionViewGallery indexPathsForSelectedItems];
        [self.collectionViewGallery insertItemsAtIndexPaths:self.carInformation.gallery];
        // Delete the items from the data source.
        //[self deleteItemsFromDataSourceAtIndexPaths:itemPaths];
        
        // Now delete the items from the collection view.
        //[self.collectionView deleteItemsAtIndexPaths:tempArray];
    } completion:nil];

    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker;
{
    [self.navigationController dismissViewControllerAnimated: YES completion: nil];
}


#pragma mark Implementacion protocolo UICollectionViewDataSource
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.carInformation.gallery count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UIPhotoCollectionViewCell *cell = (UIPhotoCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    UIImage *image = [self.carInformation.gallery objectAtIndex:indexPath.row];
    [cell updateCell:image];
    return cell;
}

@end
