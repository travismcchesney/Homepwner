//
//  BaseCell.h
//  Homepwner
//
//  Created by Travis McChesney on 6/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseCell : UITableViewCell
{
    
}

-(void)sendMessage:(NSString *)message toObject:(id)toObject withSender:(id)sender withParameter:(id)parameter;

@end
