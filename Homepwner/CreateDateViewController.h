//
//  CreateDateViewController.h
//  Homepwner
//
//  Created by Travis McChesney on 5/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BNRItem;

@interface CreateDateViewController : UIViewController
{
    __weak IBOutlet UIDatePicker *datePicker;
}

- (IBAction)saveDate:(id)sender;

@property (nonatomic, strong) BNRItem *item;
@end
