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

- (void)viewDidLoad
{
    UIImage *backgroundImage = [UIImage imageNamed:@"background-image"];
    UIImageView *backgroundView = [[UIImageView alloc] initWithImage:backgroundImage];
    [[self tableView] setBackgroundView:backgroundView];
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return [[[BNRItemStore sharedStore] allItems] count] + 1;
}

- (CGFloat)tableView:(UITableView *)tableView 
    heightForRowAtIndexPath:(NSIndexPath *)indexPath
{   
    if ([indexPath section] == [tableView numberOfSections]-1 && 
        [indexPath row] == [self tableView:tableView numberOfRowsInSection:[indexPath section]]-1) {
        return 44;
    } else {
        return 60;
    }
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
    
    if ([indexPath section] == [tableView numberOfSections]-1 && 
        [indexPath row] == [tableView numberOfRowsInSection:[indexPath section]]-1) {
        [[cell textLabel] setText:@"No more items!"];
    } else {
        // Set the text on the cell with the description of the item
        // that is at the nth index of items, where n = row this cell
        // will appear in on the tableview
        BNRItem *p = [[[BNRItemStore sharedStore] allItems]
                      objectAtIndex:[indexPath row]];
        
        [[cell textLabel] setText:[p description]];
        UIFont *newFont = [[[cell textLabel] font] fontWithSize:20];
        [[cell textLabel] setFont:newFont];
    }
    
    return cell;
}

@end
