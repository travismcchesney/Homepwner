//
//  DetailViewControllerViewController.m
//  Homepwner
//
//  Created by Travis McChesney on 5/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DetailViewController.h"
#import "BNRItem.h"
#import "CreateDateViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

@synthesize item;

- (void)setItem:(BNRItem *)i
{
    item = i;
    [[self navigationItem] setTitle:[item itemName]];
}

- (void)viewDidUnload {
    nameField = nil;
    serialNumberField = nil;
    valueField = nil;
    dateLabel = nil;
    [super viewDidUnload];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[self view] setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [nameField setText:[item itemName]];
    [serialNumberField setText:[item serialNumber]];
    [valueField setText:[NSString stringWithFormat:@"%d", [item valueInDollars]]];
    
    // Create a NSDateFormatter that will turn a date into a simple date string
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    
    // Use filtered NSDate object to set dateLabel contents
    [dateLabel setText:[dateFormatter stringFromDate:[item dateCreated]]];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    // Clear first responder
    [[self view] endEditing:YES];
    
    // "Save" changes to item
    [item setItemName:[nameField text]];
    [item setSerialNumber:[serialNumberField text]];
    [item setValueInDollars:[[valueField text] intValue]];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField == valueField) {
        [doneButton setEnabled:YES];
    }
}
         
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if (textField == valueField) {
        [doneButton setEnabled:NO];
    }
}

- (void)closeNumberpad:(id)sender
{
    // Clear first responder
    [[self view] endEditing:YES];
}

- (void)changeDate:(id)sender
{
    // Display the date picker to change the create date
    CreateDateViewController *createDateViewController = [[CreateDateViewController alloc] init];
    
    // Give create date view controller a pointer to the BNR Item
    [createDateViewController setItem:item];
    
    // Push it onto the top of the navigation controller's stack
    [[self navigationController] pushViewController:createDateViewController 
                                           animated:YES];
}

@end
