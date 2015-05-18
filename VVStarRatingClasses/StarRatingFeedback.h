//
//  StarRatingFeedback.h
//  StarRatingLib
//
//  Created by Vaibhav Kumar on 16/05/15.
//  Copyright (c) 2015 Home. All rights reserved.
//

#import <UIKit/UIKit.h>
@class StarBtnView;
@protocol StarRatingDelegate <NSObject>


//-(CGFloat)starsRating:(int)totalStars unratedColor:(UIColor *)unratedColor ratedColor:(UIColor *)ratedColor;

-(void)starsRating:(CGFloat)ratingValue;

@end




@interface StarRatingFeedback : UIView

@property (nonatomic, weak) id<StarRatingDelegate> delegate;

-(void)beginRating;
@property (nonatomic, strong) StarBtnView *starBtn;
@property UIColor *backgroundColor;
@property UIColor *unratedColor;
@property UIColor *ratedColor;
@property UIColor *unratedGradient;
@property UIColor *ratedGradient;

@property int totalStars;
// by default it is false
@property BOOL isHalfRatingEnabled;





@end
