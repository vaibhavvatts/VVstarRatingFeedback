//
//  StarRatingFeedback.h
//  StarRatingLib
//
//  Created by Vaibhav Kumar on 16/05/15.
//  Copyright (c) 2015 Home. All rights reserved.
//

#import <UIKit/UIKit.h>
@class StarDrawing;

typedef NS_ENUM(NSUInteger, VVStarSpacing){
    VVStarSpacingAdjacent,
    VVStarSpacingOccupied
};

typedef NS_ENUM(NSUInteger, VVStarAlign){
    VVStarAlignHorizontal,
    VVStarAlignVertical
};

@protocol VVstarRatingDelegate <NSObject>
-(void)starsRating:(CGFloat)ratingValue;
@end


@interface VVstarRating : UIView

@property (nonatomic, weak) id<VVstarRatingDelegate> delegate;

-(void)beginRating;

@property (nonatomic, strong) StarDrawing *starBtn;

@property UIColor *backgroundColor;
@property UIColor *unratedColor;
@property UIColor *ratedColor;
@property UIColor *unratedGradient;
@property UIColor *ratedGradient;
@property VVStarSpacing starSpacing;
@property VVStarAlign starAlign;
@property int totalStars;
@property BOOL isHalfRatingEnabled;

@end
