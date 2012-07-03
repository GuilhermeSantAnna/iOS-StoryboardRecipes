//
//  PRPRecipeSource.h
//  Recipes
//
//  Created by Marcelo Lucas S Ribeiro on 27/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PRPRecipesListDataSource.h"

@interface PRPRecipeSource : NSObject <PRPRecipesListDataSource>

@property(nonatomic, strong) NSMutableArray *recipes;

@end
