//
//  RoundedCornerImageD.m
//  tutugogo
//
//  Created by ohsc on 11-12-28.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "RoundedCornerImageD.h"

#define kHeight 64
#define kRoundSize 10
@implementation RoundedCornerImageD

- (id)initWithFrame:(CGRect)frame
{
    CGRect aFrame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, kHeight);
    self = [super initWithFrame:aFrame];
    if (self) {
        // Initialization code
        
        CALayer *bgLayer = [CALayer layer];
        bgLayer.frame = CGRectMake(0, 0, self.layer.frame.size.width, self.layer.frame.size.height);
        bgLayer.delegate = [[RoundedCornerImageDBgLayerHelper alloc] init];
        [bgLayer setNeedsDisplay];
        [self.layer addSublayer:bgLayer];
    }
    return self;
}
@end

@implementation RoundedCornerImageDBgLayerHelper

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
{
    CGFloat minx = CGRectGetMinX(layer.frame) , midx = CGRectGetMidX(layer.frame), maxx = CGRectGetMaxX(layer.frame) ;
    CGFloat miny = CGRectGetMinY(layer.frame) , maxy = CGRectGetMaxY(layer.frame)-5 ;
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, minx, miny);
    CGPathAddArcToPoint(path, NULL, minx, maxy, midx, maxy, kRoundSize);
    CGPathAddArcToPoint(path, NULL, maxx, maxy, maxx, miny, kRoundSize);
    CGPathAddLineToPoint(path, NULL, maxx, miny);
    CGPathAddLineToPoint(path, NULL, minx, miny);
    CGPathCloseSubpath(path);
    
    CGContextRef imgCtx = CGBitmapContextCreate(NULL, layer.frame.size.width, layer.frame.size.height, 8, 0, CGColorSpaceCreateDeviceRGB(), kCGImageAlphaPremultipliedLast);

    CGContextAddPath(imgCtx, path);
    CGContextClip(imgCtx);

    UIImage *image = [UIImage imageNamed:@"pattern.png"];
    CGContextDrawTiledImage(imgCtx, CGRectMake(0, 0, image.size.width, image.size.height), image.CGImage);
    
    CGImageRef img = CGBitmapContextCreateImage(imgCtx);
    
    CGContextSetShadowWithColor(ctx, CGSizeMake(0, 0), 5, [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.4].CGColor);        

    CGContextDrawImage(ctx, layer.frame, img);
    
    CGPathRelease(path);
    CGContextRelease(imgCtx);
    CGImageRelease(img);
}


@end