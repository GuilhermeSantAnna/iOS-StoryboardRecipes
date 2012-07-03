//
//  PRPViewController.h
//  Recipes
//
//  Created by Marcelo Lucas S Ribeiro on 26/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PRPRecipe.h"
@class PRPRecipe;

@interface PRPViewController : UIViewController

@property(nonatomic, strong) IBOutlet UITextView *directionsView;
@property(nonatomic, strong) IBOutlet UIImageView *imageView;
@property(nonatomic, strong) IBOutlet UILabel *prepTime;
@property(nonatomic, strong) NSNumberFormatter *formatter;

@property(nonatomic, strong) PRPRecipe *recipe;

@end
