//
//  GradiantRectView.m
//  RacingUK
//
//  Created by Neil Edwards on 30/04/2009.
//  Copyright 2009 buffer. All rights reserved.
//

#import "GradiantRectView.h"
#import "UIColor-Expanded.h"
#import <QuartzCore/QuartzCore.h>

@implementation GradiantRectView
@synthesize strokeColor;
@synthesize rectColor;
@synthesize startColor;
@synthesize endColor;
@synthesize strokeWidth;
@synthesize cornerRadius;


/***********************************************************/
// dealloc
/***********************************************************/
- (void)dealloc
{
    [strokeColor release], strokeColor = nil;
    [rectColor release], rectColor = nil;
    [startColor release], startColor = nil;
    [endColor release], endColor = nil;
	
    [super dealloc];
}



- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
		self.strokeColor = kDefaultStrokeColor;
        self.rectColor = kDefaultRectColor;
        self.strokeWidth = kDefaultStrokeWidth;
        self.cornerRadius = kDefaultCornerRadius;
		self.backgroundColor=[UIColor blackColor];
    }
    return self;
}


- (void)drawRect:(CGRect)rect {
	
		
		CGContextRef currentContext = UIGraphicsGetCurrentContext();
		
		CGGradientRef glossGradient;
		CGColorSpaceRef rgbColorspace;
		size_t num_locations = 2;
		CGFloat locations[2] = { 0.0, 1.0 };
	
		CGFloat components[8] = { startColor.red,startColor.green,startColor.blue, 0.35,  // Start color, ie white
		endColor.red,endColor.green,endColor.blue, 0.06 }; // End color
		
		rgbColorspace = CGColorSpaceCreateDeviceRGB();
		glossGradient = CGGradientCreateWithColorComponents(rgbColorspace, components, locations, num_locations);
		
		CGRect currentBounds = self.bounds;
		CGPoint topCenter = CGPointMake(CGRectGetMidX(currentBounds), 0.0f);
		CGPoint midCenter = CGPointMake(CGRectGetMidX(currentBounds), CGRectGetMidY(currentBounds));
		CGContextDrawLinearGradient(currentContext, glossGradient, topCenter, midCenter, 0);
		
		CGGradientRelease(glossGradient);
		CGColorSpaceRelease(rgbColorspace); 
	
	
}




@end
