//
//  BaseCell.m
//  Homepwner
//
//  Created by Travis McChesney on 6/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BaseCell.h"

@implementation BaseCell

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

- (void)sendMessage:(NSString *)message toObject:(id)toObject withSender:(id)sender withParameter:(id)parameter
{
    // Prepare a selector from this string
    SEL newSelector = NSSelectorFromString(message);
    
    if (parameter) {
        if ([toObject respondsToSelector:newSelector]) {
            // Ignore warning for this line - may or may not appear, doesn't matter
            [toObject performSelector:newSelector
                                    withObject:sender
                                    withObject:parameter];
        }
    }
}

@end
