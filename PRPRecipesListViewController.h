//
//  PRPRecipesListViewController.h
//  Recipes
//
//  Created by Marcelo Lucas S Ribeiro on 27/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PRPRecipesListDataSource.h"

@interface PRPRecipesListViewController : UITableViewController

@property (nonatomic, strong) id <PRPRecipesListDataSource> dataSource;

- (void)finishedEditingRecipe:(PRPRecipe *)recipe;

@end
