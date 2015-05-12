//
//  StarBtnView.m
//  StarRatingLib
//
//  Created by Vaibhav Kumar on 25/04/15.
//  Copyright (c) 2015 Home. All rights reserved.
//


#define xDist 23
#define yDist 11

#import "StarBtnView.h"

@implementation StarBtnView
{
    UIColor *unratedColor;
    UIColor *ratedColor;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

- (void)drawRect:(CGRect)rect {

    [self drawStar:[UIColor redColor]];

}


-(void)drawStar:(UIColor *)fillColor
{
    UIBezierPath* starPath = UIBezierPath.bezierPath;
    [starPath moveToPoint: CGPointMake(xDist, yDist)];
    [starPath addLineToPoint: CGPointMake(xDist + 8.11, yDist + 11.06)];
    [starPath addLineToPoint: CGPointMake(xDist + 21.87,yDist + 14.86)];
    [starPath addLineToPoint: CGPointMake(xDist + 13.12,yDist + 25.49)];
    [starPath addLineToPoint: CGPointMake(xDist + 13.52,yDist + 38.89)];
    [starPath addLineToPoint: CGPointMake(xDist + 0,yDist + 34.4)];
    [starPath addLineToPoint: CGPointMake(xDist - 13.52, yDist + 38.89)];
    [starPath addLineToPoint: CGPointMake(xDist - 13.12, yDist + 25.49)];
    [starPath addLineToPoint: CGPointMake(xDist - 21.87, yDist + 14.86)];
    [starPath addLineToPoint: CGPointMake(xDist - 8.11, yDist + 11.06)];
    [starPath closePath];
    [fillColor setFill];
    [starPath fill];
}


-(void) addGradientGloss:(UIView *) viewControl {

    // Add Border
    CALayer *layer = viewControl.layer;
    layer.cornerRadius = 3.0f;
    layer.masksToBounds = YES;
    layer.borderWidth = .2f;
    layer.borderColor = [UIColor colorWithWhite:0.5f alpha:0.2f].CGColor;

    // Add Shine
    CAGradientLayer *shineLayer = [CAGradientLayer layer];
    shineLayer.frame = layer.bounds;
    shineLayer.colors = [NSArray arrayWithObjects:
                         (id)[UIColor colorWithWhite:1.0f alpha:0.4f].CGColor,
                         (id)[UIColor colorWithWhite:1.0f alpha:0.2f].CGColor,
                         (id)[UIColor colorWithWhite:0.75f alpha:0.2f].CGColor,
                         (id)[UIColor colorWithWhite:0.4f alpha:0.2f].CGColor,
                         (id)[UIColor colorWithWhite:1.0f alpha:0.4f].CGColor,
                         nil];
    shineLayer.locations = [NSArray arrayWithObjects:
                            [NSNumber numberWithFloat:0.0f],
                            [NSNumber numberWithFloat:0.5f],
                            [NSNumber numberWithFloat:0.5f],
                            [NSNumber numberWithFloat:0.8f],
                            [NSNumber numberWithFloat:1.0f],
                            nil];
    [layer addSublayer:shineLayer];
}


@end
