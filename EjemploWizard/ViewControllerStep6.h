//
//  ViewControllerStep5.h
//  EjemploWizard
//
//  Created by Leandro Fantin on 15/07/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CarInformationDTO.h"

@interface ViewControllerStep6 : UIViewController<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>

//carInformation
@property (retain, nonatomic) CarInformationDTO * carInformation;

//table
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

- (IBAction)pageChanged:(id)sender;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

- (IBAction)pushButtonCancelar:(id)sender;
- (IBAction)pushButtonAceptar:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *buttonAceptar;
@property (weak, nonatomic) IBOutlet UIButton *buttonCancelar;

@end
