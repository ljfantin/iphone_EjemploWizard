//
//  ViewControllerStep1.m
//  EjemploWizard
//
//  Created by Leandro Fantin on 15/07/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "ViewControllerStep1.h"
#import "ViewControllerStep2.h"
#import "UIButton+Copado.h"

@interface ViewControllerStep1 ()

@end

@implementation ViewControllerStep1

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //[self.buttonIngresar makeCopado];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pushButtonIngresar:(id)sender {
    //[self.navigationController]
    ViewControllerStep2 *nextView = [[ViewControllerStep2 alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:nextView animated:YES];
}
@end
