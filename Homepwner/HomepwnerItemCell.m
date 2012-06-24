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
@synthesize controller;
@synthesize tableView;

- (IBAction)showImage:(id)sender 
{
    // Get the name of this method, "showImage:"
    NSString *selector = NSStringFromSelector(_cmd);
    // selector is now "showImage:atImdexPath:"
    selector = [selector stringByAppendingString:@"atIndexPath:"];
    
    NSIndexPath *indexPath = [[self tableView] indexPathForCell:self];

    [self sendMessage:selector toObject:[self controller] withSender:sender withParameter:indexPath];
}
@end
