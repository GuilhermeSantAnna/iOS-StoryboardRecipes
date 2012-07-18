/***
 * Excerpted from "iOS SDK Development",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/adios for more book information.
***/
#import <UIKit/UIKit.h>
#import "PRPDirectionsEditorDelegate.h"

@class PRPRecipe;

@interface PRPDirectionsEditorViewController : UIViewController

@property(nonatomic, weak) id<PRPDirectionsEditorDelegate> delegate;

@property(nonatomic, copy) NSString *text;

@end
