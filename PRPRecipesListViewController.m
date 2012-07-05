//
//  PRPRecipesListViewController.m
//  Recipes
//
//  Created by Marcelo Lucas S Ribeiro on 27/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PRPRecipesListViewController.h"
#import "PRPRecipe.h"
#import "PRPViewController.h"
#import "PRPRecipeSource.h"
#import "PRPRecipeEditorViewController.h"

@interface PRPRecipesListViewController ()

@end

@implementation PRPRecipesListViewController

@synthesize dataSource;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return [self.dataSource recipeCount];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  static NSString *CellIdentifier = @"Cell";
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
  if (cell == nil) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
  }
  PRPRecipe *recipe = [self.dataSource recipeAtIndex:indexPath.row];
  cell.textLabel.text = [recipe title];
  cell.imageView.image = [recipe image];
  cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ %@",
                               [recipe preparationTime],
                               NSLocalizedString(@"minutes", nil)];
  return cell;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
      [self.dataSource deleteRecipeAtIndex:indexPath.row];
      [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
    }   
}

- (void)finishedEditingRecipe:(PRPRecipe *)recipe {
    NSUInteger row = [self.dataSource indexOfRecipe:recipe];
    NSIndexPath *path = [NSIndexPath indexPathForRow:row inSection:0];
    [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:path] withRowAnimation:UITableViewRowAnimationLeft];
}

#pragma mark - Table view delegate

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([@"presentRecipeDetail" isEqualToString:segue.identifier]) {
        NSIndexPath *index = [self.tableView indexPathForCell:sender];
        PRPRecipe *recipe = [self.dataSource recipeAtIndex:index.row];
        [[segue destinationViewController] setRecipe:recipe];
    }
    if([@"addNewRecipe" isEqualToString:segue.identifier]) {
        PRPRecipe *recipe = [self.dataSource createNewRecipe];
        UIViewController *topVC = [[segue destinationViewController] topViewController];
        PRPRecipeEditorViewController *editor = (PRPRecipeEditorViewController *)topVC;
        editor.recipeListVC = self;
        editor.recipe = recipe;
    }
}

@end
