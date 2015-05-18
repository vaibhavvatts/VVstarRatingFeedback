//
//  StarBtnView.h
//  StarRatingLib
//
//  Created by Vaibhav Kumar on 25/04/15.
//  Copyright (c) 2015 Home. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StarBtnView : UIButton


@property UIColor *starColor;
@property UIColor *gradientColor;


-(instancetype)initWithFrame:(CGRect)frame;
-(void)reDrawStars;


@end
