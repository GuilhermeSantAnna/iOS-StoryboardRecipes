//
//  PRPDirectionsEditorViewController.m
//  StoryboardRecipes
//
//  Created by Marcelo Lucas S Ribeiro on 02/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PRPDirectionsEditorViewController.h"
#import "PRPRecipe.h"

@implementation PRPDirectionsEditorViewController

@synthesize delegate, text, textView;

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  self.title = @"Edit Directions";
  [self.textView becomeFirstResponder];
  self.textView.text = self.text;
}

-(void)viewWillDisappear:(BOOL)animated {
  [super viewWillDisappear:animated];
  [self.textView resignFirstResponder];
}

- (void)viewDidUnload
{
  [super viewDidUnload];
  self.text = nil;
  self.textView = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Text View Delegate Methods

- (void)textViewDidEndEditing:(UITextView *)textView {
  [self.delegate directionsEditor:self finishedEditingText:self.textView.text] ;
}

@end
