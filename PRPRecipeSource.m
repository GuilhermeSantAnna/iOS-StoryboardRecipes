//
//  PRPRecipeSource.m
//  Recipes
//
//  Created by Marcelo Lucas S Ribeiro on 27/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PRPRecipeSource.h"
#import "PRPRecipe.h"

@implementation PRPRecipeSource

@synthesize recipes;

- (NSInteger)recipeCount {
  return [self.recipes count];
}

- (PRPRecipe *)recipeAtIndex:(NSInteger)index {
  return [self.recipes objectAtIndex:index];
}

- (void)deleteRecipeAtIndex:(NSInteger)index {
  [self.recipes removeObjectAtIndex:index];
}

- (PRPRecipe *)createNewRecipe{
  PRPRecipe *recipe = [[PRPRecipe alloc] init];
  [self.recipes addObject:recipe];
  return recipe;
}

- (NSUInteger)indexOfRecipe:(PRPRecipe *)recipe {
    return [self.recipes indexOfObject:recipe];
}

-(NSArray *)recipes {
  if(nil == recipes) {
    NSMutableArray *localRecipes = [NSMutableArray array];
    PRPRecipe *recipe = [[PRPRecipe alloc] init];
    recipe.directions = @"0 - Put some stuff in , and the other stuff, then stir";
    recipe.title = @"0 - One Fine Food";
    recipe.image = [UIImage imageNamed:@"fire-damage-london.png"];
    recipe.preparationTime = [NSNumber numberWithInt:30];
    [localRecipes addObject:recipe];
    recipe = [[PRPRecipe alloc] init];
    recipe.directions = @"1 - Put some stuff in, and the other stuff, then stir";
    recipe.title = @"1 - One Fine Food";
    recipe.image = [UIImage imageNamed:@"fire-damage-london.png"];
    recipe.preparationTime = [NSNumber numberWithInt:30];
    [localRecipes addObject:recipe];
    recipe = [[PRPRecipe alloc] init];
    recipe.directions = @"2 - Put some stuff in, and the other stuff, then stir";
    recipe.title = @"2 - One Fine Food";
    recipe.image = [UIImage imageNamed:@"fire-damage-london.png"];
    recipe.preparationTime = [NSNumber numberWithInt:30];
    [localRecipes addObject:recipe];
    recipe = [[PRPRecipe alloc] init];
    recipe.directions = @"3 - Put some stuff in, and the other stuff, then stir";
    recipe.title = @"3 - One Fine Food";
    recipe.image = [UIImage imageNamed:@"fire-damage-london.png"];
    recipe.preparationTime = [NSNumber numberWithInt:30];
    [localRecipes addObject:recipe];
    recipe = [[PRPRecipe alloc] init];
    recipe.directions = @"4 - Put some stuff in, and the other stuff, then stir";
    recipe.title = @"4 - One Fine Food";
    recipe.image = [UIImage imageNamed:@"fire-damage-london.png"];
    recipe.preparationTime = [NSNumber numberWithInt:30];
    [localRecipes addObject:recipe];
    recipe = [[PRPRecipe alloc] init];
    recipe.directions = @"5 - Put some stuff in, and the other stuff, then stir";
    recipe.title = @"5 - One Fine Food";
    recipe.image = [UIImage imageNamed:@"fire-damage-london.png"];
    recipe.preparationTime = [NSNumber numberWithInt:30];
    [localRecipes addObject:recipe];
    recipe = [[PRPRecipe alloc] init];
    recipe.directions = @"6 - Put some stuff in, and the other stuff, then stir";
    recipe.title = @"6 - One Fine Food";
    recipe.image = [UIImage imageNamed:@"fire-damage-london.png"];
    recipe.preparationTime = [NSNumber numberWithInt:30];
    [localRecipes addObject:recipe];
    recipe = [[PRPRecipe alloc] init];
    recipe.directions = @"7 - Put some stuff in, and the other stuff, then stir";
    recipe.title = @"7 - One Fine Food";
    recipe.image = [UIImage imageNamed:@"fire-damage-london.png"];
    recipe.preparationTime = [NSNumber numberWithInt:30];
    [localRecipes addObject:recipe];
    recipe = [[PRPRecipe alloc] init];
    recipe.directions = @"8 - Put some stuff in, and the other stuff, then stir";
    recipe.title = @"8 - One Fine Food";
    recipe.image = [UIImage imageNamed:@"fire-damage-london.png"];
    recipe.preparationTime = [NSNumber numberWithInt:30];
    [localRecipes addObject:recipe];
    recipe = [[PRPRecipe alloc] init];
    recipe.directions = @"9 - Put some stuff in, and the other stuff, then stir";
    recipe.title = @"9 - One Fine Food";
    recipe.image = [UIImage imageNamed:@"fire-damage-london.png"];
    recipe.preparationTime = [NSNumber numberWithInt:30];
    [localRecipes addObject:recipe];
    recipe = [[PRPRecipe alloc] init];
    recipe.directions = @"10 - Put some stuff in, and the other stuff, then stir";
    recipe.title = @"10 - One Fine Food";
    recipe.image = [UIImage imageNamed:@"fire-damage-london.png"];
    recipe.preparationTime = [NSNumber numberWithInt:30];
    [localRecipes addObject:recipe];
    recipe = [[PRPRecipe alloc] init];
    recipe.directions = @"11 - Put some stuff in, and the other stuff, then stir";
    recipe.title = @"11 - One Fine Food";
    recipe.image = [UIImage imageNamed:@"fire-damage-london.png"];
    recipe.preparationTime = [NSNumber numberWithInt:30];
    [localRecipes addObject:recipe];
    recipe = [[PRPRecipe alloc] init];
    recipe.directions = @"12 - Put some stuff in, and the other stuff, then stir";
    recipe.title = @"12 - One Fine Food";
    recipe.image = [UIImage imageNamed:@"fire-damage-london.png"];
    recipe.preparationTime = [NSNumber numberWithInt:30];
    [localRecipes addObject:recipe];
    NSString *directions = @"Put the flour and other dry ingredients in a bowl, \
    stir in the eggs until evenly moist. Add chocolate chips and stir in until even. \
    Place tablespoon sized portions on greased cookie sheet and bake at 350Â° for \
    6 minutes.";
    recipe = [[PRPRecipe alloc] init];
    recipe.title = @"Chocolate Chip Cookies";
    recipe.image = [UIImage imageNamed:@"fire-damage-london.png"];
    recipe.preparationTime = [NSNumber numberWithInt:30];
    recipe.directions = directions;
    [localRecipes addObject:recipe];
    
    self.recipes = localRecipes;
  }
  return recipes;
}


@end
