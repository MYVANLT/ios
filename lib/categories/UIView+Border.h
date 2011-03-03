//
//  UIView+Border.h
//  RacingUK
//
//  Created by neil on 03/12/2009.
//  Copyright 2009 Chroma. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface UIView (Border)

+(void)drawBorderinView:(UIView*)view withColor:(UIColor*)color andStroke:(int)stroke left:(NSString*)left right:(NSString*)right top:(NSString*)top bottom:(NSString*)bottom;

@end
