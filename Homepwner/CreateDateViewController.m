//
//  CreateDateViewController.m
//  Homepwner
//
//  Created by Travis McChesney on 5/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CreateDateViewController.h"
#import "BNRItem.h"

@interface CreateDateViewController ()

@end

@implementation CreateDateViewController

@synthesize item;

- (void)saveDate:(id)sender
{
    [item setDateCreated:[datePicker date]];
    [[self navigationController] popViewControllerAnimated:YES];
}

@end
