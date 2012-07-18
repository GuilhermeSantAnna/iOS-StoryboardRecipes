/***
 * Excerpted from "iOS SDK Development",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/adios for more book information.
***/
#import "PRPRecipe.h"

@implementation PRPRecipe

@synthesize title;
@synthesize directions;
@synthesize preparationTime;
@synthesize image;

- (id)init {
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
