//
//  ViewControllerStep5.h
//  EjemploWizard
//
//  Created by Leandro Fantin on 15/07/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CarInformationDTO.h"
#import "AbstractViewControllerFlowPublishCar.h"

@interface PublicationViewControllerFlowPublishCar : AbstractViewControllerFlowPublishCar<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>

- (IBAction)pushButtonCancelar:(id)sender;

//table
@property (assign, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)pageChanged:(id)sender;
@property (assign, nonatomic) IBOutlet UIPageControl *pageControl;
@property (retain, nonatomic) IBOutlet UIScrollView *scrollViewGallery;

@end
