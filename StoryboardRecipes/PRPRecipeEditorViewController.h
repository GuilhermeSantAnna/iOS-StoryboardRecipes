//
//  PRPRecipeEditorViewController.h
//  StoryboardRecipes
//
//  Created by Marcelo Lucas S Ribeiro on 29/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PRPRecipesListViewController.h"
#import "PRPRecipeEditorDelegate.h"
#import "PRPDirectionsEditorDelegate.h"

@class PRPRecipe;

@interface PRPRecipeEditorViewController : UIViewController <UITextFieldDelegate, UIImagePickerControllerDelegate, PRPDirectionsEditorDelegate>

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
