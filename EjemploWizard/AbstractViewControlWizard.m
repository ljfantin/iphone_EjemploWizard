//
//  AbstractViewControlWizard.m
//  EjemploWizard
//
//  Created by Leandro Fantin on 30/07/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "AbstractViewControlWizard.h"
#import "WizardManagerImpl.h"

@implementation AbstractViewControlWizard

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _wizardManager = [[WizardManagerImpl alloc] init];
        self.title=[self.wizardManager getTitle:NSStringFromClass([self class])];
        _validator = [[ValidatorImpl alloc] init];
    }
    return self;
}


- (void) doNextTransition;
{
    
    AbstractViewControlWizard * nextController = [self.wizardManager nextController:NSStringFromClass([self class])];
    
    //obtengo el dto con los valores colocados
    CarInformationDTO * dto = [self fillDto];
    
    //le seteo el dto al proximo controller
    [nextController setDto:dto];
    
    //pusheo el controller
    [self.navigationController pushViewController:nextController animated:YES];
    
    //hago un release
    [nextController release];
}

- (CarInformationDTO*) fillDto
{
    
    //habria que llenar con los valores de los fields
    return self.dto;
}

- (CarInformationDTO*) getDto
{
    return self.dto;
}

- (void) setDto:(CarInformationDTO*) dto
{
    //ver si tengo que hacerlo a mano
    self.dto = dto;
}

- (BOOL) validateValues {
    return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initScroll];
    //Me atacho a los eventos del teclado
    [self registerForKeyboardNotifications];
}

- (void) viewDidUnload
{
    [super viewDidLoad];
    //Me desatacho de los eventos del teclado
    [self unregisterForKeyboardNotifications];
}

- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardDidHideNotification object:nil];
    
}

- (void)unregisterForKeyboardNotifications
{
    //me desatacho los eventos del teclado
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillShowNotification
                                                  object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardDidHideNotification
                                                  object:nil];
}


#pragma mark - Notificaciones del teclado
- (void) keyboardWasShown:(NSNotification *)notificacion
{
    //Nota: El ScrollView no tiene que estar en autolayout para que funcione
    NSDictionary* info = [notificacion userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    //Es como un padding, y lo pones del tamanio del teclado para que active las barras de scroll
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0);
    self.scroll.contentInset = contentInsets;
    self.scroll.scrollIndicatorInsets = contentInsets;
    
    //muevo las scrollbars hasta el active view que tenia el foco del usuario
    CGRect aRect = self.view.frame;
    aRect.size.height = kbSize.height;
    if (!CGRectContainsPoint(aRect, self.activeView.frame.origin) ) {
        CGRect rect = self.activeView.frame;
        [self.scroll scrollRectToVisible:rect animated:YES];
    }
}

- (void) keyboardWillBeHidden:(NSNotification *)notificacion
{
    //cuando el teclado desaparece, le sacamos el "padding" al scrollview
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    self.scroll.contentInset = contentInsets;
    self.scroll.scrollIndicatorInsets = contentInsets;
}

- (void) initScroll
{
    //seteo el content size
    [[self scroll] setContentSize:[[self view] frame].size];
    
    //Creo identificador de gestos.
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scrollViewPulsado)];
    [tapRecognizer setCancelsTouchesInView:NO];
    //agrego al scroll view el identificador de gestos
    [[self scroll] addGestureRecognizer:tapRecognizer];
    
    [tapRecognizer release];
}

- (void)dealloc
{
    [_wizardManager release];
    [_validator release];
    [_dto release];
    [super dealloc];
}

- (id)findFirstResponder
{
    if (self.isFirstResponder) {
        return self;
    }
    for (UIView *subView in self.view.subviews) {
        if ([subView isFirstResponder]) {
            return subView;
        }
    }
    return nil;
}

- (void) scrollViewPulsado
{
    [[self view] endEditing:YES];
}

@end
