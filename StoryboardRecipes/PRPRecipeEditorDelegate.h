//
//  PRPRecipeEditorDelegate.h
//  StoryboardRecipes
//
//  Created by Guilherme Sant'Anna on 06/07/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PRPRecipeEditorDelegate <NSObject>

- (void)finishedEditingRecipe:(PRPRecipe *)recipe;
- (void)recipeChanged:(PRPRecipe *)recipe;

@end
