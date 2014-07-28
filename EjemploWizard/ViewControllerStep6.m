//
//  ViewControllerStep5.m
//  EjemploWizard
//
//  Created by Leandro Fantin on 15/07/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "ViewControllerStep6.h"
#import "ViewControllerStep2.h"
#import "UIButton+Copado.h"
#import "NSString+Utils.h"
#import "TableViewHeader.h"

#define COUNT_SECTIONS 1

@interface ViewControllerStep6 ()
@property NSMutableDictionary * values;
@end

@implementation ViewControllerStep6

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title=@"Fin Publicacion";
        self.values = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //cargo el footer
    UIView * v = [[[NSBundle mainBundle] loadNibNamed:@"TableViewFooter" owner:self options:nil] firstObject];
    //seteo el footer
    self.tableView.tableFooterView = v;
    [self.buttonAceptar makeCopado];
    [self.buttonCancelar makeCopado];
    
    //cargo el header
    TableViewHeader * header = [[[NSBundle mainBundle] loadNibNamed:@"TableViewHeader" owner:self options:nil] firstObject];
    
    //TableViewHeader * header = [TableViewHeader initFromXib:nil];
    //seteo el header
    self.tableView.tableHeaderView = header;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //TODO BORRAR ESTO;
    self.carInformation = [[CarInformationDTO alloc] init];
    
    
    
    [self.carInformation reset];
    
    //TODO BORRAR TODO ESTO
    self.carInformation.titulo = @"Esto es un titulo";
    self.carInformation.subtitulo = @"Esto es un subtitulo";
    self.carInformation.descripcion = @"Esto es una descripcion";
    self.carInformation.kilometraje = @"60000";
    self.carInformation.precio = @"10000";
    UIImage * image1 = [UIImage imageNamed:@"image1.jpg"];
    UIImage * image2 = [UIImage imageNamed:@"image2.jpg"];
    UIImage * image3 = [UIImage imageNamed:@"image3.jpg"];

    [self.carInformation.gallery addObject:image1];
    [self.carInformation.gallery addObject:image2];
    [self.carInformation.gallery addObject:image3];
    
    TableViewHeader * header = (TableViewHeader * ) self.tableView.tableHeaderView;
    [header loadGallery:self.carInformation.gallery];
    
    [self.values setObject:self.carInformation.titulo forKey:@"Titulo"];
    [self.values setObject:self.carInformation.subtitulo forKey:@"Subtitulo"];
    [self.values setObject:self.carInformation.precio forKey:@"Precio"];
    [self.values setObject:self.carInformation.descripcion forKey:@"Descripcion"];
    [self.values setObject:self.carInformation.precio forKey:@"Precio"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pushButtonAceptar:(id)sender {
    [self.carInformation reset];
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (IBAction)pushButtonCancelar:(id)sender {
    for (UIViewController * viewController in self.navigationController.viewControllers) {
        if ([viewController isKindOfClass:[ViewControllerStep2 class]]) {
            [self.navigationController popToViewController:viewController animated:YES];
        }
    }
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return COUNT_SECTIONS;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.values count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellDetail"];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:@"cellDetail"];
        
        NSString * key = [self.values.keyEnumerator.allObjects objectAtIndex:indexPath.row];
        cell.textLabel.text = key;
        cell.detailTextLabel.text = [self.values valueForKey:key];
    }
    return cell;
}


#pragma mark - Implementacion de UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)sender
{
    TableViewHeader * header = (TableViewHeader * ) self.tableView.tableHeaderView;
    CGFloat pageWidth = sender.frame.size.width;
    int page = floor((sender.contentOffset.x - pageWidth / 2) / pageWidth)+1;
    [header updateImage:page];
}
@end
