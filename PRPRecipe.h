//
//  PRPRecipe.h
//  Recipes
//
//  Created by Marcelo Lucas S Ribeiro on 26/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PRPRecipe : NSObject <NSCoding>

@property(nonatomic, copy) NSString *title;
@property(nonatomic, copy) NSString *directions;
@property(nonatomic, copy) NSNumber *preparationTime;
@property(nonatomic, strong) UIImage *image;

@end
