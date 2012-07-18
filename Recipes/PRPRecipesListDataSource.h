/***
 * Excerpted from "iOS SDK Development",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/adios for more book information.
***/
#import <Foundation/Foundation.h>

extern NSString * const PRPRecipesDidChangeNotification;

@class PRPRecipe;

@protocol PRPRecipesListDataSource <NSObject>

- (NSInteger)recipeCount;
- (NSUInteger)indexOfRecipe:(PRPRecipe *)recipe;
- (PRPRecipe *)recipeAtIndex:(NSInteger)index;
- (void)deleteRecipeAtIndex:(NSInteger)index;
- (PRPRecipe *)createNewRecipe;

- (void)recipesChanged;

- (NSData *)dataForRecipes:(NSError **)error;

@end
