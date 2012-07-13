//
//  PRPRecipesListViewController.h
//  Recipes
//
//  Created by Marcelo Lucas S Ribeiro on 27/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import "PRPRecipesListDataSource.h"
#import "PRPRecipeEditorDelegate.h"

@interface PRPRecipesListViewController : UITableViewController <PRPRecipeEditorDelegate,
                                                                 UINavigationControllerDelegate,
                                                                 MFMailComposeViewControllerDelegate>

@property (nonatomic, strong) id <PRPRecipesListDataSource> dataSource;

- (IBAction)sendEmail:(id)sender;

@end
