/***
 * Excerpted from "iOS SDK Development",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/adios for more book information.
***/
#import "PRPRecipesListViewController.h"
#import "PRPViewController.h"
#import "PRPRecipe.h"
#import "PRPRecipeEditorViewController.h"

@implementation PRPRecipesListViewController

@synthesize dataSource = _dataSource;

#pragma mark - View lifecycle

- (void)viewDidLoad {
  [super viewDidLoad];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
  return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  [[NSNotificationCenter defaultCenter]
   addObserver:self selector:@selector(recipesChanged:)
   name:PRPRecipesDidChangeNotification object:self.dataSource];
}

- (void)viewWillDisappear:(BOOL)animated {
  [super viewWillDisappear:animated];
  [[NSNotificationCenter defaultCenter]
   removeObserver:self
   name:PRPRecipesDidChangeNotification
   object:self.dataSource];
}

- (void)recipesChanged:(id)sender {
  [self.tableView reloadData];
}

#pragma mark - editor delegate methods

- (void)finishedEditingRecipe:(PRPRecipe *)recipe {
  NSUInteger row = [self.dataSource indexOfRecipe:recipe];
  NSIndexPath *path = [NSIndexPath indexPathForRow:row inSection:0];
  UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:path];
  if(nil == cell) {
    [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:path]
                          withRowAnimation:UITableViewRowAnimationLeft];
  } else {
    [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:path]
                          withRowAnimation:UITableViewRowAnimationFade];
  }
  [self.dataSource recipesChanged];
}

- (void)recipeChanged:(PRPRecipe *)recipe {
  [self.dataSource recipesChanged];  
  NSUInteger row = [self.dataSource indexOfRecipe:recipe];
  NSIndexPath *path = [NSIndexPath indexPathForRow:row inSection:0];
  UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:path];
  if(nil != cell) {
    [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:path]
                          withRowAnimation:UITableViewRowAnimationFade];
  }
}

#pragma mark - Table view delegate messages

- (void)tableView:(UITableView *)tableView
accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
  [self performSegueWithIdentifier:@"editExistingRecipe"
                            sender:cell];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataSource recipeCount];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  static NSString *CellIdentifier = @"Cell";
  
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  cell.textLabel.text = [[self.dataSource recipeAtIndex:indexPath.row] title];
  cell.imageView.image = [[self.dataSource recipeAtIndex:indexPath.row] image];
  NSNumber *prepTime = [[self.dataSource recipeAtIndex:indexPath.row] preparationTime];
  cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ %@", prepTime, NSLocalizedString(@"minutes", nil)];
  return cell;
}

- (void)tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath {
  if (editingStyle == UITableViewCellEditingStyleDelete) {
    [self.dataSource deleteRecipeAtIndex:indexPath.row];
    [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                     withRowAnimation:UITableViewRowAnimationFade];
  } else if (editingStyle == UITableViewCellEditingStyleInsert) {
  }   
}

#pragma mark Mail methods

- (void)mailComposeController:(MFMailComposeViewController *)controller 
          didFinishWithResult:(MFMailComposeResult)result 
                        error:(NSError *)error {
  [controller dismissModalViewControllerAnimated:YES];
}

- (IBAction)sendEmail:(id)sender {
  MFMailComposeViewController *mailVC = 
          [[MFMailComposeViewController alloc] init];
  mailVC.delegate = self;
  [mailVC setSubject:@"Great Recipes"];
  NSError *error = nil;
  [mailVC addAttachmentData:[self.dataSource dataForRecipes:&error]
                   mimeType:@"application/octet-stream"
                   fileName:@"Recipes.recipes"];
  if(nil == error) {
    mailVC.mailComposeDelegate = self;
    [self presentModalViewController:mailVC animated:YES];
  } else {
    NSLog(@"error in coordinating read %@ - %@", error, error.userInfo);
  }
}

#pragma mark - Seque methods

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  if([@"presentRecipeDetail" isEqualToString:segue.identifier]) {
    NSIndexPath *index = [self.tableView indexPathForCell:sender];
    PRPRecipe *recipe = [self.dataSource recipeAtIndex:index.row];
    [[segue destinationViewController] setRecipe:recipe];
  }
  if([@"addNewRecipe" isEqualToString:segue.identifier]) {
    PRPRecipe *recipe = [self.dataSource createNewRecipe];
    UINavigationController *nav = [segue destinationViewController];
    PRPRecipeEditorViewController *editor = 
    (PRPRecipeEditorViewController *)[nav topViewController];
    editor.delegate = self;
    editor.recipe = recipe;
  }
  if([@"editExistingRecipe" isEqualToString:segue.identifier]) {
    NSIndexPath *index = [self.tableView indexPathForCell:sender];
    PRPRecipe *recipe = [self.dataSource recipeAtIndex:index.row];
    UINavigationController *nav = [segue destinationViewController];
    PRPRecipeEditorViewController *editor = 
    (PRPRecipeEditorViewController *)[nav topViewController];
    editor.delegate = self;
    editor.recipe = recipe;
  }
}

@end
