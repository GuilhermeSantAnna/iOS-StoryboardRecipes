/***
 * Excerpted from "iOS SDK Development",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/adios for more book information.
***/
#import "PRPViewController.h"
#import "PRPRecipe.h"

@implementation PRPViewController

@synthesize directionsView;
@synthesize imageView;
@synthesize prepTime;
@synthesize formatter;

@synthesize recipe;

- (void)viewDidLoad {
  [super viewDidLoad];
  self.formatter = [[NSNumberFormatter alloc] init];
}

- (void)viewDidUnload {
  [super viewDidUnload];
  self.recipe = nil;
  self.directionsView = nil;
  self.imageView = nil;
  self.prepTime = nil;
  self.formatter = nil;
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  self.title = self.recipe.title;
  self.directionsView.text = self.recipe.directions;
  if(nil != self.recipe.image) {
    self.imageView.image = self.recipe.image;
  }
  self.prepTime.text = [self.formatter stringFromNumber:self.recipe.preparationTime];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
  return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
