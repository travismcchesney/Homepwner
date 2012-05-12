//
//  BNRItem.m
//  RandomPossessions
//
//  Created by Travis McChesney on 4/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BNRItem.h"

@implementation BNRItem

// Class Methods
+(id)randomItem
{
    // Create an array of three adjectives
    NSArray *randomAdjectiveList = [NSArray arrayWithObjects:@"Fluffy",
                                                             @"Rusty",
                                                             @"Shiny", nil];
    
    // Create an array of three nouns
    NSArray *randomNounList = [NSArray arrayWithObjects:@"Bear", 
                                                        @"Spork", 
                                                        @"Mac", nil];
    
    NSInteger adjectiveIndex = rand() % [randomAdjectiveList count];
    NSInteger nounIndex = rand() % [randomNounList count];
    
    NSString *randomName = [NSString stringWithFormat:@"%@ %@",
                            [randomAdjectiveList objectAtIndex:adjectiveIndex],
                            [randomNounList objectAtIndex:nounIndex]];
    
    int randomValue = rand() % 100;
    
    NSString *randomSerialNumber = [NSString stringWithFormat:@"%c%c%c%c%c",
                                    '0' + rand() % 10,
                                    'A' + rand() % 26,
                                    '0' + rand() % 10,
                                    'A' + rand() % 26,
                                    '0' + rand() % 10];
    
    BNRItem *newItem =
        [[self alloc] initWithItemName:randomName valueInDollars: randomValue serialNumber:randomSerialNumber];
    
    return newItem;
}

// Constructors
-(id)init
{
    return [self initWithItemName:@"Item"
                   valueInDollars:0
                     serialNumber:@""];
}

-(id)initWithItemName:(NSString *)name
       valueInDollars:(int)value 
         serialNumber:(NSString *)sNumber
{
    // Call the superclass' designated initializer
    self = [super init];
    
    // Did the superclass' designated initializer succeed?
    if (self){
        // Give the instance variables initial values
        [self setItemName:name];
        [self setSerialNumber:sNumber];
        [self setValueInDollars:value];
        dateCreated = [[NSDate alloc] init];
    }
    
    // Return the address of the newly initialized object
    return self;
}

-(NSString *)description
{
    NSString *descriptionString = 
    [[NSString alloc] initWithFormat:@"%@ (%@): Worth $%d, recorded on %@",
                        itemName,
                        serialNumber,
                        valueInDollars,
                        dateCreated];
    
    return descriptionString;
}

@synthesize itemName;
@synthesize containedItem, container, serialNumber, valueInDollars, dateCreated;

- (void)setContainedItem:(BNRItem *)i
{
    containedItem = i;
    [i setContainer:self];
}

- (void)dealloc
{
    NSLog(@"Destroyed: %@", self);
}

@end
