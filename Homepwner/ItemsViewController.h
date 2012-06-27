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
#import "HomepwnerStepperCell.h"
#import "BNRImageStore.h"
#import "ImageViewController.h"

@interface ItemsViewController : UITableViewController <UIPopoverControllerDelegate>
{
    IBOutlet UIView *headerView;
    UIPopoverController *imagePopover;
    UIPopoverController *stepperPopover;
}

- (IBAction)addNewItem:(id)sender;

@end
