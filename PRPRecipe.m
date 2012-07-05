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

- (id)initWithCoder:(NSCoder *)coder {
  self = [super init];
  if (self) {
    title = [coder decodeObjectForKey:@"title"];
    directions = [coder decodeObjectForKey:@"directions"];
    preparationTime = [coder decodeObjectForKey:@"preparationTime"];
    image = [coder decodeObjectForKey:@"image"];
  }
  return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
  [coder encodeObject:title forKey:@"title"];
  [coder encodeObject:directions forKey:@"directions"];
  [coder encodeObject:preparationTime forKey:@"preparationTime"];
  [coder encodeObject:image forKey:@"image"];
}

@end
