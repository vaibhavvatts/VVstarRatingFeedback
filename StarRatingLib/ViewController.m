//
//  ViewController.m
//  StarRatingLib
//
//  Created by Vaibhav Kumar on 25/04/15.
//  Copyright (c) 2015 Home. All rights reserved.
//

#import "ViewController.h"
#import "VVstarRating.h"
#import "StarDrawing.h"

@interface ViewController ()<VVstarRatingDelegate>
{
     VVstarRating *starLib;   
    
    __weak IBOutlet UILabel *lblRatings;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    starLib = [[VVstarRating alloc]initWithFrame:CGRectMake(0, 90,self.view.frame.size.width, 50)];
    starLib.totalStars = 5;
    starLib.delegate = self;
    [starLib beginRating];
    [self.view addSubview:starLib];
    
}

-(void)starsRating:(CGFloat)ratingValue
{
    lblRatings.text = [NSString stringWithFormat:@"Ratings given :  %.01f",ratingValue];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.


}

@end
