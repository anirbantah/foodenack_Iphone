//
//  FNNewRestaurantViewController.m
//  Foodenak
//
//  Created by Surajit Dhara on 23/01/15.
//  Copyright (c) 2015 Esolz Tech. All rights reserved.
//

#import "FNNewRestaurantViewController.h"
#define RGBCOLOR(x,y,z,f) [UIColor colorWithRed:(x/255.0f) green:(y/255.0f) blue:(z/255.0f) alpha:f]

#define  MainScreenHeight [[UIScreen mainScreen]bounds].size.height

#define  MainScreenWidth  [[UIScreen mainScreen]bounds].size.width

#define HALVELTICA(x)  [UIFont fontWithName:@"Helvetica Bold" size:x]

#define HALVELTICA_LIGHT(x)  [UIFont fontWithName:@"Helvetica Light" size:x]
@interface FNNewRestaurantViewController ()<UIScrollViewDelegate>

@end

@implementation FNNewRestaurantViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    float LeftPadding=32.0f;
    
    NSLog(@"here in the new restaurant  >>>>>>>>>>>>> ");
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
    // [BackButton addTarget:self action:@selector(Backbutton:) forControlEvents:UIControlEventTouchUpInside];
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
    
    
    MainScroll.contentSize = CGSizeMake(0, 3300);
    
    
    
    
        UIView *MainContainerView=[[UIView alloc]initWithFrame:CGRectMake(30, 20, MainScroll.frame.size.width-60, MainScroll.frame.size.height+628)];
        [MainScroll addSubview:MainContainerView];
        MainContainerView.layer.cornerRadius=4.0;
        [MainContainerView setBackgroundColor:[UIColor whiteColor]];
    
        UIImageView *Top=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, MainContainerView.frame.size.width, 43/2)];
        [Top setImage:[UIImage imageNamed:@"Top"]];
        [MainContainerView addSubview:Top];
    
    UIView *NAView=[[UIView alloc]initWithFrame:CGRectMake(0, 10, MainContainerView.frame.size.width, 120)];
    [NAView setBackgroundColor:[UIColor clearColor]];
    [MainContainerView addSubview:NAView];
    CGRect PreFrame=CGRectMake(0, 0, NAView.frame.size.width, 60);
    NSArray *TArray=[[NSArray alloc]initWithObjects:@"Name",@"Address", nil];
    
    
    for (int i=0; i<2; i++) {
        UIView *Subview=[[UIView alloc]initWithFrame:PreFrame];
        [Subview setBackgroundColor:[UIColor clearColor]];
        [NAView addSubview:Subview];
        
        UILabel *Lbl=[[UILabel alloc]initWithFrame:CGRectMake(32, 10, 100, 20)];
        [Lbl setText:[TArray objectAtIndex:i]];
        [Lbl setTextAlignment:NSTextAlignmentLeft];
        [Lbl setTextColor:RGBCOLOR(71, 71, 71, 1)];
        [Lbl setFont:HALVELTICA(16)];
        [Subview addSubview:Lbl];
        
        UIImageView *ImgView=[[UIImageView alloc]initWithFrame:CGRectMake(Lbl.frame.origin.x, Lbl.frame.origin.y+Lbl.frame.size.height+3, 497/2, 25)];
        [ImgView setImage:[UIImage imageNamed:@"InputCross"]];
        [Subview addSubview:ImgView];
        
        
        UILabel *Lbl1=[[UILabel alloc]initWithFrame:CGRectMake(5, 2.5, 100, 20)];
        [Lbl1 setText:@"abcd"];
        [Lbl1 setTextAlignment:NSTextAlignmentLeft];
        
        [Lbl1 setTextColor:RGBCOLOR(101, 101, 101, 1)];
        [Lbl1 setFont:HALVELTICA_LIGHT(14)];
        [ImgView addSubview:Lbl1];
        
        PreFrame=Subview.frame;
        PreFrame.origin.y+=PreFrame.size.height;
        
    }
    
    
    UIButton *SeeMoreBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [SeeMoreBtn setFrame:CGRectMake(MainContainerView.frame.size.width/2-497/4, NAView.frame.size.height+NAView.frame.origin.y+20, 497/2, 64/2)];
    [SeeMoreBtn setBackgroundImage:[UIImage imageNamed:@"InsideBtn"] forState:UIControlStateNormal];
    [SeeMoreBtn setBackgroundImage:[UIImage imageNamed:@"InsideBtn"] forState:UIControlStateSelected];
    [SeeMoreBtn setBackgroundImage:[UIImage imageNamed:@"InsideBtn"] forState:UIControlStateHighlighted];
    [MainContainerView addSubview:SeeMoreBtn];
    
    
    UIView *Hs1=[[UIView alloc]initWithFrame:CGRectMake(0, SeeMoreBtn.frame.origin.y+SeeMoreBtn.frame.size.height+20, MainContainerView.frame.size.width, 1)];
    [Hs1 setBackgroundColor:RGBCOLOR(230, 230, 230, 1)];
    [MainContainerView addSubview:Hs1];
    
    
    UILabel *LocLbl=[[UILabel alloc]initWithFrame:CGRectMake(32, Hs1.frame.origin.y+12, 100, 20)];
    [LocLbl setText:@"Location"];
    [LocLbl setTextAlignment:NSTextAlignmentLeft];
    [LocLbl setTextColor:RGBCOLOR(71, 71, 71, 1)];
    [LocLbl setFont:HALVELTICA(16)];
    [MainContainerView addSubview:LocLbl];

    
    
    UIView *LocationView=[[UIView alloc]initWithFrame:CGRectMake(0, LocLbl.frame.origin.y+LocLbl.frame.size.height+2, MainContainerView.frame.size.width, 120)];
    [LocationView setBackgroundColor:[UIColor clearColor]];
    [MainContainerView addSubview:LocationView];
    CGRect PreFrame1=CGRectMake(0, 0, NAView.frame.size.width, 40);
    
    
    for (int i=0; i<3; i++) {
        UIView *Subview=[[UIView alloc]initWithFrame:PreFrame1];
        [Subview setBackgroundColor:[UIColor clearColor]];
        [LocationView addSubview:Subview];
        
       
        
        UIImageView *ImgView=[[UIImageView alloc]initWithFrame:CGRectMake(LeftPadding,10, 497/2, 25)];
        [ImgView setImage:[UIImage imageNamed:@"InputCross"]];
        [Subview addSubview:ImgView];
        
        
        UILabel *Lbl1=[[UILabel alloc]initWithFrame:CGRectMake(5, 2.5, 100, 20)];
        [Lbl1 setText:@"abcdef"];
        [Lbl1 setTextAlignment:NSTextAlignmentLeft];
        
        [Lbl1 setTextColor:RGBCOLOR(101, 101, 101, 1)];
        [Lbl1 setFont:HALVELTICA_LIGHT(14)];
        [ImgView addSubview:Lbl1];
        
        PreFrame1=Subview.frame;
        PreFrame1.origin.y+=PreFrame1.size.height;
        
    }
    
    UIView *Hs2=[[UIView alloc]initWithFrame:CGRectMake(0, LocationView.frame.origin.y+LocationView.frame.size.height+20, MainContainerView.frame.size.width, 1)];
    [Hs2 setBackgroundColor:RGBCOLOR(230, 230, 230, 1)];
    [MainContainerView addSubview:Hs2];
    
    
    
    //// phone
    
    
    
    UILabel *PhoneLbl=[[UILabel alloc]initWithFrame:CGRectMake(32, Hs2.frame.origin.y+12, 100, 20)];
    [PhoneLbl setText:@"Phone"];
    [PhoneLbl setTextAlignment:NSTextAlignmentLeft];
    [PhoneLbl setTextColor:RGBCOLOR(71, 71, 71, 1)];
    [PhoneLbl setFont:HALVELTICA(16)];
    [MainContainerView addSubview:PhoneLbl];
    
    
    
    UIView *PhoneView=[[UIView alloc]initWithFrame:CGRectMake(0, PhoneLbl.frame.origin.y+PhoneLbl.frame.size.height+2, MainContainerView.frame.size.width, 80)];
    [PhoneView setBackgroundColor:[UIColor clearColor]];
    [MainContainerView addSubview:PhoneView];
    CGRect PreFrame2=CGRectMake(0, 0, PhoneView.frame.size.width, 40);
    
    
    for (int i=0; i<2; i++) {
        UIView *Subview=[[UIView alloc]initWithFrame:PreFrame2];
        [Subview setBackgroundColor:[UIColor clearColor]];
        [PhoneView addSubview:Subview];
        
        
        
        UIImageView *ImgView=[[UIImageView alloc]initWithFrame:CGRectMake(LeftPadding,10, 497/2, 25)];
        [ImgView setImage:[UIImage imageNamed:@"InputCross"]];
        [Subview addSubview:ImgView];
        
        
        UILabel *Lbl1=[[UILabel alloc]initWithFrame:CGRectMake(5, 2.5, 100, 20)];
        [Lbl1 setText:@"abcdef"];
        [Lbl1 setTextAlignment:NSTextAlignmentLeft];
        
        [Lbl1 setTextColor:RGBCOLOR(101, 101, 101, 1)];
        [Lbl1 setFont:HALVELTICA_LIGHT(14)];
        [ImgView addSubview:Lbl1];
        
        PreFrame2=Subview.frame;
        PreFrame2.origin.y+=PreFrame2.size.height;
        
    }

    UIView *Hs3=[[UIView alloc]initWithFrame:CGRectMake(0, PhoneView.frame.origin.y+PhoneView.frame.size.height+20, MainContainerView.frame.size.width, 1)];
    [Hs3 setBackgroundColor:RGBCOLOR(230, 230, 230, 1)];
    [MainContainerView addSubview:Hs3];
    
    UIView *DivView=[[UIView alloc]initWithFrame:CGRectMake(0, Hs3.frame.origin.y+1, MainContainerView.frame.size.width, 66)];
    [DivView setBackgroundColor:[UIColor clearColor]];
    [MainContainerView addSubview:DivView];
    
    NSArray *CostArr=[[NSArray alloc]initWithObjects:@"50-100",@"100-150",@"150-200",@"200", nil];
    CGRect Prrr=CGRectMake(0, 0, MainContainerView.frame.size.width/4, 66);
    for (int i=0; i<4; i++) {
        UIView  *SubView=[[UIView alloc]initWithFrame:Prrr];
        [DivView addSubview:SubView];
        [SubView setBackgroundColor:[UIColor clearColor]];
        
        UIImageView *ImgV=[[UIImageView alloc]initWithFrame:CGRectMake(Prrr.size.width/2-21/2, 20, 21, 21)];
        [ImgV setImage:[UIImage imageNamed:@"Chk-Box"]];
        [SubView addSubview:ImgV];
        
        UILabel *Lbl1=[[UILabel alloc]initWithFrame:CGRectMake(0, 66-20, Prrr.size.width, 20)];
        [Lbl1 setText:[CostArr objectAtIndex:i]];
        [Lbl1 setTextAlignment:NSTextAlignmentCenter];
        
        [Lbl1 setTextColor:RGBCOLOR(201, 201, 201, 1)];
        [Lbl1 setFont:HALVELTICA_LIGHT(14)];
        [SubView addSubview:Lbl1];
        if (i!=3) {
            UIView *Div=[[UIView alloc]initWithFrame:CGRectMake(Prrr.size.width-1, 0, 1,Prrr.size.height)];
            [Div setBackgroundColor:RGBCOLOR(201, 201, 201, 1)];
            [SubView addSubview:Div];
        }
        
        Prrr=SubView.frame;
        Prrr.origin.x+=Prrr.size.width;
    }
    
    UIImageView *ShadeImgv=[[UIImageView alloc]initWithFrame:CGRectMake(0, DivView.frame.size.height+DivView.frame.origin.y, DivView.frame.size.width, 89/2)];
    [ShadeImgv setImage:[UIImage imageNamed:@"ShadeImg"]];
    [MainContainerView addSubview:ShadeImgv];
    

    
    UILabel *Lbl=[[UILabel alloc]initWithFrame:CGRectMake(32, ShadeImgv.frame.origin.y+ShadeImgv.frame.size.height, 100, 20)];
    [Lbl setText:@"Hours"];
    [Lbl setTextAlignment:NSTextAlignmentLeft];
    [Lbl setTextColor:RGBCOLOR(71, 71, 71, 1)];
    [Lbl setFont:HALVELTICA(16)];
    [MainContainerView addSubview:Lbl];
    
    
    UIView *DayView=[[UIView alloc]initWithFrame:CGRectMake(0, Lbl.frame.origin.y+Lbl.frame.size.height, MainContainerView.frame.size.width, 35*8)];
    [MainContainerView addSubview:DayView];
    [DayView setBackgroundColor:[UIColor clearColor]];
    
    NSArray *Arr=[[NSArray alloc]initWithObjects:@"Monday",@"1.00AM",@"1.00PM", nil];
    
     CGRect PFrame=CGRectMake(0, 0, MainContainerView.frame.size.width,35);
    for (int i=0; i<8; i++) {
        UIView  *SubView=[[UIView alloc]initWithFrame:PFrame];
        [DayView addSubview:SubView];
        [SubView setBackgroundColor:[UIColor clearColor]];
        
        UIImageView *ShadeImgv1=[[UIImageView alloc]initWithFrame:CGRectMake(30,10,143/2, 48/2)];
        [ShadeImgv1 setImage:[UIImage imageNamed:@"Hours"]];
        [SubView addSubview:ShadeImgv1];
        
        
        UILabel *Lbl1=[[UILabel alloc]initWithFrame:CGRectMake(0, 2, ShadeImgv1.frame.size.width-4, 20)];
        [Lbl1 setText:[Arr objectAtIndex:0]];
        [Lbl1 setTextAlignment:NSTextAlignmentCenter];
        
        [Lbl1 setTextColor:RGBCOLOR(201, 201, 201, 1)];
        [Lbl1 setFont:HALVELTICA_LIGHT(12)];
        [ShadeImgv1 addSubview:Lbl1];
        
        
        
        
        UIImageView *ShadeImgv2=[[UIImageView alloc]initWithFrame:CGRectMake(ShadeImgv1.frame.size.width+ShadeImgv1.frame.origin.x+8,10,143/2, 48/2)];
        [ShadeImgv2 setImage:[UIImage imageNamed:@"Hours"]];
        [SubView addSubview:ShadeImgv2];
        
        
        UILabel *Lbl2=[[UILabel alloc]initWithFrame:CGRectMake(0, 2, ShadeImgv1.frame.size.width-4, 20)];
        [Lbl2 setText:[Arr objectAtIndex:1]];
        [Lbl2 setTextAlignment:NSTextAlignmentCenter];
        
        [Lbl2 setTextColor:RGBCOLOR(201, 201, 201, 1)];
        [Lbl2 setFont:HALVELTICA_LIGHT(12)];
        [ShadeImgv2 addSubview:Lbl2];
        
        
        UIImageView *ShadeImgv3=[[UIImageView alloc]initWithFrame:CGRectMake(ShadeImgv2.frame.size.width+ShadeImgv2.frame.origin.x+8,10,143/2, 48/2)];
        [ShadeImgv3 setImage:[UIImage imageNamed:@"Hours"]];
        [SubView addSubview:ShadeImgv3];
        
        
        UILabel *Lbl3=[[UILabel alloc]initWithFrame:CGRectMake(0, 2, ShadeImgv1.frame.size.width-4, 20)];
        [Lbl3 setText:[Arr objectAtIndex:2]];
        [Lbl3 setTextAlignment:NSTextAlignmentCenter];
        
        [Lbl3 setTextColor:RGBCOLOR(201, 201, 201, 1)];
        [Lbl3 setFont:HALVELTICA_LIGHT(12)];
        [ShadeImgv3 addSubview:Lbl3];
        
        if (i==0) {
            UIImageView *Imgv3=[[UIImageView alloc]initWithFrame:CGRectMake(ShadeImgv3.frame.size.width+ShadeImgv3.frame.origin.x+8,10,45/2, 48/2)];
            [Imgv3 setImage:[UIImage imageNamed:@"Button-01"]];
            [SubView addSubview:Imgv3];
        }
        else
        {
            UIImageView *Imgv3=[[UIImageView alloc]initWithFrame:CGRectMake(ShadeImgv3.frame.size.width+ShadeImgv3.frame.origin.x+8,10,45/2, 48/2)];
            [Imgv3 setImage:[UIImage imageNamed:@"Button-02"]];
            [SubView addSubview:Imgv3];
        }
       
        
        
        
        
        
        
        
        PFrame=SubView.frame;
        PFrame.origin.y+=PFrame.size.height;
    }
    
    UIButton *SeeMoreBtn1=[UIButton buttonWithType:UIButtonTypeCustom];
    [SeeMoreBtn1 setFrame:CGRectMake(MainContainerView.frame.size.width/2-497/4, DayView.frame.size.height+DayView.frame.origin.y+20, 497/2, 64/2)];
    [SeeMoreBtn1 setBackgroundImage:[UIImage imageNamed:@"Plus-Buton"] forState:UIControlStateNormal];
    [SeeMoreBtn1 setBackgroundImage:[UIImage imageNamed:@"Plus-Buton"] forState:UIControlStateSelected];
    [SeeMoreBtn1 setBackgroundImage:[UIImage imageNamed:@"Plus-Buton"] forState:UIControlStateHighlighted];
    [MainContainerView addSubview:SeeMoreBtn1];
    
    
    UIView *Hs44=[[UIView alloc]initWithFrame:CGRectMake(0,SeeMoreBtn1.frame.origin.y+SeeMoreBtn1.frame.size.height+13, MainContainerView.frame.size.width, 1)];
    [Hs44 setBackgroundColor:RGBCOLOR(230, 230, 230, 1)];
    [MainContainerView addSubview:Hs44];
    
    
    
    //////////////////////////////////////////////////////////////////
    
    
    UILabel *FacilitiesLbl=[[UILabel alloc]initWithFrame:CGRectMake(10, Hs44.frame.origin.y+Hs44.frame.size.height+10, 180, 20)];
    [FacilitiesLbl setBackgroundColor:[UIColor clearColor]];
    [FacilitiesLbl setFont:HALVELTICA(14)];
    [FacilitiesLbl setTextColor:RGBCOLOR(50, 50, 50, 1)];
    [FacilitiesLbl setTextAlignment:NSTextAlignmentLeft];
    [FacilitiesLbl setText:@"Facilities"];
    [MainContainerView addSubview:FacilitiesLbl];
    
    NSArray *ImgLeft=[[NSArray alloc]initWithObjects:@"L1",@"L2",@"L3",@"L4",@"L5", nil];
    NSArray *TitleLeft=[[NSArray alloc]initWithObjects:@"Smoking",@"Wifi",@"Debit",@"Credit",@"Halal", nil];
    
    NSArray *ImgRight=[[NSArray alloc]initWithObjects:@"R1",@"R2",@"R3",@"R4", nil];
    NSArray *TitleRight=[[NSArray alloc]initWithObjects:@"Delivary",@"Alcohol",@"Outdoor",@"Tv", nil];
    
    
    
    UIView *Hs14=[[UIView alloc]initWithFrame:CGRectMake(0,FacilitiesLbl.frame.origin.y+FacilitiesLbl.frame.size.height+6, MainContainerView.frame.size.width, 1)];
    [Hs14 setBackgroundColor:RGBCOLOR(230, 230, 230, 1)];
    [MainContainerView addSubview:Hs14];
    
    CGRect DayPreFrame1=CGRectMake(0, Hs14.frame.origin.y, MainContainerView.frame.size.width, 36);
    for (int i=0; i<5; i++) {
        UIView *DaySubview=[[UIView alloc]initWithFrame:DayPreFrame1];
        [DaySubview setBackgroundColor:[UIColor clearColor]];
        [MainContainerView addSubview:DaySubview];
        
        UIView *SubView1=[[UIView alloc]initWithFrame:CGRectMake(0, 0, DaySubview.frame.size.width/2, DaySubview.frame.size.height)];
        [DaySubview addSubview:SubView1];
        [SubView1 setBackgroundColor:[UIColor clearColor]];
        CGRect RRR=CGRectMake(0, 0, 0, 0);
        switch (i) {
            case 0:
                RRR=CGRectMake(10, SubView1.frame.size.height/2-39/4, 18, 39/2);
                break;
                
            case 1:
                RRR=CGRectMake(10, SubView1.frame.size.height/2-24/4, 31/2, 24/2);
                break;
            case 2:
                RRR=CGRectMake(10, SubView1.frame.size.height/2-26/4, 18, 26/2);
                break;
            case 3:
                RRR=CGRectMake(10, SubView1.frame.size.height/2-26/4, 17, 26/2);
                break;
            case 4:
                RRR=CGRectMake(10, SubView1.frame.size.height/2-32/4, 16, 16);
                break;
        }
        
        
        UIImageView *ImgL=[[UIImageView alloc]initWithFrame:RRR];
        [ImgL setImage:[UIImage imageNamed:[ImgLeft objectAtIndex:i]]];
        [SubView1 addSubview:ImgL];
        
        UILabel *LblL=[[UILabel alloc]initWithFrame:CGRectMake(34,11, 280,18)];
        [LblL setFont:HALVELTICA_LIGHT(13)];
        [LblL setTextColor:RGBCOLOR(50, 50, 50, 1)];
        [LblL setTextAlignment:NSTextAlignmentLeft];
        [LblL setText:[TitleLeft objectAtIndex:i]];
        [SubView1 addSubview:LblL];
        
        
        if (i!=4) {
            UIView *SubView2=[[UIView alloc]initWithFrame:CGRectMake(SubView1.frame.size.width, 0, DaySubview.frame.size.width/2, DaySubview.frame.size.height)];
            [DaySubview addSubview:SubView2];
            [SubView2 setBackgroundColor:[UIColor clearColor]];
            
            CGRect LLL=CGRectMake(0, 0, 0, 0);
            switch (i) {
                case 0:
                    LLL=CGRectMake(14, SubView2.frame.size.height/2-39/4, 33/2, 33/2);
                    break;
                    
                case 1:
                    LLL=CGRectMake(14, SubView2.frame.size.height/2-24/4, 32/2, 35/2);
                    break;
                case 2:
                    LLL=CGRectMake(14, SubView2.frame.size.height/2-26/4, 30/2, 32/2);
                    break;
                case 3:
                    LLL=CGRectMake(14, SubView2.frame.size.height/2-26/4, 32/2, 32/2);
                    break;
                    
            }
            
           
            
            UIImageView *ImgR=[[UIImageView alloc]initWithFrame:LLL];
            [ImgR setImage:[UIImage imageNamed:[ImgRight objectAtIndex:i]]];
            [SubView2 addSubview:ImgR];
            
            UILabel *LblR=[[UILabel alloc]initWithFrame:CGRectMake(44,11, 280,18)];
            [LblR setFont:HALVELTICA_LIGHT(13)];
            [LblR setTextColor:RGBCOLOR(50, 50, 50, 1)];
            [LblR setTextAlignment:NSTextAlignmentLeft];
            [LblR setText:[TitleRight objectAtIndex:i]];
            [SubView2 addSubview:LblR];
        }
        
        
        UIView *Hhh=[[UIView alloc]initWithFrame:CGRectMake(0,35, MainContainerView.frame.size.width, 1)];
        [Hhh setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"line2"]]];
        
        if (i!=4) {
            [DaySubview addSubview:Hhh];
        }
        
        
        DayPreFrame1=DaySubview.frame;
        DayPreFrame1.origin.y+=DayPreFrame1.size.height;
    }
    

    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
