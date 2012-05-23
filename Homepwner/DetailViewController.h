//
//  DetailViewControllerViewController.h
//  Homepwner
//
//  Created by Travis McChesney on 5/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BNRItem;

@interface DetailViewController : UIViewController <UITextFieldDelegate>
{
    __weak IBOutlet UITextField *nameField;
    __weak IBOutlet UITextField *serialNumberField;
    __weak IBOutlet UITextField *valueField;
    __weak IBOutlet UILabel *dateLabel;
    __weak IBOutlet UIButton *doneButton;
}

- (IBAction)closeNumberpad:(id)sender;

@property (nonatomic, strong) BNRItem *item;
@end
