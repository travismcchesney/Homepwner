//
//  BaseCell.h
//  Homepwner
//
//  Created by Travis McChesney on 6/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseCell : UITableViewCell

@property (weak, nonatomic) id controller;
@property (weak, nonatomic) UITableView *tableView;

-(void)sendMessage:(SEL)selector withSender:(id)sender;

@end
