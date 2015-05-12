//
//  StarsLibViewController.m
//  StarRatingLib
//
//  Created by Vaibhav Kumar on 25/04/15.
//  Copyright (c) 2015 Home. All rights reserved.
//

#import "StarsLibViewController.h"
#import "StarBtnView.h"

@interface StarsLibViewController ()

@end

@implementation StarsLibViewController

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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.



}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)beginRating
{
    CGFloat xMargin = 80;
    for (int i = 0; i < self.totalStars; i++) {
        UIButton *starBtn = [[StarBtnView alloc]initWithFrame:CGRectMake(i*xMargin,20,45,50)];
        //starBtn.tag = i +1;
        //starBtn.backgroundColor = [UIColor greenColor];
        [self addGradientGloss:starBtn];
        [starBtn addTarget:self action:@selector(btnTapped) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:starBtn];
    }
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

-(void)btnTapped
{
    //UIButton *btnStart = sender;

}
/*
 #pragma mark - Navigation

 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
