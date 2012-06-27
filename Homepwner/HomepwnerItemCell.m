//
//  HomepwnerItemCell.m
//  Homepwner
//
//  Created by Travis McChesney on 6/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HomepwnerItemCell.h"
#import "BaseCell.h"

@implementation HomepwnerItemCell
@synthesize thumbnailView;
@synthesize nameLabel;
@synthesize serialNumberLabel;
@synthesize valueLabel;
@synthesize tableView;

- (IBAction)showImage:(id)sender 
{
    [self sendMessage:_cmd withSender:sender];
}
@end
