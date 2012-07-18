/***
 * Excerpted from "iOS SDK Development",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/adios for more book information.
***/
#import "PRPRecipesDocument.h"
#import "PRPRecipe.h"

NSString * const PRPRecipesDidChangeNotification =
@"PRPRecipesDidChangeNotification";

@interface PRPRecipesDocument()

@property(nonatomic, strong) NSMutableArray *recipes;

@end

@implementation PRPRecipesDocument

@synthesize recipes = _recipes;

- (id)initWithFileURL:(NSURL *)url {
  self = [super initWithFileURL:url];
  if (self) {
    _recipes = [NSMutableArray array];
  }
  return self;
}

#pragma mark - Persistence Methods

- (BOOL)loadFromContents:(id)contents 
                  ofType:(NSString *)typeName
                   error:(NSError **)outError {
  BOOL success = NO;
  if([contents isKindOfClass:[NSData class]] && [contents length] > 0) {
    NSData *data = (NSData *)contents;
    self.recipes = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    [[NSNotificationCenter defaultCenter]
           postNotificationName:PRPRecipesDidChangeNotification
                         object:self];
    success = YES;
  }
  return success;
}

- (id)contentsForType:(NSString *)typeName error:(NSError **)outError {
  return [NSKeyedArchiver archivedDataWithRootObject:self.recipes];
}

- (void)handleError:(NSError *)error 
userInteractionPermitted:(BOOL)userInteractionPermitted {
  if([[error domain] isEqualToString:NSCocoaErrorDomain] &&
     [error code] == NSFileReadNoSuchFileError) {
    [self saveToURL:[self fileURL]
   forSaveOperation:UIDocumentSaveForCreating
  completionHandler:^(BOOL success) {
    // ignore it here, we just wanted to make sure the document is created
  }];
  } else {
    // if it's not a NSFileReadNoSuchFileError the just call super
    [super handleError:error 
userInteractionPermitted:userInteractionPermitted];
  }
}

#pragma mark - Sharing Method

- (void)addRecipesFromDocument:(PRPRecipesDocument *)newDoc {
  [self.recipes addObjectsFromArray:[newDoc recipes]];
  [[NSNotificationCenter defaultCenter] 
        postNotificationName:PRPRecipesDidChangeNotification
                      object:self];
  [self updateChangeCount:UIDocumentChangeDone];
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
  [self updateChangeCount:UIDocumentChangeDone];  
}

- (NSData *)dataForRecipes:(NSError **)error {
  __block NSData *data = nil;
  NSFileCoordinator *coordinator = [[NSFileCoordinator alloc]
                                       initWithFilePresenter:nil];
  [coordinator coordinateReadingItemAtURL:[self fileURL]
                                  options:NSFileCoordinatorReadingWithoutChanges
                                    error:error
                               byAccessor:^(NSURL *newURL) {
                                 data = [NSData dataWithContentsOfURL:newURL];
                               }];
  return data;
}

@end
