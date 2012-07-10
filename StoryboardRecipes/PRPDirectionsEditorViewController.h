//
//  PRPDirectionsEditorViewController.h
//  StoryboardRecipes
//
//  Created by Marcelo Lucas S Ribeiro on 02/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PRPDirectionsEditorDelegate.h"

@class PRPRecipe;

@interface PRPDirectionsEditorViewController : UIViewController <UITextViewDelegate>

@property(nonatomic, weak) id<PRPDirectionsEditorDelegate> delegate;
@property(nonatomic, copy) NSString *text;
@property(nonatomic, strong) IBOutlet UITextView *textView;

@end
