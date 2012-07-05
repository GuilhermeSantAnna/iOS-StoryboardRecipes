//
//  PRPViewController.m
//  Recipes
//
//  Created by Marcelo Lucas S Ribeiro on 26/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PRPViewController.h"
#import "PRPRecipe.h"

@implementation PRPViewController

@synthesize recipe, directionsView, imageView, prepTime, formatter;

- (void)viewDidLoad
{
  [super viewDidLoad];
	self.formatter = [[NSNumberFormatter alloc] init];
}

- (void)viewDidUnload
{
  [super viewDidUnload];
  self.recipe = nil;
  self.directionsView = nil;
  self.imageView = nil;
  self.prepTime = nil;
  self.formatter = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

-(void) viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  self.title = self.recipe.title;
  self.directionsView.text = self.recipe.directions;
  if(nil != self.recipe.image) {
    self.imageView.image = self.recipe.image;
  }
  self.prepTime.text = [self.formatter stringFromNumber:self.recipe.preparationTime];
}

@end
