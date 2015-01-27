//
//  FNReviewViewController.m
//  Foodenak
//
//  Created by Surajit Dhara on 22/01/15.
//  Copyright (c) 2015 Esolz Tech. All rights reserved.
//

#import "FNReviewViewController.h"
#import "ViewController.h"
#define RGBCOLOR(x,y,z,f) [UIColor colorWithRed:(x/255.0f) green:(y/255.0f) blue:(z/255.0f) alpha:f]

#define  MainScreenHeight [[UIScreen mainScreen]bounds].size.height

#define  MainScreenWidth  [[UIScreen mainScreen]bounds].size.width
#define HALVELTICA(x)  [UIFont fontWithName:@"Helvetica Bold" size:x]

#define HALVELTICA_LIGHT(x)  [UIFont fontWithName:@"Helvetica Light" size:x]
@interface FNReviewViewController ()<UIScrollViewDelegate,UITextViewDelegate>{
    
    UILabel *Review;
    UITextView *ReviewTextview;
    UIView *  TopStartContainerView1;
    UIView *AtmosphereStartContainerView,*PresentationStartContainerView,*ServiceStartContainerView,* TestStartContainerView;
}

@end

@implementation FNReviewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   UIView * MainView=[[UIView alloc]initWithFrame:CGRectMake(0,0,MainScreenWidth,MainScreenHeight)];
    MainView.backgroundColor=RGBCOLOR(222, 222, 222, 1);
    MainView.userInteractionEnabled=YES;
    [self.view addSubview:MainView];
    
  UIImageView *  topview=[[UIImageView alloc]initWithFrame:CGRectMake(MainView.frame.origin.x,MainView.frame.origin.y-20,MainView.frame.size.width,100)];
    topview.image=[UIImage imageNamed:@"topview"];
    topview.userInteractionEnabled=YES;
    [MainView addSubview:topview];
    
    //back button declare......
    UIImage *backImage=[UIImage imageNamed:@"backarrow"];
  UIButton *  BackButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [BackButton setFrame:CGRectMake(20,55, backImage.size.width/2, backImage.size.height/2)];
    [BackButton setImage:backImage forState:UIControlStateNormal];
    [BackButton setImage:backImage forState:UIControlStateHighlighted];
    [BackButton setImage:backImage forState:UIControlStateSelected];
    [BackButton addTarget:self action:@selector(Backbutton:) forControlEvents:UIControlEventTouchUpInside];
    [topview addSubview:BackButton];
    
    
    //edit profile label allocation....
    
  UILabel *  KfcBACKLabel = [[UILabel alloc]initWithFrame:CGRectMake(BackButton.frame.origin.x+BackButton.frame.size.width+4,47, 120, backImage.size.height)];
    [KfcBACKLabel setBackgroundColor:[UIColor clearColor]];
    [KfcBACKLabel setText:@"Write Review"];
    [KfcBACKLabel setTextAlignment:NSTextAlignmentLeft];
    [KfcBACKLabel setTextColor:[UIColor whiteColor]];
    [KfcBACKLabel setFont:HALVELTICA(15)];
    [topview addSubview:KfcBACKLabel];
    
    
    UIView *HeaderNarrowBar=[[UIView alloc]initWithFrame:CGRectMake(0, topview.frame.origin.y+topview.frame.size.height, MainScreenWidth, 2)];
    [HeaderNarrowBar setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"shadowbar-1"]]];
    [MainView addSubview:HeaderNarrowBar];
    
    
    
  UIScrollView *  MainScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0.0f,HeaderNarrowBar.frame.origin.y+HeaderNarrowBar.frame.size.height, self.view.frame.size.width, self.view.frame.size.height-80)];
    MainScroll.userInteractionEnabled=YES;
    MainScroll.scrollEnabled=YES;
    MainScroll.delegate=self;
    MainScroll.bounces=YES;
    MainScroll.showsHorizontalScrollIndicator=NO;
    [MainView addSubview:MainScroll];
    
    
    MainScroll.contentSize = CGSizeMake(0, 900);
    
    
    
    UIView *MainContainerView=[[UIView alloc]initWithFrame:CGRectMake(20, 0, MainScroll.frame.size.width-40, MainScroll.frame.size.height+350)];
    [MainScroll addSubview:MainContainerView];
    MainContainerView.layer.cornerRadius=4.0;
    [MainContainerView setBackgroundColor:[UIColor whiteColor]];
    
    ///start of uppppppppp
    
    UIImageView *Top=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, MainContainerView.frame.size.width, 43/2)];
    [Top setImage:[UIImage imageNamed:@"Top"]];
    [MainContainerView addSubview:Top];
    
    UIView *UpCardView=[[UIView alloc]initWithFrame:CGRectMake(20,30, MainContainerView.frame.size.width-40,312/2)];
    [UpCardView setBackgroundColor:RGBCOLOR(246, 246, 246, 1)];
    [MainContainerView addSubview:UpCardView];
    UpCardView.layer.cornerRadius=4.0;
    
    
    UIImageView *KfcImgView=[[UIImageView alloc] initWithFrame:CGRectMake(20, 10, 107/2, 99/2)];
    [KfcImgView setImage:[UIImage imageNamed:@"KfcPIc"]];
    [UpCardView addSubview:KfcImgView];
   
    
    UILabel *CostLbl=[[UILabel alloc]initWithFrame:CGRectMake(90, KfcImgView.frame.origin.y-2.5, 80, 20)];
    [CostLbl setBackgroundColor:[UIColor clearColor]];
    [CostLbl setFont:HALVELTICA(18)];
    [CostLbl setTextColor:RGBCOLOR(50, 50, 50, 1)];
    [CostLbl setTextAlignment:NSTextAlignmentLeft];
    [CostLbl setText:@"KFC"];
    [UpCardView addSubview:CostLbl];
    
    if ([[UIScreen mainScreen]bounds].size.width == 320)
    {
        UILabel *DolLbl=[[UILabel alloc]initWithFrame:CGRectMake(190, KfcImgView.frame.origin.y-2.5, 80, 20)];
        [DolLbl setBackgroundColor:[UIColor clearColor]];
        [DolLbl setFont:HALVELTICA(14)];
        [DolLbl setTextColor:[UIColor lightGrayColor]];
        [DolLbl setTextAlignment:NSTextAlignmentLeft];
        [DolLbl setText:@"90.0$"];
        [UpCardView addSubview:DolLbl];
    }
    else
    {
    UILabel *DolLbl=[[UILabel alloc]initWithFrame:CGRectMake(220, KfcImgView.frame.origin.y-2.5, 80, 20)];
    [DolLbl setBackgroundColor:[UIColor clearColor]];
    [DolLbl setFont:HALVELTICA(14)];
    [DolLbl setTextColor:[UIColor lightGrayColor]];
    [DolLbl setTextAlignment:NSTextAlignmentLeft];
    [DolLbl setText:@"90.0$"];
    [UpCardView addSubview:DolLbl];
    }
    int topRate=4;
    UIView *  TopStartContainerView=[[UIView alloc]initWithFrame:CGRectMake(110 ,65, 200, 35)];
    
    TopStartContainerView.backgroundColor=[UIColor clearColor];
    
    [MainContainerView addSubview:TopStartContainerView];
    
    CGRect PreFrame2=CGRectMake(0, 5, 43/2, 39/2);
    
    
    
    for (int i=0; i<5; i++) {
        
        UIButton * StarBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        
        [StarBtn setFrame:PreFrame2];
        
        NSString *ImageName=nil;
        
        if (topRate>i) {
            
            ImageName=@"RedStar";
            
        } else {
            ImageName=@"GrayStart";
            
        }
        
        [StarBtn setBackgroundImage:[UIImage imageNamed:ImageName] forState:UIControlStateNormal];
        
        [StarBtn setBackgroundImage:[UIImage imageNamed:ImageName] forState:UIControlStateSelected];
        
        [StarBtn setBackgroundImage:[UIImage imageNamed:ImageName] forState:UIControlStateHighlighted];
        
        [TopStartContainerView addSubview:StarBtn];
        
        PreFrame2.origin.x=PreFrame2.origin.x+PreFrame2.size.width+9;
        
        
        
    }
   UIImageView* TopMapImgView=[[UIImageView alloc]initWithFrame:CGRectMake(90, 80, 19/2, 26/2)];
    [TopMapImgView setImage:[UIImage imageNamed:@"LPin"]];
    [UpCardView addSubview:TopMapImgView];
    
   UILabel* TopMapLabel=[[UILabel alloc]initWithFrame:CGRectMake(112, 80, 180, 15)];
    [TopMapLabel setFont:HALVELTICA(12)];
    [TopMapLabel setTextColor:RGBCOLOR(90, 90, 90, 1)];
    [TopMapLabel setTextAlignment:NSTextAlignmentLeft];
    [TopMapLabel setText:@"Lorem ipsum dolar"];
    [UpCardView addSubview:TopMapLabel];

    
    UIImageView* TopMapImgView1=[[UIImageView alloc]initWithFrame:CGRectMake(90, 100, 27/2, 23/2)];
    [TopMapImgView1 setImage:[UIImage imageNamed:@"FFFFF"]];
    [UpCardView addSubview:TopMapImgView1];
    
    UILabel* TopMapLabel1=[[UILabel alloc]initWithFrame:CGRectMake(112, 100, 180, 15)];
    [TopMapLabel1 setFont:HALVELTICA(12)];
    [TopMapLabel1 setTextColor:RGBCOLOR(90, 90, 90, 1)];
    [TopMapLabel1 setTextAlignment:NSTextAlignmentLeft];
    [TopMapLabel1 setText:@"Fast food"];
    [UpCardView addSubview:TopMapLabel1];
    
    
    
    
    UIView *Hs1=[[UIView alloc]initWithFrame:CGRectMake(0, UpCardView.frame.origin.y+UpCardView.frame.size.height+20, MainContainerView.frame.size.width, 1)];
    [Hs1 setBackgroundColor:RGBCOLOR(230, 230, 230, 1)];
    [MainContainerView addSubview:Hs1];

    
    /// end of uuuuuuuuppppppp
    
    
    //***************************************************************
    
    UIView *TopRatingSubView1=[[UIView alloc]initWithFrame:CGRectMake(0, Hs1.frame.origin.y+1, MainContainerView.frame.size.width,42)];
    [TopRatingSubView1 setBackgroundColor:[UIColor clearColor]];
    [MainContainerView addSubview:TopRatingSubView1];
    
    UILabel* TopMapLabel11=[[UILabel alloc]initWithFrame:CGRectMake(22, 10, 180, 15)];
    [TopMapLabel11 setFont:HALVELTICA_LIGHT(14)];
    [TopMapLabel11 setTextColor:RGBCOLOR(90, 90, 90, 1)];
    [TopMapLabel11 setTextAlignment:NSTextAlignmentLeft];
    [TopMapLabel11 setText:@"Overall"];
    [TopRatingSubView1 addSubview:TopMapLabel11];
    
    
    int CardstopRate=4;
    
    if ([[UIScreen mainScreen]bounds].size.width == 320)
    {
      TopStartContainerView1=[[UIView alloc]initWithFrame:CGRectMake(120 ,0, 150, 35)];
        TopStartContainerView1.backgroundColor=[UIColor clearColor];
        
        [TopRatingSubView1 addSubview:TopStartContainerView1];
    }
    else
    {
    TopStartContainerView1=[[UIView alloc]initWithFrame:CGRectMake(160 ,0, 150, 35)];
        TopStartContainerView1.backgroundColor=[UIColor clearColor];
        
        [TopRatingSubView1 addSubview:TopStartContainerView1];
    }
 
    
    CGRect PreFrame22=CGRectMake(0, 10, 33/2, 30/2);
    
    
    
    for (int i=0; i<5; i++) {
        
        UIButton * StarBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        
        [StarBtn setFrame:PreFrame22];
        
        NSString *ImageName=nil;
        
        if (CardstopRate>i) {
            
            ImageName=@"SmallStar";
            
        } else {
            ImageName=@"SmallFadeStar";
            
        }
        
        [StarBtn setBackgroundImage:[UIImage imageNamed:ImageName] forState:UIControlStateNormal];
        
        [StarBtn setBackgroundImage:[UIImage imageNamed:ImageName] forState:UIControlStateSelected];
        
        [StarBtn setBackgroundImage:[UIImage imageNamed:ImageName] forState:UIControlStateHighlighted];
        
        [TopStartContainerView1 addSubview:StarBtn];
        
        PreFrame22.origin.x=PreFrame22.origin.x+PreFrame22.size.width+18;
        
        
        
    }
    UIView *Hs2=[[UIView alloc]initWithFrame:CGRectMake(0, 41, MainContainerView.frame.size.width, 1.3)];
    [Hs2 setBackgroundColor:RGBCOLOR(230, 230, 230, 1)];
    [TopRatingSubView1 addSubview:Hs2];
    
    
    
    
    
    //START OF TEST LABEL
    
    int Cradstest=4;
    UIView *TestRatingSubView=[[UIView alloc]initWithFrame:CGRectMake(0,TopRatingSubView1.frame.size.height+TopRatingSubView1.frame.origin.y, MainContainerView.frame.size.width,35)];
    
    [TestRatingSubView setBackgroundColor:RGBCOLOR(255, 255, 255, 1)];
    [MainContainerView addSubview:TestRatingSubView];
    
    UILabel *TitleLbl=[[UILabel alloc] initWithFrame:CGRectMake(20, 4, 50, 23)];
    [TitleLbl setText:@"Test"];
    [TitleLbl setTextColor:RGBCOLOR(100, 100, 100, 1)];
    [TitleLbl setFont:HALVELTICA_LIGHT(14)];
    [TestRatingSubView addSubview:TitleLbl];
    
    
    // STARS START
    
    if ([[UIScreen mainScreen]bounds].size.width == 320) {
        
        TestStartContainerView=[[UIView alloc]initWithFrame:CGRectMake(170 ,5,103, 26)];
        
        TestStartContainerView.backgroundColor=[UIColor clearColor];
        
        [TestRatingSubView addSubview:TestStartContainerView];
    }
    else
    {
        TestStartContainerView=[[UIView alloc]initWithFrame:CGRectMake(210 ,5,103, 26)];
        
        TestStartContainerView.backgroundColor=[UIColor clearColor];
        
        [TestRatingSubView addSubview:TestStartContainerView];
    }
   
    
    CGRect PreFrame3=CGRectMake(0, 2, 33/2, 30/2);
    
    
    
    for (int i=0; i<5; i++) {
        
        UIButton * StarBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        
        [StarBtn setFrame:PreFrame3];
        
        NSString *ImageName=nil;
        
        if (Cradstest>i) {
            
            ImageName=@"SmallStar";
            
        } else {
            ImageName=@"SmallFadeStar";
            
        }
        
        [StarBtn setBackgroundImage:[UIImage imageNamed:ImageName] forState:UIControlStateNormal];
        
        [StarBtn setBackgroundImage:[UIImage imageNamed:ImageName] forState:UIControlStateSelected];
        
        [StarBtn setBackgroundImage:[UIImage imageNamed:ImageName] forState:UIControlStateHighlighted];
        
        [TestStartContainerView addSubview:StarBtn];
        
        PreFrame3.origin.x=PreFrame3.origin.x+PreFrame3.size.width+5;
        
        
        
    }
    
    
    
    UIView *HS3=[[UIView alloc]initWithFrame:CGRectMake(0, 34, TestRatingSubView.frame.size.width, 1)];
    [HS3 setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"line2"]]];
    [TestRatingSubView addSubview:HS3];
    
    
    // END OF TEST LABEL
    
    
    //
    
    //START OF SERVICE LABEL
    
    int CradSERVICE=4;
    UIView *ServiceRatingSubView=[[UIView alloc]initWithFrame:CGRectMake(0,TestRatingSubView.frame.size.height+TestRatingSubView.frame.origin.y, MainContainerView.frame.size.width,35)];
    
    [ServiceRatingSubView setBackgroundColor:RGBCOLOR(255, 255, 255, 1)];
    [MainContainerView addSubview:ServiceRatingSubView];
    
    UILabel *ServiceTitleLbl=[[UILabel alloc] initWithFrame:CGRectMake(20, 4, 50, 23)];
    [ServiceTitleLbl setText:@"Service"];
    [ServiceTitleLbl setTextColor:RGBCOLOR(100, 100, 100, 1)];
    [ServiceTitleLbl setFont:HALVELTICA_LIGHT(14)];
    [ServiceRatingSubView addSubview:ServiceTitleLbl];
    
    
    // STARS START
    
    if ([[UIScreen mainScreen]bounds].size.width == 320) {
        ServiceStartContainerView=[[UIView alloc]initWithFrame:CGRectMake(170 ,5,103, 26)];
        
        ServiceStartContainerView.backgroundColor=[UIColor clearColor];
        
        [ServiceRatingSubView addSubview:ServiceStartContainerView];
    }
    else
    {
    ServiceStartContainerView=[[UIView alloc]initWithFrame:CGRectMake(210 ,5,103, 26)];
    
    ServiceStartContainerView.backgroundColor=[UIColor clearColor];
    
    [ServiceRatingSubView addSubview:ServiceStartContainerView];
}

    CGRect PreFrame4=CGRectMake(0, 2, 33/2, 30/2);
    
    
    
    for (int i=0; i<5; i++) {
        
        UIButton * StarBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        
        [StarBtn setFrame:PreFrame4];
        
        NSString *ImageName=nil;
        
        if (CradSERVICE>i) {
            
            ImageName=@"SmallStar";
            
        } else {
            ImageName=@"SmallFadeStar";
            
        }
        
        [StarBtn setBackgroundImage:[UIImage imageNamed:ImageName] forState:UIControlStateNormal];
        
        [StarBtn setBackgroundImage:[UIImage imageNamed:ImageName] forState:UIControlStateSelected];
        
        [StarBtn setBackgroundImage:[UIImage imageNamed:ImageName] forState:UIControlStateHighlighted];
        
        [ServiceStartContainerView addSubview:StarBtn];
        
        PreFrame4.origin.x=PreFrame4.origin.x+PreFrame4.size.width+5;
        
        
        
    }
    
    
    
    UIView *HS4=[[UIView alloc]initWithFrame:CGRectMake(0, 34, ServiceRatingSubView.frame.size.width, 1)];
    [HS4 setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"line2"]]];
    [ServiceRatingSubView addSubview:HS4];
    
    
    // END OF SERVICE LABEL
    
    //***
    
    
    //START OF presentation LABEL
    
    int CradPresentation=5;
    UIView *PresentationRatingSubView=[[UIView alloc]initWithFrame:CGRectMake(0,ServiceRatingSubView.frame.size.height+ServiceRatingSubView.frame.origin.y, MainContainerView.frame.size.width,35)];
    
    [PresentationRatingSubView setBackgroundColor:RGBCOLOR(255, 255, 255, 1)];
    [MainContainerView addSubview:PresentationRatingSubView];
    
    UILabel *PresentationTitleLbl=[[UILabel alloc] initWithFrame:CGRectMake(20, 4, 100, 23)];
    [PresentationTitleLbl setText:@"Presentation"];
    [PresentationTitleLbl setTextColor:RGBCOLOR(100, 100, 100, 1)];
    [PresentationTitleLbl setFont:HALVELTICA_LIGHT(14)];
    [PresentationRatingSubView addSubview:PresentationTitleLbl];
    
    
    // STARS START
    
     if ([[UIScreen mainScreen]bounds].size.width == 320) {
         PresentationStartContainerView=[[UIView alloc]initWithFrame:CGRectMake(170 ,5,103, 26)];
         
         PresentationStartContainerView.backgroundColor=[UIColor clearColor];
         
         [PresentationRatingSubView addSubview:PresentationStartContainerView];
     }
     else{
    
    PresentationStartContainerView=[[UIView alloc]initWithFrame:CGRectMake(210 ,5,103, 26)];
    
    PresentationStartContainerView.backgroundColor=[UIColor clearColor];
    
    [PresentationRatingSubView addSubview:PresentationStartContainerView];
     }
    CGRect PreFrame5=CGRectMake(0, 2, 33/2, 30/2);
    
    
    
    for (int i=0; i<5; i++) {
        
        UIButton * StarBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        
        [StarBtn setFrame:PreFrame5];
        
        NSString *ImageName=nil;
        
        if (CradPresentation>i) {
            
            ImageName=@"SmallStar";
            
        } else {
            ImageName=@"SmallFadeStar";
            
        }
        
        [StarBtn setBackgroundImage:[UIImage imageNamed:ImageName] forState:UIControlStateNormal];
        
        [StarBtn setBackgroundImage:[UIImage imageNamed:ImageName] forState:UIControlStateSelected];
        
        [StarBtn setBackgroundImage:[UIImage imageNamed:ImageName] forState:UIControlStateHighlighted];
        
        [PresentationStartContainerView addSubview:StarBtn];
        
        PreFrame5.origin.x=PreFrame5.origin.x+PreFrame5.size.width+5;
        
        
        
    }
    
    
    
    UIView *HS5=[[UIView alloc]initWithFrame:CGRectMake(0, 34, ServiceRatingSubView.frame.size.width, 1)];
    [HS5 setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"line2"]]];
    [PresentationRatingSubView addSubview:HS5];
    
    
    // END OF PEresentation LABEL
    
    
    
    //Start of atmosphere
    
    
    int CradAtmosphere=5;
    UIView *AtmosphereRatingSubView=[[UIView alloc]initWithFrame:CGRectMake(0,PresentationRatingSubView.frame.size.height+PresentationRatingSubView.frame.origin.y, MainContainerView.frame.size.width,35)];
    
    [AtmosphereRatingSubView setBackgroundColor:RGBCOLOR(255, 255, 255, 1)];
    [MainContainerView addSubview:AtmosphereRatingSubView];
    
    UILabel *AtmosphereTitleLbl=[[UILabel alloc] initWithFrame:CGRectMake(20, 4, 100, 23)];
    [AtmosphereTitleLbl setText:@"Atmosphere"];
    [AtmosphereTitleLbl setTextColor:RGBCOLOR(100, 100, 100, 1)];
    [AtmosphereTitleLbl setFont:HALVELTICA_LIGHT(14)];
    [AtmosphereRatingSubView addSubview:AtmosphereTitleLbl];
    
    
    // STARS START
    
     if ([[UIScreen mainScreen]bounds].size.width == 320)
     {
         AtmosphereStartContainerView=[[UIView alloc]initWithFrame:CGRectMake(170 ,5,103, 26)];
         
         AtmosphereStartContainerView.backgroundColor=[UIColor clearColor];
         
         [AtmosphereRatingSubView addSubview:AtmosphereStartContainerView];

     }
    else
    {
       AtmosphereStartContainerView=[[UIView alloc]initWithFrame:CGRectMake(210 ,5,103, 26)];
        
        AtmosphereStartContainerView.backgroundColor=[UIColor clearColor];
        
        [AtmosphereRatingSubView addSubview:AtmosphereStartContainerView];
   
    }
    
    CGRect PreFrame6=CGRectMake(0, 2, 33/2, 30/2);
    
    
    
    for (int i=0; i<5; i++) {
        
        UIButton * StarBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        
        [StarBtn setFrame:PreFrame6];
        
        NSString *ImageName=nil;
        
        if (CradAtmosphere>i) {
            
            ImageName=@"SmallStar";
            
        } else {
            ImageName=@"SmallFadeStar";
            
        }
        
        [StarBtn setBackgroundImage:[UIImage imageNamed:ImageName] forState:UIControlStateNormal];
        
        [StarBtn setBackgroundImage:[UIImage imageNamed:ImageName] forState:UIControlStateSelected];
        
        [StarBtn setBackgroundImage:[UIImage imageNamed:ImageName] forState:UIControlStateHighlighted];
        
        [AtmosphereStartContainerView addSubview:StarBtn];
        
        PreFrame6.origin.x=PreFrame6.origin.x+PreFrame6.size.width+5;
        
        
        
    }
    // end of atmosphere

    
    UIView *Hs13=[[UIView alloc]initWithFrame:CGRectMake(0, AtmosphereRatingSubView.frame.origin.y+AtmosphereRatingSubView.frame.size.height+10, MainContainerView.frame.size.width, 1)];
    [Hs13 setBackgroundColor:RGBCOLOR(230, 230, 230, 1)];
    [MainContainerView addSubview:Hs13];
    


    UILabel *Menu=[[UILabel alloc] initWithFrame:CGRectMake(20, Hs13.frame.origin.y+1,150, 23)];
    [Menu setText:@"Recomende Menu"];
    [Menu setTextColor:RGBCOLOR(100, 100, 100, 1)];
    [Menu setFont:HALVELTICA_LIGHT(14)];
    [MainContainerView addSubview:Menu];
    
    
    
    
    UIView *MidView=[[UIView alloc]initWithFrame:CGRectMake(20, Menu.frame.origin.y+Menu.frame.size.height+10, MainContainerView.frame.size.width-40, 70)];
    [MainContainerView addSubview:MidView];
    [MidView setBackgroundColor:RGBCOLOR(245, 245, 245, 1)];
    MidView.layer.cornerRadius=4.0;
    
    if ([[UIScreen mainScreen]bounds].size.width == 320) {
        
        UIImageView *LView=[[UIImageView alloc]initWithFrame:CGRectMake(6, 22, 213/2, 50/2)];
        [LView setImage:[UIImage imageNamed:@"Chicken"]];
        [MidView addSubview:LView];
        
        UILabel *CMenu=[[UILabel alloc] initWithFrame:CGRectMake(0, 1,LView.frame.size.width, 23)];
        [CMenu setText:@"Chicken"];
        [CMenu setTextAlignment:NSTextAlignmentCenter];
        [CMenu setTextColor:RGBCOLOR(100, 100, 100, 1)];
        [CMenu setFont:HALVELTICA_LIGHT(14)];
        [LView addSubview:CMenu];
        
        
        UILabel *CMenu2=[[UILabel alloc] initWithFrame:CGRectMake(0, 1,LView.frame.size.width, 23)];
        [CMenu2 setText:@"Chicken"];
        [CMenu2 setTextAlignment:NSTextAlignmentCenter];
        [CMenu2 setTextColor:RGBCOLOR(100, 100, 100, 1)];
        [CMenu2 setFont:HALVELTICA_LIGHT(14)];
        [LView addSubview:CMenu2];
        
        
        
        UIImageView *RView=[[UIImageView alloc]initWithFrame:CGRectMake(LView.frame.size.width+LView.frame.origin.x+12, 22, 213/2, 50/2)];
        [RView setImage:[UIImage imageNamed:@"Chicken"]];
        [MidView addSubview:RView];
        
        [RView addSubview:CMenu2];

    }
    else
    {
        UIImageView *LView=[[UIImageView alloc]initWithFrame:CGRectMake(26, 22, 213/2, 50/2)];
        [LView setImage:[UIImage imageNamed:@"Chicken"]];
        [MidView addSubview:LView];
        
        UILabel *CMenu=[[UILabel alloc] initWithFrame:CGRectMake(0, 1,LView.frame.size.width, 23)];
        [CMenu setText:@"Chicken"];
        [CMenu setTextAlignment:NSTextAlignmentCenter];
        [CMenu setTextColor:RGBCOLOR(100, 100, 100, 1)];
        [CMenu setFont:HALVELTICA_LIGHT(14)];
        [LView addSubview:CMenu];
        
        
        UILabel *CMenu2=[[UILabel alloc] initWithFrame:CGRectMake(0, 1,LView.frame.size.width, 23)];
        [CMenu2 setText:@"Chicken"];
        [CMenu2 setTextAlignment:NSTextAlignmentCenter];
        [CMenu2 setTextColor:RGBCOLOR(100, 100, 100, 1)];
        [CMenu2 setFont:HALVELTICA_LIGHT(14)];
        [LView addSubview:CMenu2];
        
        
        
        UIImageView *RView=[[UIImageView alloc]initWithFrame:CGRectMake(LView.frame.size.width+LView.frame.origin.x+30, 22, 213/2, 50/2)];
        [RView setImage:[UIImage imageNamed:@"Chicken"]];
        [MidView addSubview:RView];
        
        [RView addSubview:CMenu2];

    }
    
    
    
    
    
    UIView *Hs14=[[UIView alloc]initWithFrame:CGRectMake(0, MidView.frame.origin.y+MidView.frame.size.height+10, MainContainerView.frame.size.width, 1)];
    [Hs14 setBackgroundColor:RGBCOLOR(230, 230, 230, 1)];
    [MainContainerView addSubview:Hs14];
    
    //review textview.........
    
    
    Review=[[UILabel alloc] initWithFrame:CGRectMake(20, Hs14.frame.origin.y+10,150, 23)];
    [Review setText:@"Review"];
    [Review setTextColor:RGBCOLOR(100, 100, 100, 1)];
    [Review setFont:HALVELTICA_LIGHT(14)];
    [MainContainerView addSubview:Review];
    
    
    
    ReviewTextview = [[UITextView alloc]initWithFrame:CGRectMake(20, Review.frame.origin.y+30, MainContainerView.frame.size.width-40, 110)];
    ReviewTextview.font = [UIFont systemFontOfSize:16.0f];
    ReviewTextview.backgroundColor = [UIColor clearColor];
    ReviewTextview.textColor = [UIColor blackColor];
    ReviewTextview.scrollEnabled = YES;
    ReviewTextview.editable = YES;
    ReviewTextview.layer.cornerRadius = 3.0f;
    ReviewTextview.layer.borderWidth = 1.5f;
    ReviewTextview.layer.borderColor =[RGBCOLOR(230, 230, 230, 1)CGColor];
    ReviewTextview.delegate = self;
    ReviewTextview.textAlignment = NSTextAlignmentLeft;
    [MainContainerView addSubview:ReviewTextview];
    
    
    
    UIView *Hs16=[[UIView alloc]initWithFrame:CGRectMake(0, ReviewTextview.frame.origin.y+ReviewTextview.frame.size.height+10, MainContainerView.frame.size.width, 1)];
    [Hs16 setBackgroundColor:RGBCOLOR(230, 230, 230, 1)];
    [MainContainerView addSubview:Hs16];
    
    //////  tag>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    
    
    UIView *CardTagContainerView=[[UIView alloc]initWithFrame:CGRectMake(0, Hs16.frame.origin.y+Hs16.frame.size.height+20, MainContainerView.frame.size.width, 90)];
    [MainContainerView addSubview:CardTagContainerView];
    
    
    UIImageView *SmallCardTag=[[UIImageView alloc]initWithFrame:CGRectMake(15, 7, 124/2, 50/2)];
    [SmallCardTag setImage:[UIImage imageNamed:@"SmallTag"]];
    
    
    [CardTagContainerView addSubview:SmallCardTag];
    UILabel *TLbl=[[UILabel alloc]initWithFrame:CGRectMake(2, 1, 50, 20)];
    
    [TLbl setTextColor:RGBCOLOR(100, 100, 100, 1)];
    [TLbl setText:@"#food"];
     [TLbl setTextAlignment:NSTextAlignmentCenter];
    [TLbl setFont:HALVELTICA_LIGHT(13)];
    [SmallCardTag addSubview:TLbl];
    
    UIImageView *BigCardTag=[[UIImageView alloc]initWithFrame:CGRectMake(SmallCardTag.frame.origin.x+SmallCardTag.frame.size.width+10, 7, 177/2, 50/2)];
    [BigCardTag setImage:[UIImage imageNamed:@"BigTag"]];
    
    
    [CardTagContainerView addSubview:BigCardTag];
    UILabel *TLbl1=[[UILabel alloc]initWithFrame:CGRectMake(2, 1, 90, 20)];
    [TLbl1 setTextColor:RGBCOLOR(90, 90, 90, 1)];
    [TLbl1 setText:@"#restaurant"];
     [TLbl1 setTextAlignment:NSTextAlignmentCenter];
    [TLbl1 setFont:HALVELTICA_LIGHT(13)];
    [BigCardTag addSubview:TLbl1];
    
    
    UIImageView *SmallCardTag1=[[UIImageView alloc]initWithFrame:CGRectMake(BigCardTag.frame.origin.x+BigCardTag.frame.size.width+10, 7, 124/2, 50/2)];
    [SmallCardTag1 setImage:[UIImage imageNamed:@"SmallTag"]];
    
    
    [CardTagContainerView addSubview:SmallCardTag1];
    UILabel *TLbl2=[[UILabel alloc]initWithFrame:CGRectMake(2, 1, 50, 20)];
    [TLbl2 setTextColor:RGBCOLOR(90, 90, 90, 1)];
    [TLbl2 setText:@"#hot"];
     [TLbl2 setTextAlignment:NSTextAlignmentCenter];
    [TLbl2 setFont:HALVELTICA_LIGHT(13)];
    [SmallCardTag1 addSubview:TLbl2];
    
    
    UIImageView *MidCardTag=[[UIImageView alloc]initWithFrame:CGRectMake(SmallCardTag.frame.origin.x, SmallCardTag.frame.origin.y+SmallCardTag.frame.size.height+7, 139/2, 50/2)];
    [MidCardTag setImage:[UIImage imageNamed:@"MidTag"]];
    
    
    [CardTagContainerView addSubview:MidCardTag];
    UILabel *TLbl3=[[UILabel alloc]initWithFrame:CGRectMake(2, 1, 70, 20)];
    [TLbl3 setTextColor:RGBCOLOR(90, 90, 90, 1)];
    [TLbl3 setText:@"#chicken"];
     [TLbl3 setTextAlignment:NSTextAlignmentCenter];
    [TLbl3 setFont:HALVELTICA_LIGHT(13)];
    [MidCardTag addSubview:TLbl3];
    
    
    UIImageView *MidCardTag1=[[UIImageView alloc]initWithFrame:CGRectMake(MidCardTag.frame.origin.x+MidCardTag.frame.size.width+10, SmallCardTag.frame.origin.y+SmallCardTag.frame.size.height+7, 139/2, 50/2)];
    [MidCardTag1 setImage:[UIImage imageNamed:@"MidTag"]];
    
    
    [CardTagContainerView addSubview:MidCardTag1];
    UILabel *TLbl4=[[UILabel alloc]initWithFrame:CGRectMake(2, 1, 70, 20)];
    [TLbl4 setTextColor:RGBCOLOR(90, 90, 90, 1)];
    [TLbl4 setText:@"#hangout"];
    [TLbl4 setTextAlignment:NSTextAlignmentCenter];
    [TLbl4 setFont:HALVELTICA_LIGHT(13)];
    [MidCardTag1 addSubview:TLbl4];

    
    
    UIView *Hs15=[[UIView alloc]initWithFrame:CGRectMake(0, CardTagContainerView.frame.origin.y+CardTagContainerView.frame.size.height, MainContainerView.frame.size.width, 1)];
    [Hs15 setBackgroundColor:RGBCOLOR(230, 230, 230, 1)];
    [MainContainerView addSubview:Hs15];
    
    if ([[UIScreen mainScreen]bounds].size.width == 320) {
        
        UILabel *Share=[[UILabel alloc]initWithFrame:CGRectMake(18, Hs15.frame.origin.y+10, 90, 20)];
        
        [Share setTextColor:RGBCOLOR(190, 190, 160, 1)];
        [Share setText:@"SHARE TO:"];
        Share.backgroundColor = [UIColor clearColor];
        [Share setTextAlignment:NSTextAlignmentCenter];
        [Share setFont:HALVELTICA(14)];
        [MainContainerView addSubview:Share];
        
        UIImageView *twm=[[UIImageView alloc]initWithFrame:CGRectMake(Share.frame.origin.x+Share.frame.size.width+2,Share.frame.origin.y-2,20,20)];
        twm.image=[UIImage imageNamed:@"Twitter"];
        twm.userInteractionEnabled=YES;
        [MainContainerView addSubview:twm];
        
        
        UILabel *Share1=[[UILabel alloc]initWithFrame:CGRectMake(twm.frame.origin.x+twm.frame.size.width+8, Hs15.frame.origin.y+10, 50, 20)];
        
        [Share1 setTextColor:RGBCOLOR(190, 190, 190, 1)];
        [Share1 setText:@"Twitter"];
        [Share1 setBackgroundColor:[UIColor clearColor]];
        [Share1 setTextAlignment:NSTextAlignmentLeft];
        [Share1 setFont:HALVELTICA(14)];
        [MainContainerView addSubview:Share1];
        
        UIImageView *twm1=[[UIImageView alloc]initWithFrame:CGRectMake(Share1.frame.origin.x+Share1.frame.size.width+2,Share1.frame.origin.y-2,20,20)];
        twm1.image=[UIImage imageNamed:@"Facebook"];
        twm1.userInteractionEnabled=YES;
        [MainContainerView addSubview:twm1];
        
        
        UILabel *Share2=[[UILabel alloc]initWithFrame:CGRectMake(twm1.frame.origin.x+twm1.frame.size.width+4, Hs15.frame.origin.y+10, 80, 20)];
        
        [Share2 setTextColor:RGBCOLOR(190, 190, 190, 1)];
        [Share2 setText:@"Facebook"];
        [Share2 setTextAlignment:NSTextAlignmentLeft];
        [Share2 setFont:HALVELTICA(14)];
        [MainContainerView addSubview:Share2];
    }
    else
    {
    UILabel *Share=[[UILabel alloc]initWithFrame:CGRectMake(18, Hs15.frame.origin.y+10, 90, 20)];
    
    [Share setTextColor:RGBCOLOR(190, 190, 190, 1)];
    [Share setText:@"SHARE TO:"];
    [Share setTextAlignment:NSTextAlignmentCenter];
    [Share setFont:HALVELTICA(16)];
    [MainContainerView addSubview:Share];
    
    UIImageView *twm=[[UIImageView alloc]initWithFrame:CGRectMake(Share.frame.origin.x+Share.frame.size.width+2,Share.frame.origin.y-2,24,24)];
    twm.image=[UIImage imageNamed:@"Twitter"];
    twm.userInteractionEnabled=YES;
    [MainContainerView addSubview:twm];
    
    
    UILabel *Share1=[[UILabel alloc]initWithFrame:CGRectMake(twm.frame.origin.x+twm.frame.size.width+4, Hs15.frame.origin.y+10, 70, 20)];
    
    [Share1 setTextColor:RGBCOLOR(190, 190, 190, 1)];
    [Share1 setText:@"Twitter"];
    [Share1 setBackgroundColor:[UIColor clearColor]];
    [Share1 setTextAlignment:NSTextAlignmentCenter];
    [Share1 setFont:HALVELTICA(16)];
    [MainContainerView addSubview:Share1];
    
    UIImageView *twm1=[[UIImageView alloc]initWithFrame:CGRectMake(Share1.frame.origin.x+Share1.frame.size.width+2,Share1.frame.origin.y-2,24,24)];
    twm1.image=[UIImage imageNamed:@"Facebook"];
    twm1.userInteractionEnabled=YES;
    [MainContainerView addSubview:twm1];

    
    UILabel *Share2=[[UILabel alloc]initWithFrame:CGRectMake(twm1.frame.origin.x+twm1.frame.size.width+4, Hs15.frame.origin.y+10, 90, 20)];
    
    [Share2 setTextColor:RGBCOLOR(190, 190, 190, 1)];
    [Share2 setText:@"Facebook"];
    [Share2 setTextAlignment:NSTextAlignmentLeft];
    [Share2 setFont:HALVELTICA(16)];
    [MainContainerView addSubview:Share2];
    }
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)Backbutton:(UIButton *)sender{
    
    ViewController *list = [[ViewController alloc]init];
    [self.navigationController pushViewController:list animated:YES];
}
- (BOOL) textViewShouldBeginEditing:(UITextView *)textView
{
    ReviewTextview.textColor = [UIColor blackColor];
    return YES;
}
-(BOOL)textViewShouldEndEditing:(UITextView *)textView{
    
    if ([ReviewTextview.text isEqualToString:@""]) {

    }
    else{
        
    }
    return YES;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    
    
    if([text isEqualToString:@"\n"]) {
        
        [ReviewTextview resignFirstResponder];
        
        
        return NO;
    }
    
    return YES;
    
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
