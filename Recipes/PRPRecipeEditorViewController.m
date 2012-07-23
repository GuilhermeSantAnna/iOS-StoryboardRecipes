/***
 * Excerpted from "iOS SDK Development",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/adios for more book information.
***/
#import "PRPRecipeEditorViewController.h"
#import "PRPRecipe.h"
#import <QuartzCore/QuartzCore.h>

@implementation PRPRecipeEditorViewController

@synthesize recipe, titleField, directionsText, prepTimeLabel, recipeImage, prepTimeStepper, formatter, delegate;

#pragma mark - Action Methods

- (IBAction)changePreparationTime:(UIStepper *)sender {
  NSInteger value = (NSInteger)[sender value];
  self.recipe.preparationTime = [NSNumber numberWithInteger:value];
  self.prepTimeLabel.text = [self.formatter stringFromNumber:self.recipe.preparationTime];
  [self.delegate recipeChanged:self.recipe];
}

- (IBAction)done:(id)sender {
  [self dismissModalViewControllerAnimated:YES];
  [self.delegate finishedEditingRecipe:self.recipe];
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
  [super viewDidLoad];
  self.formatter = [[NSNumberFormatter alloc] init];
}

- (void)viewDidUnload {
  [super viewDidUnload];
  self.formatter = nil;
  self.prepTimeStepper = nil;
  self.recipeImage = nil;
  self.prepTimeLabel = nil;
  self.directionsText = nil;
  self.titleField = nil;
  self.recipe = nil;
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  
  self.titleField.text = self.recipe.title;
  self.directionsText.text = self.recipe.directions;
  self.prepTimeLabel.text = [self.formatter stringFromNumber:self.recipe.preparationTime];
  self.prepTimeStepper.value = [self.recipe.preparationTime doubleValue];
  if(nil != self.recipe.image) {
    self.recipeImage.image = self.recipe.image;
  }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  if([@"editDirections" isEqualToString:segue.identifier]) {
    [[segue destinationViewController] setText:self.recipe.directions];
    [[segue destinationViewController] setDelegate:self];
  }
  if([@"choosePhoto" isEqualToString:segue.identifier]) {
    [[segue destinationViewController] setDelegate:self];
  }
}

#pragma mark - Text Field Delegate Methods

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
  [textField resignFirstResponder];
  return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
  self.recipe.title = textField.text;
  [self.delegate recipeChanged:self.recipe];
}

# pragma mark - Image Drawing Methods

- (CGRect)rectForImage:(UIImage *)image inSize:(CGSize)size {
  CGRect imageRect = {{0.0, 0.0}, image.size};
  CGFloat scale = 1.0;
  if(CGRectGetWidth(imageRect) > CGRectGetHeight(imageRect)) {
    scale = size.width / CGRectGetWidth(imageRect);
  } else {
    scale = size.height / CGRectGetHeight(imageRect);
  }
  
  CGRect rect = CGRectMake(0.0, 0.0, scale * CGRectGetHeight(imageRect), CGRectGetWidth(imageRect));
  
  rect.origin.x = (size.width - CGRectGetWidth(rect)) / 2.0;
  rect.origin.y = (size.height - CGRectGetHeight(rect)) / 2.0;
  
  return rect;
}

#pragma mark - Image Picker Delegate Methods

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
  UIImage *originalImage = [info valueForKey:UIImagePickerControllerOriginalImage];
  
  CGSize cellViewSize = CGSizeMake(43.0, 43.0);
  CGRect cellViewRect = [self rectForImage:originalImage inSize:cellViewSize];
  UIGraphicsBeginImageContext(cellViewSize);
  [originalImage drawInRect:cellViewRect];
  self.recipe.thumbnailImage = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  
  CGSize detailImageSize = CGSizeMake(260.0, 260.0);
  CGRect detailImageRect = [self rectForImage:originalImage inSize:detailImageSize];
  detailImageRect = CGRectInset(detailImageRect, 8.0, 8.0);
  UIGraphicsBeginImageContext(detailImageSize);
  CGContextRef context = UIGraphicsGetCurrentContext();
  UIColor *color = [[UIColor blackColor] colorWithAlphaComponent:0.75];
  CGContextSetShadowWithColor(context, CGSizeMake(8.0, 8.0), 5.0, [color CGColor]);
  
  CGLayerRef layer = CGLayerCreateWithContext(context, detailImageSize, NULL);
  CGContextRef layerCtx = CGLayerGetContext(layer);
  
  CGContextTranslateCTM(layerCtx, 0.0, detailImageSize.height);
  CGContextScaleCTM(layerCtx, 1.0, -1.0);
  
  CGContextDrawImage(layerCtx, detailImageRect, [originalImage CGImage]);
  CGFloat frameWidth = 6.0;
  CGRect frameRect = CGRectInset(detailImageRect, frameWidth / 2.0, frameWidth / 2.0);
  UIBezierPath *frame = [UIBezierPath bezierPathWithRect:frameRect];
  CGContextSetLineWidth(layerCtx, frameWidth);
  CGContextSetStrokeColorWithColor(layerCtx, [[UIColor whiteColor] CGColor]);
  CGContextAddPath(layerCtx, [frame CGPath]);
  CGContextStrokePath(layerCtx);
  
  CGContextDrawLayerAtPoint(context, CGPointMake(0.0f, 0.0f), layer);
  
  self.recipe.image = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  
  [self.delegate recipeChanged:self.recipe];
  [picker dismissModalViewControllerAnimated:YES];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
  [picker dismissModalViewControllerAnimated:YES];
}

#pragma mark - Directions Editor Delegate Methods

- (void)directionsEditor:(PRPDirectionsEditorViewController *)editor finishedEditingText:(NSString *)text {
  self.recipe.directions = text;
  [self.delegate recipeChanged:self.recipe];
}

#pragma mark - Rotating image

- (IBAction)rotateRecipeImage:(UIRotationGestureRecognizer *)gr {
  [UIView animateWithDuration:0.5
                   animations:^{
                     self.recipeImage.transform =
                     CGAffineTransformMakeRotation(gr.rotation);
                   }
                   completion:^(BOOL finished) {
                   }];
}

@end
