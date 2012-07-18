/***
 * Excerpted from "iOS SDK Development",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/adios for more book information.
***/
#import <UIKit/UIKit.h>

@class PRPRecipe;

@interface PRPViewController : UIViewController

@property(nonatomic, strong) IBOutlet UITextView *directionsView;
@property(nonatomic, strong) IBOutlet UIImageView *imageView;
@property(nonatomic, strong) IBOutlet UILabel *prepTime;
@property(nonatomic, strong) NSNumberFormatter *formatter;

@property(nonatomic, strong) PRPRecipe *recipe;

@end
