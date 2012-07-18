/***
 * Excerpted from "iOS SDK Development",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/adios for more book information.
***/
#import "PRPAppDelegate.h"
#import "PRPRecipesListViewController.h"
#import "PRPRecipesDocument.h"

@interface PRPAppDelegate()

@property(nonatomic, strong) PRPRecipesDocument *document;

@end

@implementation PRPAppDelegate

@synthesize window = _window;
@synthesize document = _document;

- (BOOL)application:(UIApplication *)application 
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  UINavigationController *navigationController = 
      (UINavigationController *)self.window.rootViewController;
  PRPRecipesListViewController *controller = 
      (PRPRecipesListViewController *)navigationController.topViewController;
  NSURL *docDir = [[[NSFileManager defaultManager] 
                    URLsForDirectory:NSDocumentDirectory
                    inDomains:NSUserDomainMask] lastObject];
  NSURL *docURL = [docDir URLByAppendingPathComponent:@"Recipes.recipes"];
  PRPRecipesDocument *doc = [[PRPRecipesDocument alloc] initWithFileURL:docURL];
  [[NSNotificationCenter defaultCenter]
               addObserver:self
                  selector:@selector(docChangedState:) 
                      name:UIDocumentStateChangedNotification
                    object:doc];
  controller.dataSource = doc;
  [doc openWithCompletionHandler:^(BOOL success) {
    if(success) {
      [controller.tableView reloadData];
    } else {
      NSLog(@"Failed to open document");
    }
  }];
  self.document = doc;
  return YES;
}

- (void)docChangedState:(NSNotification *)notification {
  NSURL *url = [[notification object] fileURL];
  NSArray *versions = 
          [NSFileVersion unresolvedConflictVersionsOfItemAtURL:url];
  for(NSFileVersion *fileVersion in versions) {
    NSError *error = nil;
    [fileVersion removeAndReturnError:&error];
  }
}

- (BOOL)application:(UIApplication *)application 
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication 
         annotation:(id)annotation {
  PRPRecipesDocument *newDoc = [[PRPRecipesDocument alloc] initWithFileURL:url];
  [newDoc openWithCompletionHandler:^(BOOL success) {
    if(success) {
      [self.document addRecipesFromDocument:newDoc];
    } else {
      NSLog(@"Failed to open new document - %@", url);
    }
  }];
  return YES;
}

@end
