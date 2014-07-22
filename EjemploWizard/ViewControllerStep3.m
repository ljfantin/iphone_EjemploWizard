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


@interface ViewControllerStep3 ()

@end

@implementation ViewControllerStep3

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title=@"Paso 2";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.buttonSiguiente makeCopado];
    //VER SI VA ACA O EN EL WILL APPEAR
    self.textfieldKilometraje.delegate = self;
}

- (void)viewWillAppear:(BOOL)animated
{
    //////////////hay que ponerlo en el metodo appears
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
    //saco los espacios en blanco y los saltos de linea
    NSString * titulo = [textField.text trim];
    //habilito el boton si tengo al menos un caracter
    self.buttonSiguiente.enabled=(titulo.length > 0);
}

#pragma mark Implementacion
- (BOOL) textField: (UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString: (NSString *)string {
    
    NSCharacterSet *nonNumberSet = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789."] invertedSet];
    
    if (range.length == 1){
        return YES;
    }else{
        return ([string stringByTrimmingCharactersInSet:nonNumberSet].length > 0);
    }
    
}

@end
