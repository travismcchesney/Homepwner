//
//  HomepwnerStepperCell.h
//  Homepwner
//
//  Created by Travis McChesney on 6/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseCell.h"

@interface HomepwnerStepperCell : BaseCell

@property (weak, nonatomic) IBOutlet UIImageView *thumbnailView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *serialNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *valueLabel;
@property (weak, nonatomic) IBOutlet UIStepper *stepper;

- (IBAction)showImage:(id)sender;
- (IBAction)changeValue:(id)sender;

@end


