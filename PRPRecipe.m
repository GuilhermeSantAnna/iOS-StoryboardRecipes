//
//  PRPRecipe.m
//  Recipes
//
//  Created by Marcelo Lucas S Ribeiro on 26/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PRPRecipe.h"

@implementation PRPRecipe

@synthesize title, directions, image, preparationTime;

-(id)init {
  self = [super init];
  if (self) {
    self.title = @"New Recipe";
  }
  return self;
}

@end
