//
//  RoundedCornerImageD.h
//  tutugogo
//
//  Created by ohsc on 11-12-28.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface RoundedCornerImageD : UIView

@end

@interface RoundedCornerImageDBgLayerHelper : NSObject
- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx;
@end