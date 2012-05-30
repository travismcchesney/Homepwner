//
//  OverlayView.m
//  Homepwner
//
//  Created by Travis McChesney on 5/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "OverlayView.h"

@implementation OverlayView

@synthesize crosshairColor;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor clearColor]];
        crosshairColor = [UIColor redColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect bounds = [self bounds];
    
    // Figure out the center of the bounds rectangle
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
    [[self crosshairColor] setStroke];
    
    // Set the fill color of the current context to black
    [[UIColor blackColor] setFill];
    
    // Add crosshair
    
    CGContextSetLineWidth(ctx, 2);
    
    [[UIColor greenColor] setStroke];
    CGContextMoveToPoint(ctx, center.x, center.y);
    
    CGContextAddLineToPoint(ctx, center.x + 20, center.y);
    CGContextMoveToPoint(ctx, center.x, center.y);
    CGContextAddLineToPoint(ctx, center.x - 20, center.y);
    CGContextMoveToPoint(ctx, center.x, center.y);
    CGContextAddLineToPoint(ctx, center.x, center.y + 20);
    CGContextMoveToPoint(ctx, center.x, center.y);
    CGContextAddLineToPoint(ctx, center.x, center.y - 20);
    
    CGContextStrokePath(ctx);
}

@end
