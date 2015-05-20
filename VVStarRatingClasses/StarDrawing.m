//
//  StarBtnView.m
//  StarRatingLib
//
//  Created by Vaibhav Kumar on 25/04/15.
//  Copyright (c) 2015 Home. All rights reserved.
//


#define xDist 23
#define yDist 11

//#define widthHalf self.frame.size.width/2;
//#define heightHalf self.frame.size.height/2;
//
//#define oneThirdWidth self.frame.size.width/3;
//#define twoThirdWidth (2*self.frame.size.width)/3;
//
//#define oneThirdHeight self.frame.size.height/3;
//#define twoThirdHeight (2*self.frame.size.height)/3;

#import "StarDrawing.h"


@interface StarDrawing()
{
    CGFloat width;
    CGFloat height;
    CGFloat widthHalf;
    CGFloat heightHalf;
    CGFloat oneThirdWidth;
    CGFloat twoThirdWidth;
    CGFloat oneThirdHeight;
    CGFloat twoThirdHeight;
}

@end

@implementation StarDrawing

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _gradientColor = [UIColor clearColor];
        _starColor = [UIColor grayColor];
     
        width          = frame.size.width;
        height          = frame.size.height;
        widthHalf      = frame.size.width/2;
        heightHalf     = frame.size.height/2;
        oneThirdWidth  =  frame.size.width/3;
        twoThirdWidth  = (2*frame.size.width)/3;
        oneThirdHeight = frame.size.height/3;
        twoThirdHeight = (2*frame.size.height)/3;
    }
    return self;
}


-(void)reDrawStars
{
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    if (_isHalf) {
        [self drawHalfStar];
    }else{
         [self drawStar:[UIColor redColor]];
    }
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

//    [starPath moveToPoint: CGPointMake(widthHalf,0)];
//    [starPath addLineToPoint: CGPointMake(twoThirdWidth, oneThirdHeight)];
//    [starPath addLineToPoint: CGPointMake(width, (heightHalf + oneThirdHeight)/2 )];
//    [starPath addLineToPoint: CGPointMake(twoThirdWidth, twoThirdHeight)];
//    [starPath addLineToPoint: CGPointMake(twoThirdWidth + oneThirdWidth/2, height)];
//    [starPath addLineToPoint: CGPointMake(widthHalf, twoThirdHeight + oneThirdHeight/2)];
//    
//    [starPath addLineToPoint: CGPointMake(oneThirdWidth/2, height)];
//    [starPath addLineToPoint: CGPointMake(oneThirdWidth, twoThirdHeight)];
//    [starPath addLineToPoint: CGPointMake(0,  (heightHalf + oneThirdHeight)/2)];
//    [starPath addLineToPoint: CGPointMake(oneThirdWidth, oneThirdHeight)];
    
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

-(void)drawHalfStar
{
    UIBezierPath* starPath = UIBezierPath.bezierPath;
    [starPath moveToPoint: CGPointMake(xDist, yDist)];
    [starPath addLineToPoint: CGPointMake(xDist + 8.11, yDist + 11.06)];
    [starPath addLineToPoint: CGPointMake(xDist + 21.87,yDist + 14.86)];
    [starPath addLineToPoint: CGPointMake(xDist + 13.12,yDist + 25.49)];
    [starPath addLineToPoint: CGPointMake(xDist + 13.52,yDist + 38.89)];
    [starPath addLineToPoint: CGPointMake(xDist + 0,yDist + 34.4)];
    
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

// unused for now.
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
