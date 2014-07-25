//
//  ViewControllerStep6TableView.m
//  EjemploWizard
//
//  Created by Leandro Fantin on 24/07/14.
//  Copyright (c) 2014 mercadolibre. All rights reserved.
//

#import "ViewControllerStep6TableView.h"
#define SECCION_IMAGE 0
#define SECCION_DETAIL 1
#define SECCION_BOTONES 2
#define COUNT_SECTIONS 3



@interface ViewControllerStep6TableView ()
@property NSArray labels = [[NSArray alloc] initWithObjects:
@"Titulo",
@"A relationship with no trust is like a cell phone with no service, all you can do is play games.",
@"People should stop talking about their problem and start thinking about the solution.",
@"Dear Chuck Norris, Screw you. I can grill burgers under water. Sincerely, Spongebob Squarepants.",
@"My arms will always be open for you, they will never close, not unless you're in them.",
nil];
@end

@implementation ViewControllerStep6TableView

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return COUNT_SECTIONS;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case SECCION_IMAGE:return 1;
        case SECCION_DETAIL:return 4;
        case SECCION_BOTONES:return 1;
        default:break;
    }
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case SECCION_IMAGE:[self getCellForImages:tableView];
        case SECCION_DETAIL:[self getCellForDetail:tableView row:indexPath.row];
        case SECCION_BOTONES:[self getCellForButtons:tableView];
        default:break;
    }
    
    return nil;
}

- (UITableViewCell *) getCellForDetail:(UITableView *)tableView row:(NSInteger)row {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellDetail"];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cellDetail"];
        cell.textLabel.text =
    }
    return cell;
}

- (UITableViewCell *) getCellForButtons:(UITableView *)tableView {
    
}

- (UITableViewCell *) getCellForImages:(UITableView *)tableView {
    
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

@end
