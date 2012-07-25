//
//  RecipeUnitTests.m
//  RecipeUnitTests
//
//  Created by Guilherme Sant'Anna on 23/07/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RecipeUnitTests.h"
#import "PRPRecipe.h"
#import "PRPRecipesDocument.h"

@implementation RecipeUnitTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

-(void) testPersistence {
  NSURL *docDir = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
  NSURL *docURL = [docDir URLByAppendingPathComponent:@"Recipes.recipes"];
  PRPRecipesDocument *recipesDocForSaving = [[PRPRecipesDocument alloc] initWithFileURL:docURL];
  PRPRecipe *recipeToSave = [recipesDocForSaving createNewRecipe];
  
  STAssertNotNil(recipeToSave, @"Failed to create recipe from document");
  
  recipeToSave.title = NSLocalizedString(@"Nachos", nil);
  recipeToSave.directions = NSLocalizedString(@"Openbag\nOpen jar of salsa\nEnjoy", nil);
  recipeToSave.preparationTime = [NSNumber numberWithInt:1];
  [recipesDocForSaving recipesChanged];
  [recipesDocForSaving closeWithCompletionHandler:^(BOOL success) {
    STAssertTrue(success, @"failed to save recipes doc");
  }];
  [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:2.0]];
  
  PRPRecipesDocument *recipesDocForLoading = [[PRPRecipesDocument alloc] initWithFileURL:docURL];
  [recipesDocForLoading openWithCompletionHandler:^(BOOL success) {
    STAssertTrue(success, @"failed to open recipesDocForLoading");
    NSInteger recipeCount = [recipesDocForLoading recipeCount];
    STAssertEquals(recipeCount, 1, @"Wrong number of recipes: %@", recipeCount);
    PRPRecipe *recipeToLoad = [recipesDocForLoading recipeAtIndex:0];
    STAssertNotNil(recipeToLoad, @"Couldn't load first recipe");
    if (! [recipeToLoad.title isEqualToString:NSLocalizedString(@"Nachos", nil)]) {
      STFail(@"First recipe has wrong title: %@", recipeToLoad.title);
    }
  }];
  [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:2.0]];
}

@end
