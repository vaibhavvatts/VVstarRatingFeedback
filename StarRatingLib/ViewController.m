//
//  ViewController.m
//  StarRatingLib
//
//  Created by Vaibhav Kumar on 25/04/15.
//  Copyright (c) 2015 Home. All rights reserved.
//

#import "ViewController.h"
#import "StarsLibViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    StarsLibViewController *starLib = [[StarsLibViewController alloc]init];
    starLib.totalStars = 3;
    [starLib beginRating];
    [self.view addSubview:starLib.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.


}

@end
