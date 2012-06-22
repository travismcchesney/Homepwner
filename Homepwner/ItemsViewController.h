//
//  ItemsViewController.h
//  Homepwner
//
//  Created by Travis McChesney on 5/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DetailViewController.h"
#import "HomepwnerItemCell.h"

@interface ItemsViewController : UITableViewController
{
    IBOutlet UIView *headerView;
}

- (IBAction)addNewItem:(id)sender;

@end
