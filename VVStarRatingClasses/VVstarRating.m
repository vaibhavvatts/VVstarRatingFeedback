
//
//  StarRatingFeedback.m
//  StarRatingLib
//
//  Created by Vaibhav Kumar on 16/05/15.
//  Copyright (c) 2015 Home. All rights reserved.
//

#import "VVstarRating.h"
#import "StarDrawing.h"


@interface VVstarRating()
{
    NSMutableArray *arrStarBtn;
    
}

@end

@implementation VVstarRating

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
        _starSpacing = VVStarSpacingAdjacent;
        _starAlign = VVStarAlignHorizontal;
        _ratedColor = [UIColor colorWithRed:255.0f/255.0f green:215.0f/255.0f blue:0.0f/255.0f alpha:1];
        _unratedColor = [UIColor lightGrayColor];
        _ratedGradient = [UIColor lightGrayColor];
        _unratedGradient = [UIColor darkGrayColor];
    }
    return self;
}

-(void)beginRating
{
    arrStarBtn = [[NSMutableArray alloc]init];
    CGFloat xMargin = 50;
    if ((_starSpacing == VVStarSpacingOccupied) && (self.frame.size.width > (xMargin * _totalStars))) {
       xMargin = xMargin + ( self.frame.size.width - (xMargin * _totalStars))/_totalStars;
    }
    
    for (int i = 0; i < self.totalStars; i++) {
        if (_starAlign == VVStarAlignHorizontal) {
           _starBtn = [[StarDrawing alloc]initWithFrame:CGRectMake(i*xMargin,0,50,50)];
        }else if (_starAlign == VVStarAlignVertical){
            _starBtn = [[StarDrawing alloc]initWithFrame:CGRectMake(0,i*xMargin,50,50)];
        }
        
        [_starBtn setGradientColor:_unratedGradient];
        [_starBtn setStarColor:_unratedColor];
        _starBtn.tag = i +101;
        [_starBtn addTarget:self action:@selector(btnTapped:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_starBtn];
        [arrStarBtn addObject:_starBtn];
    }
}

-(void)btnTapped:(StarDrawing *)sender
{
    StarDrawing *btnStart = sender;
    int startNumber =  (uint)(btnStart.tag - 101);
    
    if (startNumber == currentStar && _isHalfRatingEnabled) {
        btnStart = (StarDrawing *)[arrStarBtn objectAtIndex:currentStar];
        [btnStart setGradientColor:_unratedGradient];
        [btnStart setStarColor:_unratedGradient];
        [btnStart setIsHalf:YES];
        [btnStart reDrawStars];
        currentStar = -1;
        [self.delegate starsRating:(1+(float)startNumber - .5)];
    }else{
        for (int i =startNumber+1; i<_totalStars ; i++) {
            btnStart = (StarDrawing *)[arrStarBtn objectAtIndex:i];
            [btnStart setGradientColor:_unratedGradient];
            [btnStart setStarColor:_unratedColor];
            [btnStart setIsHalf:NO];
            [btnStart reDrawStars];
        }
        for (int i =startNumber; i>=0; i--) {
            btnStart = (StarDrawing *)[arrStarBtn objectAtIndex:i];
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
