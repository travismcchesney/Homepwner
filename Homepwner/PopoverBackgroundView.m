//
//  PopoverBackgroundView.m
//  Homepwner
//
//  Created by Travis McChesney on 5/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PopoverBackgroundView.h"

@implementation PopoverBackgroundView

@synthesize arrowDirection, arrowOffset;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _borderImageView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"Border.png"]resizableImageWithCapInsets:UIEdgeInsetsMake(25, 25, 35, 35)]];
        
        _arrowView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow.png"]];
        
        [self addSubview:_borderImageView];
        [self addSubview:_arrowView];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-  (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat _height = self.frame.size.height;
    CGFloat _width = self.frame.size.width;
    CGFloat _left = 0.0;
    CGFloat _top = 0.0;
    CGFloat _coordinate = 0.0;
    CGAffineTransform _rotation = CGAffineTransformIdentity;
    
    CGFloat ARROW_HEIGHT = 10;
    CGFloat ARROW_BASE = 25; 
    
    self.arrowDirection = UIPopoverArrowDirectionDown;
    
    switch (self.arrowDirection) {
        case UIPopoverArrowDirectionUp:
            _top += ARROW_HEIGHT;
            _height -= ARROW_HEIGHT;
            _coordinate = ((self.frame.size.width / 2) + self.arrowOffset) - (ARROW_BASE/2);
            _arrowView.frame = CGRectMake(_coordinate, 0, ARROW_BASE, ARROW_HEIGHT);            
            break;
            
            
        case UIPopoverArrowDirectionDown:
            _height -= ARROW_HEIGHT;
            _coordinate = ((self.frame.size.width / 2) + self.arrowOffset) - (ARROW_BASE/2);
            _arrowView.frame = CGRectMake(_coordinate, _height, ARROW_BASE, ARROW_HEIGHT); 
            _rotation = CGAffineTransformMakeRotation( M_PI );
            break;
            
        case UIPopoverArrowDirectionLeft:
            _left += ARROW_BASE;
            _width -= ARROW_BASE;
            _coordinate = ((self.frame.size.height / 2) + self.arrowOffset) - (ARROW_HEIGHT/2);
            _arrowView.frame = CGRectMake(0, _coordinate, ARROW_BASE, ARROW_HEIGHT); 
            _rotation = CGAffineTransformMakeRotation( -M_PI_2 );
            break;
            
        case UIPopoverArrowDirectionRight:
            _width -= ARROW_BASE;
            _coordinate = ((self.frame.size.height / 2) + self.arrowOffset)- (ARROW_HEIGHT/2);
            _arrowView.frame = CGRectMake(_width, _coordinate, ARROW_BASE, ARROW_HEIGHT); 
            _rotation = CGAffineTransformMakeRotation( M_PI_2 );
            
            break;
            
    }
    
    _borderImageView.frame =  CGRectMake(_left, _top, _width, _height);
    
    
    [_arrowView setTransform:_rotation];
    
}

+(UIEdgeInsets)contentViewInsets{
    return UIEdgeInsetsMake(25, 10, 10, 10);
}

+ (CGFloat)arrowBase
{
    return 10;
}

+ (CGFloat)arrowHeight
{
    return 15;
}

@end
