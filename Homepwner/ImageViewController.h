//
//  ImageViewControllerViewController.h
//  Homepwner
//
//  Created by Travis McChesney on 6/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageViewController : UIViewController <UIScrollViewDelegate>
{
    __weak IBOutlet UIScrollView *scrollView;
    __weak IBOutlet UIImageView *imageView;
}
@property (nonatomic, strong) UIImage *image;

@end
