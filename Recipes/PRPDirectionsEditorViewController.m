/***
 * Excerpted from "iOS SDK Development",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/adios for more book information.
***/
#import "PRPDirectionsEditorViewController.h"
#import "PRPRecipe.h"

@interface PRPDirectionsEditorViewController()

@property(nonatomic, strong) IBOutlet UITextView *textView;

@end

@implementation PRPDirectionsEditorViewController

@synthesize delegate;
@synthesize text;
@synthesize textView;

#pragma mark - View lifecycle

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  self.title = @"Edit Directions";
  [self.textView becomeFirstResponder];
  self.textView.text = self.text;
}

- (void)viewWillDisappear:(BOOL)animated {
  [super viewWillDisappear:animated];
  [self.textView resignFirstResponder];
}

- (void)viewDidUnload {
  [super viewDidUnload];
  self.text = nil;
  self.textView = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
  return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Text View Delegate Methods

- (void)textViewDidEndEditing:(UITextView *)textView {
  [self.delegate directionsEditor:self finishedEditingText:self.textView.text];
}

@end
