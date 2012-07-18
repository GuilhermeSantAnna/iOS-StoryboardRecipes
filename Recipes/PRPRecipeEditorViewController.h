/***
 * Excerpted from "iOS SDK Development",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/adios for more book information.
***/
#import <UIKit/UIKit.h>
#import "PRPRecipesListViewController.h"
#import "PRPRecipeEditorDelegate.h"
#import "PRPDirectionsEditorDelegate.h"

@class PRPRecipe;

@interface PRPRecipeEditorViewController : UIViewController 
          <UITextFieldDelegate, 
           UIImagePickerControllerDelegate, 
           PRPDirectionsEditorDelegate>

@property(nonatomic, strong) PRPRecipe *recipe;
@property(nonatomic, strong) NSNumberFormatter *formatter;

@property(nonatomic, weak) id<PRPRecipeEditorDelegate> delegate;

@property(nonatomic, strong) IBOutlet UITextField *titleField;
@property(nonatomic, strong) IBOutlet UITextView *directionsText;
@property(nonatomic, strong) IBOutlet UILabel *prepTimeLabel;
@property(nonatomic, strong) IBOutlet UIImageView *recipeImage;
@property(nonatomic, strong) IBOutlet UIStepper *prepTimeStepper;

- (IBAction)changePreparationTime:(UIStepper *)sender;

- (IBAction)done:(UIBarButtonItem *)sender;

@end
