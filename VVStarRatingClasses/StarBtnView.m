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
        _gradientColor = [UIColor clearColor];
        _starColor = [UIColor grayColor];
    }
    return self;
}


-(void)reDrawStars
{
    [self setNeedsDisplay];
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

    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = starPath.CGPath;
    shapeLayer.fillColor = _starColor.CGColor;
    shapeLayer.strokeColor = _starColor.CGColor;
    [self.layer addSublayer:shapeLayer];

    if (!(_gradientColor == [UIColor clearColor])) {
        CAGradientLayer *gradientLayer = [CAGradientLayer layer];
        gradientLayer.startPoint = CGPointMake(0.5,1.0);
        gradientLayer.endPoint = CGPointMake(0.5,0.0);
        gradientLayer.frame = CGRectMake(0, 0, self.frame.size.width , self.frame.size.height);
        NSMutableArray *colors = [NSMutableArray array];
        [colors addObject:(id)_starColor.CGColor];
        [colors addObject:(id)_gradientColor.CGColor];
        gradientLayer.colors = colors;
        [gradientLayer setMask:shapeLayer];
        [self.layer addSublayer:gradientLayer];
    }

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
