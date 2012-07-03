//
//  PRPDirectionsEditorViewController.h
//  StoryboardRecipes
//
//  Created by Marcelo Lucas S Ribeiro on 02/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PRPRecipe;

@interface PRPDirectionsEditorViewController : UIViewController <UITextViewDelegate>

@property(nonatomic, strong) PRPRecipe *recipe;
@property(nonatomic, strong) IBOutlet UITextView *textView;

@end
