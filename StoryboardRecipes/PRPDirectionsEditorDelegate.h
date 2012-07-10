//
//  PRPDirectionsEditorDelegate.h
//  StoryboardRecipes
//
//  Created by Guilherme Sant'Anna on 06/07/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PRPDirectionsEditorViewController;

@protocol PRPDirectionsEditorDelegate <NSObject>

- (void)directionsEditor:(PRPDirectionsEditorViewController *)editor finishedEditingText:(NSString *)text;

@end
