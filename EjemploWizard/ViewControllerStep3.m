//
//  ViewControllerStep3.m
//  EjemploWizard
//
//  Created by Leandro Fantin on 15/07/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "ViewControllerStep3.h"
#import "ViewControllerStep4.h"
#import "UIButton+Copado.h"
#import "NSString+Utils.h"
#import "ValidatorImpl.h"


@interface ViewControllerStep3 ()
@property (nonatomic, retain) ValidatorImpl * validator;
@end

@implementation ViewControllerStep3

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title=@"Paso 2";
        self.validator = [[ValidatorImpl alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.buttonSiguiente makeCopado];
}

- (void)viewWillAppear:(BOOL)animated
{
    self.textfieldKilometraje.text = self.carInformation.kilometraje;
    [self handleChangeKilometraje:self.textfieldKilometraje];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pushButtonSiguiente:(id)sender {
    ViewControllerStep4 *nextView = [[ViewControllerStep4 alloc] initWithNibName:nil bundle:nil];
    self.carInformation.kilometraje = self.textfieldKilometraje.text;
    nextView.carInformation = self.carInformation;
    [self.navigationController pushViewController:nextView animated:YES];
}

- (IBAction)handleChangeKilometraje:(id)sender {
    UITextField* textField = (UITextField*)sender;
    self.buttonSiguiente.enabled=[self.validator isNotEmpty:textField.text];
}

#pragma mark Implementacion
- (BOOL) textField: (UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString: (NSString *)string {

    if (range.length == 1){
        return YES;
    }else{
        return [self.validator isNumber:string];
    }
}

@end
