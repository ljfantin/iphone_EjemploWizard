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
#import "ViewControllerStep6.h"
#import "FooterGallery.h"
#import "ApplicationPropertiesImpl.h"

@interface ViewControllerStep5 ()
@property (nonatomic) NSInteger cantMaxFotos;
@end

@implementation ViewControllerStep5


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //inicializo la galeria
    [self setupCollectionView];
    // ver esto no funciona el Singleton
    ApplicationPropertiesImpl * appProperties = [[ApplicationPropertiesImpl alloc] init];
    self.cantMaxFotos = [[appProperties getProperty:@"CANT_MAX_FOTOS"] intValue];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //desabilito el boton si seleccione la cantidad maxima de fotos
    if ([self.dto.gallery count]==self.cantMaxFotos)
        self.buttonAddImage.enabled = false;
}

-(void)setupCollectionView {
    //registro la clase de la celda
    [self.collectionViewGallery registerClass:[UIPhotoCollectionViewCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
    
    //registro la clase del header
    [self.collectionViewGallery registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView"];
    
    //registro la clase del footer
    [self.collectionViewGallery registerClass:[FooterGallery class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter
        withReuseIdentifier:@"FooterView"];
}

- (IBAction)addImagePushButton:(id)sender {
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle: nil
                                                             delegate:self
                                                    cancelButtonTitle: @"Cancel"
                                               destructiveButtonTitle: nil
                                                    otherButtonTitles: @"Tomar una foto", @"Elegir foto del carrete", nil];
    [actionSheet showInView:self.view];
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
        //se libera
        [controller release];
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
        //se libera
        [controller release];
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
    //agarro la imagen del uiimagepicker
    UIImage *image = [info valueForKey: UIImagePickerControllerOriginalImage];
    //agrego la imagen a la galeria
    [self.dto.gallery addObject:image];
    //libero la imagen
    //[image release];
    
    //Actualizo el collectionview
    // Parche que saque de aca: http://stackoverflow.com/questions/19199985/invalid-update-invalid-number-of-items-on-uicollectionview
    if (self.dto.gallery.count == 1) {
      [self.collectionViewGallery reloadData];
    } else {
        [self.collectionViewGallery performBatchUpdates:^{
            //como [NSMutableArray array] es un factory method, entonces tiene autorelease
            NSMutableArray * arrayWithIndex = [NSMutableArray array];
            NSInteger index = [self.dto.gallery count]-1;
            [arrayWithIndex addObject:[NSIndexPath indexPathForRow:index inSection:0]];
            [self.collectionViewGallery insertItemsAtIndexPaths:arrayWithIndex];
        } completion:nil];
    }
    //desabilito el boton si seleccione la cantidad maxima de fotos
    if ([self.dto.gallery count]==self.cantMaxFotos)
        self.buttonAddImage.enabled = false;
        
    [self.collectionViewGallery reloadSections:[NSIndexSet indexSetWithIndex:0]];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker;
{
    [self.navigationController dismissViewControllerAnimated:YES completion: nil];
}


#pragma mark Implementacion protocolo UICollectionViewDataSource
//Devuelve la cantidad de secciones
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

//Devuelve la cantidad de celdas en la seccion
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.dto.gallery count];
}

//Devuelve la celda
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UIPhotoCollectionViewCell *cell = (UIPhotoCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    UIImage *image = [self.dto.gallery objectAtIndex:indexPath.row];
    [cell updateCell:image];
    return cell;
}


- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if (kind == UICollectionElementKindSectionHeader) {
        
        UICollectionReusableView *reusableview = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
        
        if (reusableview==nil) {
            reusableview=[[[UICollectionReusableView alloc] initWithFrame:CGRectMake(0, 0, 320, 44)] autorelease];
        }
        
        UILabel *label=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
        label.text=@"Agrega fotos de tu vehiculo";
        [reusableview addSubview:label];
        //libero el label
        [label release];
        //libero la vista
        //[reusableview release];
        return reusableview;
    } else  {
        if (kind == UICollectionElementKindSectionFooter) {
            
            FooterGallery *reusableview = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"FooterView" forIndexPath:indexPath];
            
            if (reusableview==nil) {
                reusableview=[[[FooterGallery alloc] initWithFrame:CGRectMake(0, 0, 320, 44)] autorelease];
            }
            [reusableview updateCantidadFotos: self.cantMaxFotos - self.dto.gallery.count];
            //libero la vista
            //[reusableview release];
            return reusableview;
        }
    }
    return nil;
}


@end
