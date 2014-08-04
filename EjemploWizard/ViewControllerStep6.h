//
//  ViewControllerStep5.h
//  EjemploWizard
//
//  Created by Leandro Fantin on 15/07/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CarInformationDTO.h"
#import "AbstractViewControlWizard.h"

@interface ViewControllerStep6 : AbstractViewControlWizard<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>

- (IBAction)pushButtonCancelar:(id)sender;

//table
@property (assign, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)pageChanged:(id)sender;
@property (assign, nonatomic) IBOutlet UIPageControl *pageControl;
@property (assign, nonatomic) IBOutlet UIButton *buttonAceptar;
@property (assign, nonatomic) IBOutlet UIButton *buttonCancelar;
@property (assign, nonatomic) IBOutlet UIButton *botonAceptar;
@property (assign, nonatomic) IBOutlet UIButton *botonCancelar;

@end
