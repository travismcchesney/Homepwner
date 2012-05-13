//
//  ItemsViewController.m
//  Homepwner
//
//  Created by Travis McChesney on 5/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ItemsViewController.h"
#import "BNRItemStore.h"
#import "BNRItem.h"

@implementation ItemsViewController

- (id)init
{
    // Call the superclass's designated initializer
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
        for (int i = 0; i < 5; i++) {
            [[BNRItemStore sharedStore] createItem];
        }
    }

    return self;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    return [self init];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    NSPredicate *predicate;
    
    if (section == 0) {
        predicate = [NSPredicate
                       predicateWithFormat:@"(valueInDollars > 50)"];
    } else {
        predicate = [NSPredicate
                     predicateWithFormat:@"(valueInDollars <= 50)"];
    }
    return [[[[BNRItemStore sharedStore] allItems] filteredArrayUsingPredicate:predicate] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Check for a reusable cell first, use that if it exists
    UITableViewCell *cell =
        [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    
    // If there is no reusable cell of this type, create a new one
    if (!cell) {
        cell = [[UITableViewCell alloc]
                    initWithStyle:UITableViewCellStyleDefault
                    reuseIdentifier:@"UITableViewCell"];
    }
    
    NSPredicate *predicate;
    
    // Set the text on the cell with the description of the item
    // that is at the nth index of items, where n = row this cell
    // will appear in on the tableview
    if ([indexPath section] == 0) {
        predicate = [NSPredicate
                     predicateWithFormat:@"(valueInDollars > 50)"];
    } else {
        predicate = [NSPredicate
                     predicateWithFormat:@"(valueInDollars <= 50)"];
    }
    
    NSArray *toReturn = [[[BNRItemStore sharedStore] allItems] filteredArrayUsingPredicate:predicate];
    
    BNRItem *p = [toReturn objectAtIndex:[indexPath row]];
    
    [[cell textLabel] setText:[p description]];
     
    return cell;
}

@end
