
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
    NSMutableArray *arrStarBtn;
    
}

@end

@implementation StarRatingFeedback

static int currentStar = -1;

-(instancetype)init
{
    self = [super init];
    if (self) {

    }
    return self;
}
-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _isHalfRatingEnabled = YES;
        _totalStars = 5;
        _ratedColor = [UIColor yellowColor];
        _unratedColor = [UIColor lightGrayColor];
        _ratedGradient = [UIColor darkGrayColor];
        _unratedGradient = [UIColor darkGrayColor];
    }
    return self;
}

-(void)beginRating
{

    arrStarBtn = [[NSMutableArray alloc]init];
    CGFloat xMargin = 50;
    for (int i = 0; i < self.totalStars; i++) {
        _starBtn = [[StarBtnView alloc]initWithFrame:CGRectMake(i*xMargin,0,50,50)];
        [_starBtn setGradientColor:_unratedGradient];
        [_starBtn setStarColor:_unratedColor];
        _starBtn.tag = i +101;
        [_starBtn addTarget:self action:@selector(btnTapped:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_starBtn];
        [arrStarBtn addObject:_starBtn];
    }
}

-(void)btnTapped:(StarBtnView *)sender
{
    StarBtnView *btnStart = sender;
    int startNumber =  (uint)(btnStart.tag - 101);
    
    if (startNumber == currentStar && _isHalfRatingEnabled) {
        btnStart = (StarBtnView *)[arrStarBtn objectAtIndex:currentStar];
        [btnStart setGradientColor:_unratedGradient];
        [btnStart setStarColor:_unratedGradient];
        [btnStart setIsHalf:YES];
        [btnStart reDrawStars];
        currentStar = -1;
        [self.delegate starsRating:(1+(float)startNumber - .5)];
    }else{
        for (int i =startNumber+1; i<_totalStars ; i++) {
            btnStart = (StarBtnView *)[arrStarBtn objectAtIndex:i];
            [btnStart setGradientColor:_unratedGradient];
            [btnStart setStarColor:_unratedColor];
            [btnStart setIsHalf:NO];
            [btnStart reDrawStars];
        }
        for (int i =startNumber; i>=0; i--) {
            btnStart = (StarBtnView *)[arrStarBtn objectAtIndex:i];
            [btnStart setGradientColor:_ratedGradient];
            [btnStart setStarColor:_ratedColor];
            [btnStart setIsHalf:NO];
            [btnStart reDrawStars];
        }
        currentStar = startNumber;
        [self.delegate starsRating:(1+startNumber)];
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
