#VVStarRatingFeedback

<b>What it is :</b>

Give feedback ratings using stars. With severe customization options. Including half star rating enabled. Sample code included.

<b>Features :</b>

1. Rated callback(float value) in calling class.
2. Complete customization of Stars.
3. Easy to use library.
4. Adjust spaceing and Alignment using Enum tag
5. Half star rating enabled and can be toggled.

<img src="https://vattsblog.files.wordpress.com/2015/05/screen-shot-2015-05-20-at-4-53-37-pm.png" alt="ScreenShot"><img src="https://vattsblog.files.wordpress.com/2015/05/screen-shot-2015-05-20-at-4-53-45-pm.png" alt="ScreenShot"><img src="https://vattsblog.files.wordpress.com/2015/05/screen-shot-2015-05-20-at-4-53-51-pm.png" alt="ScreenShot">



<b>how to use : </b>

Drag and drop VVStarRatingClasses folder in your project and import StarDrawing file in your viewcontroller.

<code>
starLib = [[VVstarRatingalloc]initWithFrame:CGRectMake(0, 90,self.view.frame.size.width, 50)];   
starLib.totalStars = 5;

starLib.delegate = self;

[starLibbeginRating];

[self.viewaddSubview:starLib];

</code>

If rated star value is need confirm to a protocol VVstarRatingDelegate and implement it's instance method

<code>
-(void)starsRating:(CGFloat)ratingValue

Cutomizing options : 

properties provided to customize are : 

UIColor *backgroundColor;

UIColor *unratedColor;

UIColor *ratedColor;

UIColor *unratedGradient;

UIColor *ratedGradient;

VVStarSpacing starSpacing;

VVStarAlign starAlign;

int totalStars;

BOOL isHalfRatingEnabled;

Enums provided : 

    VVStarAlignHorizontal,

    VVStarAlignVertical

    VVStarSpacingAdjacent,

    VVStarSpacingOccupied
</code>


<b>For detailed documentation visit my blog : https://vattsblog.wordpress.com/2015/05/20/204/</b>
