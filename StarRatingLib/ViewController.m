//
//  ViewController.m
//  StarRatingLib
//
//  Created by Vaibhav Kumar on 25/04/15.
//  Copyright (c) 2015 Home. All rights reserved.
//

#import "ViewController.h"
#import "StarRatingFeedback.h"
#import "StarBtnView.h"

@interface ViewController ()
{
     StarRatingFeedback *starLib;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    starLib = [[StarRatingFeedback alloc]initWithFrame:CGRectMake(0, 50, 300, 300)];
    starLib.totalStars = 3;
    
    [starLib beginRating];
    [self.view addSubview:starLib];
    
   
    
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.


}

@end
