//
//  RoundedCornerImageA.m
//  tutugogo
//
//  Created by ohsc on 11-12-28.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "RoundedCornerImageA.h"

#define kHeight 64
#define kRoundSize 10
@implementation RoundedCornerImageA

- (id)initWithFrame:(CGRect)frame
{
    CGRect aFrame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, kHeight);
    self = [super initWithFrame:aFrame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"pattern.png"]];
        self.layer.cornerRadius = kRoundSize;
        self.layer.masksToBounds = YES;
        
        [self.layer setShadowColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.3].CGColor];
        [self.layer setShadowOffset:CGSizeMake(0, 0)];
        [self.layer setShadowOpacity:1.0];
        [self.layer setShadowRadius:kRoundSize];

    }
    return self;
}
@end