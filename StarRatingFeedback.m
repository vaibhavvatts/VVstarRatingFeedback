
//
//  StarRatingFeedback.m
//  StarRatingLib
//
//  Created by Vaibhav Kumar on 16/05/15.
//  Copyright (c) 2015 Home. All rights reserved.
//

#import "StarRatingFeedback.h"
#import "StarBtnView.h"


@interface StarRatingFeedback()
{
    UIButton *starBtn;
}

@end

@implementation StarRatingFeedback


-(instancetype)init
{
    self = [super init];
    if (self) {
        self.isGradientEnabled = NO;
        self.isHalfRatingEnabled = NO;
        self.totalStars = 1;
        self.ratedColor = [UIColor redColor];
        self.unratedColor = [UIColor grayColor];
    }
    return self;
}


-(void)beginRating
{
    CGFloat xMargin = 80;
    for (int i = 0; i < self.totalStars; i++) {
        starBtn = [[StarBtnView alloc]initWithFrame:CGRectMake(i*xMargin,20,45,50)];
        starBtn.tag = i +101;
        [starBtn addTarget:self action:@selector(btnTapped:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:starBtn];
    }
}

-(void)btnTapped:(UIButton *)sender
{
    UIButton *btnStart = sender;
    int startNumber =  (uint)(btnStart.tag - 100);

    [self.delegate starsRating:startNumber];
}

-(void) addGradientGloss:(UIView *) viewControl {

    // Add Border
    CALayer *layer = viewControl.layer;
    //    layer.cornerRadius = 3.0f;
    //    layer.masksToBounds = YES;
    //    layer.borderWidth = .2f;
    //    layer.borderColor = [UIColor colorWithWhite:0.5f alpha:0.2f].CGColor;

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





/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
