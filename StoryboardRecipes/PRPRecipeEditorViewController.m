//
//  PRPRecipeEditorViewController.m
//  StoryboardRecipes
//
//  Created by Marcelo Lucas S Ribeiro on 29/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PRPRecipeEditorViewController.h"
#import "PRPRecipe.h"
#import "PRPRecipesListViewController.h"

@implementation PRPRecipeEditorViewController

@synthesize recipe, titleField, directionsText, prepTimeLabel, recipeImage, prepTimeStepper, formatter, delegate;

#pragma mark - Action Methods

- (IBAction)changePreparationTime:(UIStepper *)sender {
  NSInteger value = (NSInteger) [sender value];
  self.recipe.preparationTime = [NSNumber numberWithInteger:value];
  self.prepTimeLabel.text = [self.formatter stringFromNumber:self.recipe.preparationTime];
  [self.delegate recipeChanged:self.recipe];
}

- (IBAction)done:(UIBarButtonItem *)sender {
  [self dismissModalViewControllerAnimated:YES];
  [self.delegate finishedEditingRecipe:self.recipe];
}

#pragma mark - View Lifecycle

- (void)viewDidLoad
{
  [super viewDidLoad];
	self.formatter = [[NSNumberFormatter alloc] init];
}

- (void)viewDidUnload
{
  [super viewDidUnload];
  self.formatter = nil;
  self.prepTimeStepper = nil;
  self.recipeImage = nil;
  self.prepTimeLabel = nil;
  self.directionsText = nil;
  self.titleField = nil;
  self.recipe = nil;
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  self.titleField.text = self.recipe.title;
  self.directionsText.text = self.recipe.directions;
  self.prepTimeLabel.text = [self.formatter stringFromNumber:self.recipe.preparationTime];
  self.prepTimeStepper.value= [self.recipe.preparationTime doubleValue];
  if (nil != self.recipe.image) {
    self.recipeImage.image = self.recipe.image;
  }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  if([@"editDirections" isEqualToString:segue.identifier]) {
    [[segue destinationViewController] setText:self.recipe.directions];
    [[segue destinationViewController] setDelegate:self];
  }
  if ([@"choosePhoto" isEqualToString:segue.identifier]) {
    [[segue destinationViewController] setDelegate:self];
  }
}

#pragma mark - Text Field Delegate Methods

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
  [textField resignFirstResponder];
  return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
  self.recipe.title = textField.text;
  [self.delegate recipeChanged:self.recipe];
}


#pragma mark - Image Picker Delegate Methods
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
  self.recipe.image = [info valueForKey:UIImagePickerControllerOriginalImage];
  [picker dismissModalViewControllerAnimated:YES];
  [self.delegate recipeChanged:self.recipe];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
  [picker dismissModalViewControllerAnimated:YES];
}

#pragma mark - Directions Editor Delegate Methods

- (void)directionsEditor:(PRPDirectionsEditorViewController *)editor finishedEditingText:(NSString *)text {
  self.recipe.directions = text;
  [self.delegate recipeChanged:self.recipe];
}

@end
