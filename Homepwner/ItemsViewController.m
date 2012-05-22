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

    }
    return self;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    return [self init];
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return [[[BNRItemStore sharedStore] allItems] count] + 1;
}

- (UIView *)tableView:(UITableView *)tv viewForHeaderInSection:(NSInteger)section
{
    return [self headerView];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    // The height of the header view should be determined from the height of the
    // view in the XIB file
    return [[self headerView] bounds].size.height;
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
    }
     
     return cell;
}

- (UIView *)headerView
{
    // If we haven't loaded the headerView yet...
    if (!headerView) {
        NSBundle *bundle = [NSBundle mainBundle];
        // Load HeaderView.xib
        [bundle loadNibNamed:@"HeaderView" owner:self options:nil];
    }
    
    return headerView;
}

- (IBAction)toggleEditingMode:(id)sender
{
    // If we are currently in editing mode...
    if ([self isEditing]) {
        // Change text of button to inform user of state
        [sender setTitle:@"Edit" forState:UIControlStateNormal];
        // Turn off editing mode
        [self setEditing:NO animated:YES];
    } else {
        // Change text of button to inform user of state
        [sender setTitle:@"Done" forState:UIControlStateNormal];
        // Enter editing mode
        [self setEditing:YES animated:YES];
    }
}

- (IBAction)addNewItem:(id)sender
{
    // Create a new BNRItem and add it to the store
    BNRItem *newItem = [[BNRItemStore sharedStore] createItem];
    
    // Figure out where that item is in the array
    int lastRow = [[[BNRItemStore sharedStore] allItems] indexOfObject:newItem];
    
    NSIndexPath *ip = [NSIndexPath indexPathForRow:lastRow inSection:0];
    
    // Insert this new row into the table
    [[self tableView] insertRowsAtIndexPaths:[NSArray arrayWithObject:ip]
                            withRowAnimation:UITableViewRowAnimationTop];
}

- (void)tableView:(UITableView *)tableView
    commitEditingStyle:(UITableViewCellEditingStyle)editingStyle 
     forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // If the table view is asking to commit a delete command...
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        BNRItemStore *ps = [BNRItemStore sharedStore];
        NSArray *items = [ps allItems];
        BNRItem *p = [items objectAtIndex:[indexPath row]];
        [ps removeItem:p];
        
        // We also remove that row from the table view with an animation
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                         withRowAnimation:UITableViewRowAnimationLeft];
    }
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([indexPath row] == [tableView numberOfRowsInSection:[indexPath section]]-1) {
        return NO;
    }
    
    return YES;
}

- (void)tableView:(UITableView *)tableView 
    moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath 
           toIndexPath:(NSIndexPath *)destinationIndexPath
{
    if ([destinationIndexPath row] == [tableView numberOfRowsInSection:[destinationIndexPath section]]-1) {
        BNRItemStore *store = [BNRItemStore sharedStore];
        [store moveItemAtIndex:[sourceIndexPath row] toIndex:[destinationIndexPath row]-1];
        [tableView reloadData];
        return;
    }
    
    [[BNRItemStore sharedStore] moveItemAtIndex:[sourceIndexPath row] toIndex:[destinationIndexPath row]];
}

@end
