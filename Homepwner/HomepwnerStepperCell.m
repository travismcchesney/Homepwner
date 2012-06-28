//
//  HomepwnerStepperCell.m
//  Homepwner
//
//  Created by Travis McChesney on 6/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HomepwnerStepperCell.h"

@implementation HomepwnerStepperCell

@synthesize thumbnailView;
@synthesize nameLabel;
@synthesize serialNumberLabel;
@synthesize valueLabel;
@synthesize stepper;

- (IBAction)showImage:(UIButton *)sender 
{
    [self sendMessage:_cmd withSender:sender];
}

- (IBAction)changeValue:(UIStepper *)sender 
{
    [self sendMessage:_cmd withSender:sender];
}
@end
