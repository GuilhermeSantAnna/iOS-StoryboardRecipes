//
//  PRPRecipesDocument.m
//  StoryboardRecipes
//
//  Created by Guilherme Sant'Anna on 06/07/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PRPRecipesDocument.h"
#import "PRPRecipe.h"

@implementation PRPRecipesDocument

@synthesize recipes;

- (id)initWithFileURL:(NSURL *)url {
  self = [super initWithFileURL:url];
  if (self) {
    recipes = [NSMutableArray array];
  }
  return self;
}

#pragma mark - Persistence Methods

- (BOOL)loadFromContents:(id)contents ofType:(NSString *)typeName error:(NSError **)outError {
  BOOL success = NO;
  if ([contents isKindOfClass:[NSData class]] && [contents length] > 0) {
    NSData *data = (NSData *)contents;
    self.recipes = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    success = YES;
  }
  return success;
}

- (id)contentsForType:(NSString *)typeName error:(NSError **)outError {
  return [NSKeyedArchiver archivedDataWithRootObject:self.recipes];
}

- (void)handleError:(NSError *)error userInteractionPermitted:(BOOL)userInteractionPermitted {
  if([[error domain] isEqualToString:NSCocoaErrorDomain] && [error code] == NSFileReadNoSuchFileError) {
    [self saveToURL:[self fileURL] forSaveOperation:UIDocumentSaveForCreating completionHandler:^(BOOL success) {
    // ignore it here, we just wanted to make sure the document is created
    NSLog(@"handled open error with a new doc");
  }];
  } else {
    // if it's not a NSFileReadNoSuchFileError the just call super
    [super handleError:error userInteractionPermitted:userInteractionPermitted];
  }
}

#pragma mark - Recipe List Methods

- (NSInteger)recipeCount {
  return [self.recipes count];
}

- (NSUInteger)indexOfRecipe:(PRPRecipe *)recipe {
  return [self.recipes indexOfObject:recipe];
}

- (PRPRecipe *)recipeAtIndex:(NSInteger)index {
  return [self.recipes objectAtIndex:index];
}

- (void)deleteRecipeAtIndex:(NSInteger)index {
  [self.recipes removeObjectAtIndex:index];
  [self updateChangeCount:UIDocumentChangeDone];
}

- (PRPRecipe *)createNewRecipe {
  PRPRecipe *recipe = [[PRPRecipe alloc] init];
  [self.recipes addObject:recipe];
  [self updateChangeCount:UIDocumentChangeDone];
  return recipe;
}

- (void)recipesChanged {
  NSLog(@"I'm at recipeschanged method");
  [self updateChangeCount:UIDocumentChangeDone];
}

@end
