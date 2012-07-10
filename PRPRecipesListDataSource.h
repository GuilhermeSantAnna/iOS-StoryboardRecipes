//
//  PRPRecipesListDataSource.h
//  Recipes
//
//  Created by Marcelo Lucas S Ribeiro on 27/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PRPRecipe;

@protocol PRPRecipesListDataSource <NSObject>

- (NSInteger)recipeCount;
- (NSUInteger)indexOfRecipe:(PRPRecipe *)recipe;
- (PRPRecipe *)recipeAtIndex:(NSInteger)index;
- (void)deleteRecipeAtIndex:(NSInteger)index;
- (PRPRecipe *)createNewRecipe;
- (void)recipesChanged;

@end
