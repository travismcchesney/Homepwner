//
//  BaseCell.m
//  Homepwner
//
//  Created by Travis McChesney on 6/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BaseCell.h"

@implementation BaseCell

@synthesize controller;
@synthesize tableView;

- (void)setController:(id)c
{
    controller = c;
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)sendMessage:(SEL)selector withSender:(id)sender
{
    NSString *message = NSStringFromSelector(selector);
    
    // selector is now appended with ":atImdexPath:"
    message = [message stringByAppendingString:@"atIndexPath:"];
    
    // Prepare a selector from this string
    SEL newSelector = NSSelectorFromString(message);

    NSIndexPath *indexPath = [[self tableView] indexPathForCell:self];
    
    if (indexPath) {
        if ([[self controller] respondsToSelector:newSelector]) {
            // Ignore warning for this line - may or may not appear, doesn't matter
            [[self controller] performSelector:newSelector
                                    withObject:sender
                                    withObject:indexPath];
        }
    }
}

@end
