//
//  PRPRecipesDocument.h
//  StoryboardRecipes
//
//  Created by Guilherme Sant'Anna on 06/07/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PRPRecipesListDataSource.h"

@interface PRPRecipesDocument : UIDocument <PRPRecipesListDataSource>

@property(nonatomic, strong) NSMutableArray *recipes;

@end
