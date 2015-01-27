//
//  FNHomePeopleViewController.m
//  Foodenak
//
//  Created by Surajit Dhara on 23/01/15.
//  Copyright (c) 2015 Esolz Tech. All rights reserved.
//

#import "FNHomePeopleViewController.h"

////cme
#import "ViewController.h"
#import "FNeditprofileViewController.h"
#import "FNfollowersViewController.h"
#import "FNresturentlistViewController.h"
#import "FNTradingtagViewController.h"
#import "FNtagViewController.h"
#import "FNresturentdetailsViewController.h"
#import "FNReviewViewController.h"
#import "FNNewRestaurantViewController.h"


//*
#define RGBCOLOR(x,y,z,f) [UIColor colorWithRed:(x/255.0f) green:(y/255.0f) blue:(z/255.0f) alpha:f]

#define  MainScreenHeight [[UIScreen mainScreen]bounds].size.height

#define  MainScreenWidth  [[UIScreen mainScreen]bounds].size.width

#define HALVELTICA(x)  [UIFont fontWithName:@"Helvetica Bold" size:x]

#define HALVELTICA_LIGHT(x)  [UIFont fontWithName:@"Helvetica Light" size:x]
@interface FNHomePeopleViewController ()<UIScrollViewDelegate,UITextFieldDelegate>
{
    //UIButton *menubutton,*locatorbutton,*editbutton,*camerabutton,*messegebutton;
    float TopViewHeight;
}

@end

@implementation FNHomePeopleViewController

-(float)Input:(float)x
{
    return x*290/333;
}
-(void)viewDidLoad
{
    TopViewHeight=117/2;
    
    
    /* ////////////////////// Mainview and TopView(RED) /////////////////////// */
    
    Backgroundview=[[UIView alloc]initWithFrame:CGRectMake(self.view.frame.origin.x,self.view.frame.origin.y,self.view.frame.size.width,self.view.frame.size.height)];
    Backgroundview.backgroundColor=[UIColor colorWithRed:(222.0f/255.0f) green:(222.0f/255.0f) blue:(222.0f/255.0f) alpha:1];
    Backgroundview.userInteractionEnabled=YES;
    [self.view addSubview:Backgroundview];
    
    topview=[[UIImageView alloc]initWithFrame:CGRectMake(Backgroundview.frame.origin.x,Backgroundview.frame.origin.y-20,Backgroundview.frame.size.width,100)];
    topview.image=[UIImage imageNamed:@"topview"];
    topview.userInteractionEnabled=YES;
    [Backgroundview addSubview:topview];
    
    
    /* ------------------  Left View ----------------------- */
    
    
    
    Leftmenu=[[UIView alloc]initWithFrame:CGRectMake(-300, 82, 581/2,700)];
    Leftmenu.backgroundColor=[UIColor colorWithRed:(204.0f/255.0f) green:(35.0f/255.0f) blue:(46.0f/255.0f) alpha:1];
    Leftmenu.userInteractionEnabled=YES;
    [self.view addSubview:Leftmenu];
    
    
    UIImageView *userimage1=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 581/2, 538/2)];
    userimage1.image=[UIImage imageNamed:@"userimage"];
    [Leftmenu addSubview:userimage1];
    
    UIImageView *userimage2=[[UIImageView alloc]initWithFrame:CGRectMake(77, 42, 244/2, 244/2)];
    userimage2.image=[UIImage imageNamed:@"userimage2"];
    [userimage1 addSubview:userimage2];
    
    UILabel *username=[[UILabel alloc]initWithFrame:CGRectMake(0, userimage2.frame.origin.y+125,275,50)];
    username.text=@"Mc Arnold";
    username.textColor=[UIColor whiteColor];
    username.textAlignment=NSTextAlignmentCenter;
    [username setBackgroundColor:[UIColor clearColor]];
    username.font=[UIFont fontWithName:@"Helvetica Bold" size:22];
    [userimage1 addSubview:username];
    
    UILabel *usertitle = [[UILabel alloc]initWithFrame:CGRectMake(0, userimage2.frame.origin.y+150,275,50)];
    usertitle.text=@"@mc_arnold";
    usertitle.textColor=[UIColor whiteColor];
    usertitle.textAlignment=NSTextAlignmentCenter;
    [usertitle setBackgroundColor:[UIColor clearColor]];
    usertitle.font=[UIFont fontWithName:@"Helvetica" size:17];
    [userimage1 addSubview:usertitle];
    
    UILabel *usertitle1= [[UILabel alloc]initWithFrame:CGRectMake(0, userimage2.frame.origin.y+180,112,50)];
    usertitle1.text=@"Lv. 1 Foodie |";
    usertitle1.textColor=[UIColor whiteColor];
    usertitle1.textAlignment=NSTextAlignmentCenter;
    [usertitle1 setBackgroundColor:[UIColor clearColor]];
    usertitle1.font=[UIFont fontWithName:@"Helvetica" size:15];
    [userimage1 addSubview:usertitle1];
    
    UILabel *cardcount= [[UILabel alloc]initWithFrame:CGRectMake(85, userimage2.frame.origin.y+180,120,50)];
    cardcount.text=@"200 Cards |";
    cardcount.textColor=[UIColor whiteColor];
    cardcount.textAlignment=NSTextAlignmentCenter;
    [cardcount setBackgroundColor:[UIColor clearColor]];
    cardcount.font=[UIFont fontWithName:@"Helvetica" size:15];
    [userimage1 addSubview:cardcount];
    
    UILabel *followerscount= [[UILabel alloc]initWithFrame:CGRectMake(175, userimage2.frame.origin.y+180,120,50)];
    followerscount.text=@"300 Followers";
    followerscount.textColor=[UIColor whiteColor];
    followerscount.textAlignment=NSTextAlignmentCenter;
    [followerscount setBackgroundColor:[UIColor clearColor]];
    followerscount.font=[UIFont fontWithName:@"Helvetica" size:15];
    [Leftmenu addSubview:followerscount];
    
    
    UITapGestureRecognizer *followerstap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(followers:)];
    [followerscount addGestureRecognizer:followerstap];
    followerscount.userInteractionEnabled = YES;
    
    
    UIImageView *pinline1=[[UIImageView alloc]initWithFrame:CGRectMake(0,userimage1.frame.origin.y+268,Leftmenu.frame.size.width,2)];
    pinline1.image=[UIImage imageNamed:@"lineimg2"];
    [Leftmenu addSubview:pinline1];
    
    leftmenuscroll=[[UIScrollView alloc]initWithFrame:CGRectMake(0,270, Leftmenu.frame.size.width,400)];
    leftmenuscroll.scrollEnabled=YES;
    leftmenuscroll.delegate=self;
    leftmenuscroll.backgroundColor=[UIColor clearColor];
    if ([UIScreen mainScreen].bounds.size.height==568.0f)
    {
        [leftmenuscroll setContentSize:CGSizeMake(Leftmenu.frame.size.width,666)];
    }
    else
    {
        [leftmenuscroll setContentSize:CGSizeMake(Leftmenu.frame.size.width,650)];
    }
    
    
    leftmenuscroll.showsVerticalScrollIndicator=NO;
    [Leftmenu addSubview:leftmenuscroll];
    
    bookmarkicon=[[UIImageView alloc]initWithFrame:CGRectMake(20, 17,32-6,32-6)];
    bookmarkicon.image=[UIImage imageNamed:@"bookmarkicon"];
    [leftmenuscroll addSubview:bookmarkicon];
    
    Bookmark=[[UIButton alloc]initWithFrame:CGRectMake(40,10, 150, 40)];
    [Bookmark setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [Bookmark setTitle:@"Bookmark" forState:UIControlStateNormal];
    Bookmark.titleLabel.font=[UIFont fontWithName:@"Helvetica" size:20];
    Bookmark.titleLabel.textAlignment=NSTextAlignmentLeft;
    [leftmenuscroll addSubview:Bookmark];
    
    recenticon=[[UIImageView alloc]initWithFrame:CGRectMake(20, bookmarkicon.frame.origin.y+47,32-6,32-6)];
    recenticon.image=[UIImage imageNamed:@"recenticon"];
    [leftmenuscroll addSubview:recenticon];
    
    Recent=[[UIButton alloc]initWithFrame:CGRectMake(40,Bookmark.frame.origin.y+47, 120, 40)];
    [Recent setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [Recent setTitle:@"Recent" forState:UIControlStateNormal];
    Recent.titleLabel.font=[UIFont fontWithName:@"Helvetica" size:20];
    Recent.titleLabel.textAlignment=NSTextAlignmentLeft;
    [Recent addTarget:self action:@selector(nextpage) forControlEvents:UIControlEventTouchUpInside];
    [leftmenuscroll addSubview:Recent];
    
    
    mycouponicon=[[UIImageView alloc]initWithFrame:CGRectMake(20, recenticon.frame.origin.y+47,32-6,32-6)];
    mycouponicon.image=[UIImage imageNamed:@"couponicon"];
    [leftmenuscroll addSubview:mycouponicon];
    
    Mycoupons=[[UIButton alloc]initWithFrame:CGRectMake(40,Recent.frame.origin.y+46, 165, 40)];
    [Mycoupons setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [Mycoupons setTitle:@"My coupons" forState:UIControlStateNormal];
    Mycoupons.titleLabel.font=[UIFont fontWithName:@"Helvetica" size:20];
    Mycoupons.titleLabel.textAlignment=NSTextAlignmentLeft;
    [Mycoupons addTarget:self action:@selector(CouponsPage) forControlEvents:UIControlEventTouchUpInside];
    [leftmenuscroll addSubview:Mycoupons];
    
    
    editprofileicon=[[UIImageView alloc]initWithFrame:CGRectMake(20, mycouponicon.frame.origin.y+47,32-7,32-7)];
    editprofileicon.image=[UIImage imageNamed:@"editicon"];
    [leftmenuscroll addSubview:editprofileicon];
    
    Editprofile=[[UIButton alloc]initWithFrame:CGRectMake(40,Mycoupons.frame.origin.y+47, 152, 40)];
    [Editprofile setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [Editprofile setTitle:@"Edit profile" forState:UIControlStateNormal];
    Editprofile.titleLabel.font=[UIFont fontWithName:@"Helvetica" size:20];
    Editprofile.titleLabel.textAlignment=NSTextAlignmentLeft;
    [Editprofile addTarget:self action:@selector(Editprofile:) forControlEvents:UIControlEventTouchUpInside];
    [leftmenuscroll addSubview:Editprofile];
    
    
    signouticon=[[UIImageView alloc]initWithFrame:CGRectMake(20, editprofileicon.frame.origin.y+47,32-7,32-7)];
    signouticon.image=[UIImage imageNamed:@"signout"];
    [leftmenuscroll addSubview:signouticon];
    
    Signout=[[UIButton alloc]initWithFrame:CGRectMake(40,Editprofile.frame.origin.y+47, 130, 40)];
    [Signout setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [Signout setTitle:@"Sign out" forState:UIControlStateNormal];
    Signout.titleLabel.font=[UIFont fontWithName:@"Helvetica" size:20];
    Signout.titleLabel.textAlignment=NSTextAlignmentLeft;
    [leftmenuscroll addSubview:Signout];
    
    
    UIImageView *pinline2=[[UIImageView alloc]initWithFrame:CGRectMake(0,signouticon.frame.origin.y+60,Leftmenu.frame.size.width,2)];
    pinline2.image=[UIImage imageNamed:@"lineimg2"];
    [leftmenuscroll addSubview:pinline2];
    
    
    rateusicon=[[UIImageView alloc]initWithFrame:CGRectMake(20, signouticon.frame.origin.y+93,32-4,28-4)];
    rateusicon.image=[UIImage imageNamed:@"rateicon"];
    [leftmenuscroll addSubview:rateusicon];
    
    Rateus=[[UIButton alloc]initWithFrame:CGRectMake(40,Signout.frame.origin.y+90, 130, 40)];
    [Rateus setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [Rateus setTitle:@"Rate us" forState:UIControlStateNormal];
    Rateus.titleLabel.font=[UIFont fontWithName:@"Helvetica" size:20];
    Rateus.titleLabel.textAlignment=NSTextAlignmentLeft;
    [leftmenuscroll addSubview:Rateus];
    
    
    sendfeedbackicon=[[UIImageView alloc]initWithFrame:CGRectMake(17, rateusicon.frame.origin.y+45,32-7,32-7)];
    sendfeedbackicon.image=[UIImage imageNamed:@"feedbackicon"];
    [leftmenuscroll addSubview:sendfeedbackicon];
    
    Sendfeedback=[[UIButton alloc]initWithFrame:CGRectMake(40,Rateus.frame.origin.y+40+7,190, 40)];
    [Sendfeedback setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [Sendfeedback setTitle:@"Send feedback" forState:UIControlStateNormal];
    Sendfeedback.titleLabel.font=[UIFont fontWithName:@"Helvetica" size:20];
    Sendfeedback.titleLabel.textAlignment=NSTextAlignmentLeft;
    [leftmenuscroll addSubview:Sendfeedback];
    
    
    addnewicon=[[UIImageView alloc]initWithFrame:CGRectMake(20, sendfeedbackicon.frame.origin.y+47,32-6,32-7)];
    addnewicon.image=[UIImage imageNamed:@"addrestaurant"];
    [leftmenuscroll addSubview:addnewicon];
    
    Addnew=[[UIButton alloc]initWithFrame:CGRectMake(40,Sendfeedback.frame.origin.y+40+7,227, 40)];
    [Addnew setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [Addnew setTitle:@"Add new restaurant" forState:UIControlStateNormal];
    Addnew.titleLabel.font=[UIFont fontWithName:@"Helvetica" size:20];
    Addnew.titleLabel.textAlignment=NSTextAlignmentLeft;
    [Addnew addTarget:self action:@selector(MenuPage) forControlEvents:UIControlEventTouchUpInside];
    [leftmenuscroll addSubview:Addnew];
    
    
    UIButton * resturentlist=[[UIButton alloc]initWithFrame:CGRectMake(30,Addnew.frame.origin.y+40+7,227, 40)];
    [resturentlist setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [resturentlist setTitle:@"restaurant list" forState:UIControlStateNormal];
    resturentlist.titleLabel.font=[UIFont fontWithName:@"Helvetica" size:20];
    resturentlist.titleLabel.textAlignment=NSTextAlignmentLeft;
    [resturentlist addTarget:self action:@selector(resturentlist:) forControlEvents:UIControlEventTouchUpInside];
    [leftmenuscroll addSubview:resturentlist];
    
    
    
    UIButton * taglist=[[UIButton alloc]initWithFrame:CGRectMake(0,resturentlist.frame.origin.y+40+7,227, 40)];
    [taglist setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [taglist setTitle:@"Tag" forState:UIControlStateNormal];
    taglist.titleLabel.font=[UIFont fontWithName:@"Helvetica" size:20];
    taglist.titleLabel.textAlignment=NSTextAlignmentLeft;
    [taglist addTarget:self action:@selector(tag:) forControlEvents:UIControlEventTouchUpInside];
    [leftmenuscroll addSubview:taglist];
    /* -------------------------- Topview Buttons --------------------------- */
    
    
    
    if ([UIScreen mainScreen].bounds.size.height==568.0f)
    {
        
        /*----------------- iphone 5s ----------------------*/
        
        menubutton=[[UIButton alloc]initWithFrame:CGRectMake(5,58,33-9,24-9)];
        [menubutton setBackgroundImage:[UIImage imageNamed:@"menuicon"] forState:UIControlStateNormal];
        [menubutton addTarget:self action:@selector(LeftTogglemenu:) forControlEvents:UIControlEventTouchUpInside];
        [topview addSubview:menubutton];
        
        UIButton *menutap=[[UIButton alloc]initWithFrame:CGRectMake(0,42,50,50)];
        [menutap setBackgroundColor:[UIColor clearColor]];
        [menutap addTarget:self action:@selector(LeftTogglemenu:) forControlEvents:UIControlEventTouchUpInside];
        [topview addSubview:menutap];
        
        locatorbutton=[[UIButton alloc]initWithFrame:CGRectMake(50,47,22-4,36-4)];
        [locatorbutton setBackgroundImage:[UIImage imageNamed:@"locator1"] forState:UIControlStateNormal];
        [topview addSubview:locatorbutton];
        
        editbutton=[[UIButton alloc]initWithFrame:CGRectMake(210,56,20,20)];
        [editbutton setBackgroundImage:[UIImage imageNamed:@"editicon"] forState:UIControlStateNormal];
        [topview addSubview:editbutton];
        
        camerabutton=[[UIButton alloc]initWithFrame:CGRectMake(250,56,32-6,26-7)];
        [camerabutton setBackgroundImage:[UIImage imageNamed:@"cameraicon"] forState:UIControlStateNormal];
        [topview addSubview:camerabutton];
        
        messegebutton=[[UIButton alloc]initWithFrame:CGRectMake(290,56,32-6,30-7)];
        [messegebutton setBackgroundImage:[UIImage imageNamed:@"messegeicon"] forState:UIControlStateNormal];
        [topview addSubview:messegebutton];
        
    }
    else
    {
        
        /* ------------------------- iphone 6 ---------------------------- */
        
        menubutton=[[UIButton alloc]initWithFrame:CGRectMake(5,58,33-7,24-7)];
        [menubutton setBackgroundImage:[UIImage imageNamed:@"menuicon"] forState:UIControlStateNormal];
        [menubutton addTarget:self action:@selector(LeftTogglemenu:) forControlEvents:UIControlEventTouchUpInside];
        [topview addSubview:menubutton];
        
        UIButton *menutap=[[UIButton alloc]initWithFrame:CGRectMake(0,42,50,50)];
        [menutap setBackgroundColor:[UIColor clearColor]];
        [menutap addTarget:self action:@selector(LeftTogglemenu:) forControlEvents:UIControlEventTouchUpInside];
        [topview addSubview:menutap];
        
        locatorbutton=[[UIButton alloc]initWithFrame:CGRectMake(58,50,22,36)];
        [locatorbutton setBackgroundImage:[UIImage imageNamed:@"locator1"] forState:UIControlStateNormal];
        [topview addSubview:locatorbutton];
        
        editbutton=[[UIButton alloc]initWithFrame:CGRectMake(250,56,22,22)];
        [editbutton setBackgroundImage:[UIImage imageNamed:@"editicon"] forState:UIControlStateNormal];
        [topview addSubview:editbutton];
        
        camerabutton=[[UIButton alloc]initWithFrame:CGRectMake(290,56,32-6,26-6)];
        [camerabutton setBackgroundImage:[UIImage imageNamed:@"cameraicon"] forState:UIControlStateNormal];
        [topview addSubview:camerabutton];
        
        messegebutton=[[UIButton alloc]initWithFrame:CGRectMake(332,56,32-6,30-6)];
        [messegebutton setBackgroundImage:[UIImage imageNamed:@"messegeicon"] forState:UIControlStateNormal];
        [topview addSubview:messegebutton];
    }
    
    [editbutton addTarget:self action:@selector(edit:) forControlEvents:UIControlEventTouchUpInside];
    
    ////////////////////////////////////////////////////////////////////////
    
    
    /*------------------ Top Bar ---------------------*/
    
    topbar=[[UIImageView alloc]initWithFrame:CGRectMake(Backgroundview.frame.origin.x,topview.frame.size.height-20,Backgroundview.frame.size.width,65)];
    topbar.image=[UIImage imageNamed:@"topbar"];
    topbar.userInteractionEnabled=YES;
    [Backgroundview addSubview:topbar];
    
    /* ------------------------Top Bar Buttons and Icons-------------------------- */
    
    if ([UIScreen mainScreen].bounds.size.height==568.0f)
    {
        people=[[UIImageView alloc]initWithFrame:CGRectMake(24-10,20,32-9,32-9)];
        people.image=[UIImage imageNamed:@"peopleicon"];
        [topbar addSubview:people];
        
        peoplebutton1=[[UIButton alloc]initWithFrame:CGRectMake(49-10,20,70,25)];
        [peoplebutton1 setTitle:@"People" forState:UIControlStateNormal];
        [peoplebutton1 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [peoplebutton1 setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
        [peoplebutton1 setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        peoplebutton1.backgroundColor=[UIColor clearColor];
        peoplebutton1.titleLabel.font=[UIFont fontWithName:@"Roboto Light" size:15];
        peoplebutton1.tag=1;
        [peoplebutton1 addTarget:self action:@selector(SegmentFunction:) forControlEvents:UIControlEventTouchUpInside];
        [topbar addSubview:peoplebutton1];
        
        
        home=[[UIImageView alloc]initWithFrame:CGRectMake(150-20,20,32-9,32-9)];
        home.image=[UIImage imageNamed:@"homeicon2"];
        [topbar addSubview:home];
        
        homebutton=[[UIButton alloc]initWithFrame:CGRectMake(170-20,20,70,25)];
        [homebutton setTitle:@"Home" forState:UIControlStateNormal];
        [homebutton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [homebutton setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
        [homebutton setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        homebutton.backgroundColor=[UIColor clearColor];
        homebutton.titleLabel.font=[UIFont fontWithName:@"Roboto Light" size:15];
        homebutton.tag=2;
        [homebutton addTarget:self action:@selector(SegmentFunction:) forControlEvents:UIControlEventTouchUpInside];
        [topbar addSubview:homebutton];
        
        redline=[[UIView alloc]initWithFrame:CGRectMake(120, 61, 100, 4.0f)];
        redline.backgroundColor=[UIColor colorWithRed:(230.0f/255.0f) green:(64.0f/255.0f) blue:(73.0f/255.0f) alpha:1];
        [topbar addSubview:redline];
        
        
        place=[[UIImageView alloc]initWithFrame:CGRectMake(270-32,20,26-5,32-5)];
        place.image=[UIImage imageNamed:@"placeicon"];
        [topbar addSubview:place];
        
        placebutton=[[UIButton alloc]initWithFrame:CGRectMake(287-32,20,70,25)];
        [placebutton setTitle:@"Place" forState:UIControlStateNormal];
        [placebutton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [placebutton setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
        [placebutton setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        placebutton.backgroundColor=[UIColor clearColor];
        placebutton.titleLabel.font=[UIFont fontWithName:@"Roboto Light" size:15];
        placebutton.tag=3;
        [placebutton addTarget:self action:@selector(SegmentFunction:) forControlEvents:UIControlEventTouchUpInside];
        [topbar addSubview:placebutton];
        
    }
    
    else
    {
        
        /* --------------------- iphone 6 -------------------------- */
        
        people=[[UIImageView alloc]initWithFrame:CGRectMake(24,20,32-8,32-8)];
        people.image=[UIImage imageNamed:@"peopleicon"];
        [topbar addSubview:people];
        
        peoplebutton1=[[UIButton alloc]initWithFrame:CGRectMake(49,20,70,25)];
        [peoplebutton1 setTitle:@"People" forState:UIControlStateNormal];
        [peoplebutton1 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [peoplebutton1 setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
        [peoplebutton1 setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        peoplebutton1.backgroundColor=[UIColor clearColor];
        peoplebutton1.tag=1;
        peoplebutton1.titleLabel.font=[UIFont fontWithName:@"Roboto Light" size:15];
        [peoplebutton1 addTarget:self action:@selector(SegmentFunction:) forControlEvents:UIControlEventTouchUpInside];
        
        [topbar addSubview:peoplebutton1];
        
        
        home=[[UIImageView alloc]initWithFrame:CGRectMake(150,20,32-8,32-8)];
        home.image=[UIImage imageNamed:@"homeicon2"];
        [topbar addSubview:home];
        
        homebutton=[[UIButton alloc]initWithFrame:CGRectMake(170,20,70,25)];
        [homebutton setTitle:@"Home" forState:UIControlStateNormal];
        [homebutton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [homebutton setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
        [homebutton setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        homebutton.backgroundColor=[UIColor clearColor];
        homebutton.titleLabel.font=[UIFont fontWithName:@"Roboto Light" size:15];
        homebutton.tag=2;
        [homebutton addTarget:self action:@selector(SegmentFunction:) forControlEvents:UIControlEventTouchUpInside];
        [topbar addSubview:homebutton];
        
        redline=[[UIView alloc]initWithFrame:CGRectMake(145, 61, 100, 4.0f)];
        redline.backgroundColor=[UIColor colorWithRed:(230.0f/255.0f) green:(64.0f/255.0f) blue:(73.0f/255.0f) alpha:1];
        [topbar addSubview:redline];
        
        
        place=[[UIImageView alloc]initWithFrame:CGRectMake(270,20,26-4,32-4)];
        place.image=[UIImage imageNamed:@"placeicon"];
        [topbar addSubview:place];
        
        placebutton=[[UIButton alloc]initWithFrame:CGRectMake(287,20,70,25)];
        [placebutton setTitle:@"Place" forState:UIControlStateNormal];
        [placebutton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [placebutton setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
        [placebutton setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        placebutton.backgroundColor=[UIColor clearColor];
        placebutton.titleLabel.font=[UIFont fontWithName:@"Roboto Light" size:15];
        placebutton.tag=3;
        [placebutton addTarget:self action:@selector(SegmentFunction:) forControlEvents:UIControlEventTouchUpInside];
        [topbar addSubview:placebutton];
    }
    
    
    
    
    
    //////////////////////////////////////
    
    /*-------------------------- Main Scroll View------------------------- */
    
    if ([UIScreen mainScreen].bounds.size.height==568.0f)
    {
        Backgroundscroll=[[UIScrollView alloc]initWithFrame:CGRectMake(Backgroundview.frame.origin.x,topbar.frame.size.height+topview.frame.size.height-20,self.view.frame.size.width,self.view.frame.size.height-140)];
        Backgroundscroll.backgroundColor=[UIColor clearColor];
        Backgroundscroll.scrollEnabled=YES;
        [Backgroundscroll setContentSize:CGSizeMake(self.view.frame.origin.x, 2200)];
        [Backgroundview addSubview:Backgroundscroll];
    }
    else
    {Backgroundscroll=[[UIScrollView alloc]initWithFrame:CGRectMake(Backgroundview.frame.origin.x,topbar.frame.size.height+topview.frame.size.height-20,self.view.frame.size.width,self.view.frame.size.height-140)];
        Backgroundscroll.backgroundColor=[UIColor clearColor];
        Backgroundscroll.scrollEnabled=YES;
        [Backgroundscroll setContentSize:CGSizeMake(self.view.frame.origin.x, 2400)];
        [Backgroundview addSubview:Backgroundscroll];
        
    }
    
    
    //////////////////////////////////////////////////////////////////
    
    //////////////////////////////////////
    
    if ([UIScreen mainScreen].bounds.size.height==568.0f)
    {
        
        /* ------------------------ iphone 5s ---------------------------- */
        
        sidescroll=[[UIScrollView alloc]initWithFrame:CGRectMake(0,0,self.view.frame.size.width,self.view.frame.size.height-140)];
        sidescroll.backgroundColor=[UIColor clearColor];
        sidescroll.scrollEnabled=YES;
        sidescroll.pagingEnabled=YES;
        sidescroll.showsHorizontalScrollIndicator=NO;
        sidescroll.delegate=self;
        
        [Backgroundscroll addSubview:sidescroll];
        
        
        backgroundimage=[[UIImageView alloc]initWithFrame:CGRectMake(0,0,self.view.frame.size.width,self.view.frame.size.height-210)];
        backgroundimage.image=[UIImage imageNamed:@"backgroundimage"];
        backgroundimage.userInteractionEnabled=YES;
        [sidescroll addSubview:backgroundimage];
        
        UIImageView *backgroundimage2=[[UIImageView alloc]initWithFrame:CGRectMake(backgroundimage.frame.size.width+2,0,self.view.frame.size.width,self.view.frame.size.height-210)];
        backgroundimage2.image=[UIImage imageNamed:@"backgroundimage"];
        backgroundimage2.userInteractionEnabled=YES;
        [sidescroll addSubview:backgroundimage2];
        
        UIImageView *backgroundimage3=[[UIImageView alloc]initWithFrame:CGRectMake(backgroundimage.frame.size.width+backgroundimage2.frame.size.width+4,0,self.view.frame.size.width,self.view.frame.size.height-210)];
        backgroundimage3.image=[UIImage imageNamed:@"backgroundimage"];
        backgroundimage3.userInteractionEnabled=YES;
        [sidescroll addSubview:backgroundimage3];
        
        UIImageView *backgroundimage4=[[UIImageView alloc]initWithFrame:CGRectMake(backgroundimage3.frame.origin.x+322,0,self.view.frame.size.width,self.view.frame.size.height-210)];
        backgroundimage4.image=[UIImage imageNamed:@"backgroundimage"];
        backgroundimage4.userInteractionEnabled=YES;
        [sidescroll addSubview:backgroundimage4];
        
        UIImageView *backgroundimage5=[[UIImageView alloc]initWithFrame:CGRectMake(backgroundimage4.frame.origin.x+322,0,self.view.frame.size.width,self.view.frame.size.height-210)];
        backgroundimage5.image=[UIImage imageNamed:@"backgroundimage"];
        backgroundimage5.userInteractionEnabled=YES;
        [sidescroll addSubview:backgroundimage5];
        
        
        [sidescroll setContentSize:CGSizeMake(backgroundimage4.frame.origin.x+644, self.view.frame.origin.y)];
        
        
        
        header=[[UILabel alloc]initWithFrame:CGRectMake(10, 25, backgroundimage.frame.size.width-140,58)];
        header.text=@"FOODENAK";
        header.textColor=[UIColor whiteColor];
        header.backgroundColor=[UIColor clearColor];
        header.textAlignment=NSTextAlignmentCenter;
        header.font=[UIFont fontWithName:@"Helvetica Bold" size:28];
        [backgroundimage addSubview:header];
        
        about=[[UILabel alloc]initWithFrame:CGRectMake(16, 58, backgroundimage.frame.size.width-120,58)];
        about.text=@"IS THE BEST WAY TO";
        about.textColor=[UIColor whiteColor];
        about.textAlignment=NSTextAlignmentCenter;
        about.font=[UIFont fontWithName:@"Helvetica Light" size:20];
        [backgroundimage addSubview:about];
        
        about2=[[UILabel alloc]initWithFrame:CGRectMake(17, 86, backgroundimage.frame.size.width-80,58)];
        about2.text=@"FIND BEST RESTAURANT";
        about2.textColor=[UIColor whiteColor];
        about2.textAlignment=NSTextAlignmentCenter;
        about2.font=[UIFont fontWithName:@"Helvetica Light" size:20];
        [backgroundimage addSubview:about2];
        
        
        near=[[UITextField alloc]initWithFrame:CGRectMake(16,150,290,50)];
        near.background=[UIImage imageNamed:@"inputfield"];
        near.textColor=[UIColor grayColor];
        near.text=@"I am near Kolkata";
        near.leftView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 60, 50)];
        near.leftViewMode=UITextFieldViewModeAlways;
        near.textAlignment=NSTextAlignmentLeft;
        near.font=[UIFont fontWithName:@"Helvetica Light" size:18];
        near.delegate=self;
        [backgroundimage addSubview:near];
        
        nearim=[[UIImageView alloc]initWithFrame:CGRectMake(15,12,25-7, 31-7)];
        nearim.image=[UIImage imageNamed:@"nearicon"];
        [near addSubview:nearim];
        
        lookingfor=[[UITextField alloc]initWithFrame:CGRectMake(16,200,290,50)];
        lookingfor.background=[UIImage imageNamed:@"inputfield"];
        lookingfor.textColor=[UIColor grayColor];
        lookingfor.text=@"Looking for Pizza";
        lookingfor.leftView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 60, 50)];
        lookingfor.leftViewMode=UITextFieldViewModeAlways;
        lookingfor.textAlignment=NSTextAlignmentLeft;
        lookingfor.font=[UIFont fontWithName:@"Helvetica Light" size:18];
        lookingfor.delegate=self;
        [backgroundimage addSubview:lookingfor];
        
        imlooking=[[UIImageView alloc]initWithFrame:CGRectMake(15,12,31-9, 31-9)];
        imlooking.image=[UIImage imageNamed:@"lookingicon"];
        [lookingfor addSubview:imlooking];
        
        
        searchbutton=[[UIButton alloc]initWithFrame:CGRectMake(20,255,282,45)];
        [searchbutton setImage:[UIImage imageNamed:@"searchbtnimage"] forState:UIControlStateNormal];
        [backgroundimage addSubview:searchbutton];
        
        p1=[[UIImageView alloc]initWithFrame:CGRectMake(115,searchbutton.frame.origin.y+80, 20-5, 19-5)];
        p1.image=[UIImage imageNamed:@"doton"];
        [Backgroundscroll addSubview:p1];
        
        p2=[[UIImageView alloc]initWithFrame:CGRectMake(135,searchbutton.frame.origin.y+80, 20-5, 19-5)];
        p2.image=[UIImage imageNamed:@"dotoff"];
        [Backgroundscroll addSubview:p2];
        
        p3=[[UIImageView alloc]initWithFrame:CGRectMake(155,searchbutton.frame.origin.y+80, 20-5, 19-5)];
        p3.image=[UIImage imageNamed:@"dotoff"];
        [Backgroundscroll addSubview:p3];
        
        p4=[[UIImageView alloc]initWithFrame:CGRectMake(175,searchbutton.frame.origin.y+80, 20-5, 19-5)];
        p4.image=[UIImage imageNamed:@"dotoff"];
        [Backgroundscroll addSubview:p4];
        
        p5=[[UIImageView alloc]initWithFrame:CGRectMake(195,searchbutton.frame.origin.y+80, 20-5, 19-5)];
        p5.image=[UIImage imageNamed:@"dotoff"];
        [Backgroundscroll addSubview:p5];
        
        
        /*------------------------------------------------------*/
        
        
    }
    
    else
    {
        
        sidescroll=[[UIScrollView alloc]initWithFrame:CGRectMake(0,0,self.view.frame.size.width,self.view.frame.size.height-140)];
        sidescroll.backgroundColor=[UIColor clearColor];
        sidescroll.scrollEnabled=YES;
        sidescroll.pagingEnabled=YES;
        sidescroll.showsHorizontalScrollIndicator=NO;
        sidescroll.delegate=self;
        
        [Backgroundscroll addSubview:sidescroll];
        
        
        backgroundimage=[[UIImageView alloc]initWithFrame:CGRectMake(0,0,self.view.frame.size.width,self.view.frame.size.height-210)];
        backgroundimage.image=[UIImage imageNamed:@"backgroundimage"];
        backgroundimage.userInteractionEnabled=YES;
        [sidescroll addSubview:backgroundimage];
        
        UIImageView *backgroundimage2=[[UIImageView alloc]initWithFrame:CGRectMake(backgroundimage.frame.size.width+2,0,self.view.frame.size.width,self.view.frame.size.height-210)];
        backgroundimage2.image=[UIImage imageNamed:@"backgroundimage"];
        backgroundimage2.userInteractionEnabled=YES;
        [sidescroll addSubview:backgroundimage2];
        
        UIImageView *backgroundimage3=[[UIImageView alloc]initWithFrame:CGRectMake(backgroundimage.frame.size.width+backgroundimage2.frame.size.width+4,0,self.view.frame.size.width,self.view.frame.size.height-210)];
        backgroundimage3.image=[UIImage imageNamed:@"backgroundimage"];
        backgroundimage3.userInteractionEnabled=YES;
        [sidescroll addSubview:backgroundimage3];
        
        UIImageView *backgroundimage4=[[UIImageView alloc]initWithFrame:CGRectMake(backgroundimage3.frame.origin.x+376,0,self.view.frame.size.width,self.view.frame.size.height-210)];
        backgroundimage4.image=[UIImage imageNamed:@"backgroundimage"];
        backgroundimage4.userInteractionEnabled=YES;
        [sidescroll addSubview:backgroundimage4];
        
        UIImageView *backgroundimage5=[[UIImageView alloc]initWithFrame:CGRectMake(backgroundimage4.frame.origin.x+376,0,self.view.frame.size.width,self.view.frame.size.height-210)];
        backgroundimage5.image=[UIImage imageNamed:@"backgroundimage"];
        backgroundimage5.userInteractionEnabled=YES;
        [sidescroll addSubview:backgroundimage5];
        
        
        [sidescroll setContentSize:CGSizeMake(backgroundimage4.frame.origin.x+756, self.view.frame.origin.y)];
        
        header=[[UILabel alloc]initWithFrame:CGRectMake(0, 25, backgroundimage.frame.size.width-140,60)];
        header.text=@"FOODENAK";
        header.textColor=[UIColor whiteColor];
        header.backgroundColor=[UIColor clearColor];
        header.textAlignment=NSTextAlignmentCenter;
        header.font=[UIFont fontWithName:@"Helvetica Bold" size:33];
        [backgroundimage addSubview:header];
        
        about=[[UILabel alloc]initWithFrame:CGRectMake(18, 60, backgroundimage.frame.size.width-120,60)];
        about.text=@"IS THE BEST WAY TO";
        about.textColor=[UIColor whiteColor];
        about.textAlignment=NSTextAlignmentCenter;
        about.font=[UIFont fontWithName:@"Helvetica Light" size:25];
        [backgroundimage addSubview:about];
        
        about2=[[UILabel alloc]initWithFrame:CGRectMake(21, 92, backgroundimage.frame.size.width-80,60)];
        about2.text=@"FIND BEST RESTAURANT";
        about2.textColor=[UIColor whiteColor];
        about2.textAlignment=NSTextAlignmentCenter;
        about2.font=[UIFont fontWithName:@"Helvetica Light" size:25];
        [backgroundimage addSubview:about2];
        
        
        near=[[UITextField alloc]initWithFrame:CGRectMake(21,150,335,50)];
        near.background=[UIImage imageNamed:@"inputfield"];
        near.textColor=[UIColor grayColor];
        near.text=@"I am near Kolkata";
        near.leftView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 60, 50)];
        near.leftViewMode=UITextFieldViewModeAlways;
        near.textAlignment=NSTextAlignmentLeft;
        near.font=[UIFont fontWithName:@"Helvetica Light" size:18];
        near.delegate=self;
        [backgroundimage addSubview:near];
        
        nearim=[[UIImageView alloc]initWithFrame:CGRectMake(15,12,25-7, 31-7)];
        nearim.image=[UIImage imageNamed:@"nearicon"];
        [near addSubview:nearim];
        
        lookingfor=[[UITextField alloc]initWithFrame:CGRectMake(21,200,335,50)];
        lookingfor.background=[UIImage imageNamed:@"inputfield"];
        lookingfor.textColor=[UIColor grayColor];
        lookingfor.text=@"Looking for Pizza";
        lookingfor.leftView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 60, 50)];
        lookingfor.leftViewMode=UITextFieldViewModeAlways;
        lookingfor.textAlignment=NSTextAlignmentLeft;
        lookingfor.font=[UIFont fontWithName:@"Helvetica Light" size:18];
        lookingfor.delegate=self;
        [backgroundimage addSubview:lookingfor];
        
        imlooking=[[UIImageView alloc]initWithFrame:CGRectMake(15,12,31-9, 31-9)];
        imlooking.image=[UIImage imageNamed:@"lookingicon"];
        [lookingfor addSubview:imlooking];
        
        
        searchbutton=[[UIButton alloc]initWithFrame:CGRectMake(26,255,324,45)];
        [searchbutton setImage:[UIImage imageNamed:@"searchbtnimage"] forState:UIControlStateNormal];
        [sidescroll addSubview:searchbutton];
        
        
        /* ----------- Page indicator ----------------- */
        
        p1=[[UIImageView alloc]initWithFrame:CGRectMake(140,searchbutton.frame.origin.y+170, 20-5, 19-5)];
        p1.image=[UIImage imageNamed:@"doton"];
        [Backgroundscroll addSubview:p1];
        
        p2=[[UIImageView alloc]initWithFrame:CGRectMake(160,searchbutton.frame.origin.y+170, 20-5, 19-5)];
        p2.image=[UIImage imageNamed:@"dotoff"];
        [Backgroundscroll addSubview:p2];
        
        p3=[[UIImageView alloc]initWithFrame:CGRectMake(180,searchbutton.frame.origin.y+170, 20-5, 19-5)];
        p3.image=[UIImage imageNamed:@"dotoff"];
        [Backgroundscroll addSubview:p3];
        
        p4=[[UIImageView alloc]initWithFrame:CGRectMake(200,searchbutton.frame.origin.y+170, 20-5, 19-5)];
        p4.image=[UIImage imageNamed:@"dotoff"];
        [Backgroundscroll addSubview:p4];
        
        p5=[[UIImageView alloc]initWithFrame:CGRectMake(220,searchbutton.frame.origin.y+170, 20-5, 19-5)];
        p5.image=[UIImage imageNamed:@"dotoff"];
        [Backgroundscroll addSubview:p5];
        
        
        
        
        
        /////////////////////////////////////////////////////////
        
        
    }
    
    
    
    
    
    
    if (MainScreenHeight==568.0)
        
    {
        NSLog(@"in the 555555555555555");
        
        UIImageView *SeeMoreBtn=[[UIImageView alloc]initWithFrame:CGRectMake(15, sidescroll.frame.origin.y+sidescroll.frame.size.height-50, 290, 60)];
        [SeeMoreBtn setImage:[UIImage imageNamed:@"See-More-1"]];
        [Backgroundscroll addSubview:SeeMoreBtn];
        
        
        UILabel *Lbl=[[UILabel alloc]initWithFrame:CGRectMake(15, 19, 120, 20)];
        [Lbl setFont:HALVELTICA(14)];
        [Lbl setText:@"Trading Cards"];
        [Lbl setTextColor:RGBCOLOR(90, 90, 90, 1)];
        [SeeMoreBtn addSubview:Lbl];
        
        UIButton *Btn=[UIButton buttonWithType:UIButtonTypeCustom];
        [Btn setFrame:CGRectMake(174, 12, 147/2+30, 36)];
        [Btn setBackgroundImage:[UIImage imageNamed:@"SeeMoreBtn"] forState:UIControlStateNormal];
        [SeeMoreBtn addSubview:Btn];
        
        
        //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
        
        
        //START OF CARDS
        UIView *CardsContainerView=[[UIView alloc]initWithFrame:CGRectMake(SeeMoreBtn.frame.origin.x, SeeMoreBtn.frame.origin.y+SeeMoreBtn.frame.size.height+20, SeeMoreBtn.frame.size.width, 1316/2+37)];
        //  DealsContainerView.layer.cornerRadius=6.0;
        
        [CardsContainerView setBackgroundColor:[UIColor clearColor]];
        [Backgroundscroll addSubview:CardsContainerView];
        
        
        UIImageView *CardsTopView=[[UIImageView alloc]initWithFrame:CGRectMake(0,0, CardsContainerView.frame.size.width, TopViewHeight)];
        [CardsTopView setImage:[UIImage imageNamed:@"TopViewBg"]];
        
        
        [CardsContainerView addSubview:CardsTopView];
        
        
        UIImage *CardImg=[UIImage imageNamed:@"locationredicon"];
        UIImageView *CardImgView=[[UIImageView alloc] initWithFrame:CGRectMake(20, 10, 12, 33/2)];
        [CardsTopView addSubview:CardImgView];
        [CardImgView setImage:CardImg];
        
        
        
        
        
        UILabel *CardTxtLbl=[[UILabel alloc]initWithFrame:CGRectMake(40, CardImgView.frame.origin.y-2.5, 180, 18)];
        [CardTxtLbl setBackgroundColor:[UIColor clearColor]];
        [CardTxtLbl setFont:HALVELTICA_LIGHT(15)];
        [CardTxtLbl setTextColor:RGBCOLOR(50, 50, 50, 1)];
        [CardTxtLbl setTextAlignment:NSTextAlignmentLeft];
        [CardTxtLbl setText:@"KFC"];
        [CardsTopView addSubview:CardTxtLbl];
        
        
        UILabel *CardRestaurantAddressLbl=[[UILabel alloc]initWithFrame:CGRectMake(40, CardTxtLbl.frame.origin.y+CardTxtLbl.frame.size.height+.5, 280,18)];
        [CardRestaurantAddressLbl setFont:HALVELTICA_LIGHT(13)];
        [CardRestaurantAddressLbl setTextColor:RGBCOLOR(50, 50, 50, 1)];
        [CardRestaurantAddressLbl setTextAlignment:NSTextAlignmentLeft];
        [CardRestaurantAddressLbl setText:@"Lorem ipsum dolor sit amet"];
        [CardsTopView addSubview:CardRestaurantAddressLbl];
        
        
        UIButton *CardsDropDownBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        [CardsDropDownBtn setFrame:CGRectMake(260, CardImgView.frame.origin.y, 44/2, 22)];
        [CardsDropDownBtn setBackgroundImage:[UIImage imageNamed:@"pin"] forState:UIControlStateNormal];
        [CardsDropDownBtn setBackgroundImage:[UIImage imageNamed:@"pin"] forState:UIControlStateSelected];
        [CardsDropDownBtn setBackgroundImage:[UIImage imageNamed:@"pin"] forState:UIControlStateHighlighted];
        [CardsTopView addSubview:CardsDropDownBtn];
        
        
        
        UIView *CardsScrollcontainerView=[[UIView alloc]initWithFrame:CGRectMake(0, CardsTopView.frame.origin.y+CardsTopView.frame.size.height, CardsTopView.frame.size.width, 1316/2-30)];
        [CardsContainerView addSubview:CardsScrollcontainerView];
        [CardsScrollcontainerView setBackgroundColor:[UIColor whiteColor]];
        
        UIImageView *CardsScrollTop=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, CardsScrollcontainerView.frame.size.width, 89/2)];
        [CardsScrollTop setImage:[UIImage imageNamed:@"ShadeImg"]];
        [CardsScrollcontainerView addSubview:CardsScrollTop];
        
        
        UIScrollView *CardsScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, CardsScrollcontainerView.frame.size.width, CardsScrollcontainerView.frame.size.height)];
        [CardsScrollView setBackgroundColor:[UIColor clearColor]];
        [CardsScrollcontainerView addSubview:CardsScrollView];
        
        
        UIImageView *CardsMapAnnotation=[[UIImageView alloc]initWithFrame:CGRectMake(20, 10, 12, 33/2)];
        [CardsMapAnnotation setImage:[UIImage imageNamed:@"locationredicon"]];
        //[CardsScrollView addSubview:CardsMapAnnotation];
        
        UILabel *CardRestaurantNameLbl=[[UILabel alloc]initWithFrame:CGRectMake(40, CardsMapAnnotation.frame.origin.y-2.5, 180, 20)];
        [CardRestaurantNameLbl setBackgroundColor:[UIColor clearColor]];
        [CardRestaurantNameLbl setFont:HALVELTICA_LIGHT(15)];
        [CardRestaurantNameLbl setTextColor:RGBCOLOR(50, 50, 50, 1)];
        [CardRestaurantNameLbl setTextAlignment:NSTextAlignmentLeft];
        [CardRestaurantNameLbl setText:@"KFC"];
        //[CardsScrollView addSubview:CardRestaurantNameLbl];
        
        
        
        
        
        //        UIImageView *CardsMapPin=[[UIImageView alloc]initWithFrame:CGRectMake(252, 10, 35/2, 35/2)];
        //        [CardsMapPin setImage:[UIImage imageNamed:@"pin"]];
        //        //[CardsScrollView addSubview:CardsMapPin];
        
        
        
        
        
        
        UIImageView *BottomCardsCurve=[[UIImageView alloc]initWithFrame:CGRectMake(CardsScrollView.frame.origin.x-5, CardsScrollcontainerView.frame.origin.y+CardsScrollcontainerView.frame.size.height, CardsContainerView.frame.size.width+10, 27/2)];
        [BottomCardsCurve setImage:[UIImage imageNamed:@"BottomCurve"]];
        [CardsContainerView addSubview:BottomCardsCurve];
        
        
        UIView *Hs1=[[UIView alloc]initWithFrame:CGRectMake(0, 56, CardsScrollView.frame.size.width, .5)];
        [Hs1 setBackgroundColor:RGBCOLOR(230, 230, 230, 1)];
        [CardsScrollView addSubview:Hs1];
        
        
        UIView *TopRatingSubView=[[UIView alloc]initWithFrame:CGRectMake(0, Hs1.frame.origin.y+1, CardsScrollView.frame.size.width,42)];
        [TopRatingSubView setBackgroundColor:[UIColor clearColor]];
        [CardsScrollView addSubview:TopRatingSubView];
        int CardstopRate=4;
        UIView *  TopStartContainerView=[[UIView alloc]initWithFrame:CGRectMake(50 ,0, 200, 35)];
        
        TopStartContainerView.backgroundColor=[UIColor clearColor];
        
        [TopRatingSubView addSubview:TopStartContainerView];
        
        CGRect PreFrame2=CGRectMake(0, 5, 49/2, 44/2);
        
        
        
        for (int i=0; i<5; i++) {
            
            UIButton * StarBtn=[UIButton buttonWithType:UIButtonTypeCustom];
            
            [StarBtn setFrame:PreFrame2];
            
            NSString *ImageName=nil;
            
            if (CardstopRate>i) {
                
                ImageName=@"BigStar";
                
            } else {
                ImageName=@"SmallFadeStar";
                
            }
            
            [StarBtn setBackgroundImage:[UIImage imageNamed:ImageName] forState:UIControlStateNormal];
            
            [StarBtn setBackgroundImage:[UIImage imageNamed:ImageName] forState:UIControlStateSelected];
            
            [StarBtn setBackgroundImage:[UIImage imageNamed:ImageName] forState:UIControlStateHighlighted];
            
            [TopStartContainerView addSubview:StarBtn];
            
            PreFrame2.origin.x=PreFrame2.origin.x+PreFrame2.size.width+18;
            
            
            
        }
        UIView *Hs2=[[UIView alloc]initWithFrame:CGRectMake(0, 41, CardsScrollView.frame.size.width, 1.3)];
        [Hs2 setBackgroundColor:RGBCOLOR(230, 230, 230, 1)];
        [TopRatingSubView addSubview:Hs2];
        
        
        
        
        
        //START OF TEST LABEL
        
        int Cradstest=4;
        UIView *TestRatingSubView=[[UIView alloc]initWithFrame:CGRectMake(0,TopRatingSubView.frame.size.height+TopRatingSubView.frame.origin.y, CardsScrollView.frame.size.width,35)];
        
        [TestRatingSubView setBackgroundColor:RGBCOLOR(255, 255, 255, 1)];
        [CardsScrollView addSubview:TestRatingSubView];
        
        UILabel *TitleLbl=[[UILabel alloc] initWithFrame:CGRectMake(20, 4, 50, 23)];
        [TitleLbl setText:@"Test"];
        [TitleLbl setTextColor:RGBCOLOR(100, 100, 100, 1)];
        [TitleLbl setFont:HALVELTICA_LIGHT(14)];
        [TestRatingSubView addSubview:TitleLbl];
        
        
        // STARS START
        UIView * TestStartContainerView=[[UIView alloc]initWithFrame:CGRectMake(170 ,5,103, 26)];
        
        TestStartContainerView.backgroundColor=[UIColor clearColor];
        
        [TestRatingSubView addSubview:TestStartContainerView];
        
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
        UIView *ServiceRatingSubView=[[UIView alloc]initWithFrame:CGRectMake(0,TestRatingSubView.frame.size.height+TestRatingSubView.frame.origin.y, CardsScrollView.frame.size.width,35)];
        
        [ServiceRatingSubView setBackgroundColor:RGBCOLOR(255, 255, 255, 1)];
        [CardsScrollView addSubview:ServiceRatingSubView];
        
        UILabel *ServiceTitleLbl=[[UILabel alloc] initWithFrame:CGRectMake(20, 4, 50, 23)];
        [ServiceTitleLbl setText:@"Service"];
        [ServiceTitleLbl setTextColor:RGBCOLOR(100, 100, 100, 1)];
        [ServiceTitleLbl setFont:HALVELTICA_LIGHT(14)];
        [ServiceRatingSubView addSubview:ServiceTitleLbl];
        
        
        // STARS START
        UIView *ServiceStartContainerView=[[UIView alloc]initWithFrame:CGRectMake(170 ,5,103, 26)];
        
        ServiceStartContainerView.backgroundColor=[UIColor clearColor];
        
        [ServiceRatingSubView addSubview:ServiceStartContainerView];
        
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
        UIView *PresentationRatingSubView=[[UIView alloc]initWithFrame:CGRectMake(0,ServiceRatingSubView.frame.size.height+ServiceRatingSubView.frame.origin.y, CardsScrollView.frame.size.width,35)];
        
        [PresentationRatingSubView setBackgroundColor:RGBCOLOR(255, 255, 255, 1)];
        [CardsScrollView addSubview:PresentationRatingSubView];
        
        UILabel *PresentationTitleLbl=[[UILabel alloc] initWithFrame:CGRectMake(20, 4, 100, 23)];
        [PresentationTitleLbl setText:@"Presentation"];
        [PresentationTitleLbl setTextColor:RGBCOLOR(100, 100, 100, 1)];
        [PresentationTitleLbl setFont:HALVELTICA_LIGHT(14)];
        [PresentationRatingSubView addSubview:PresentationTitleLbl];
        
        
        // STARS START
        UIView *PresentationStartContainerView=[[UIView alloc]initWithFrame:CGRectMake(170 ,5,103, 26)];
        
        PresentationStartContainerView.backgroundColor=[UIColor clearColor];
        
        [PresentationRatingSubView addSubview:PresentationStartContainerView];
        
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
        UIView *AtmosphereRatingSubView=[[UIView alloc]initWithFrame:CGRectMake(0,PresentationRatingSubView.frame.size.height+PresentationRatingSubView.frame.origin.y, CardsScrollView.frame.size.width,35)];
        
        [AtmosphereRatingSubView setBackgroundColor:RGBCOLOR(255, 255, 255, 1)];
        [CardsScrollView addSubview:AtmosphereRatingSubView];
        
        UILabel *AtmosphereTitleLbl=[[UILabel alloc] initWithFrame:CGRectMake(20, 4, 100, 23)];
        [AtmosphereTitleLbl setText:@"Atmosphere"];
        [AtmosphereTitleLbl setTextColor:RGBCOLOR(100, 100, 100, 1)];
        [AtmosphereTitleLbl setFont:HALVELTICA_LIGHT(14)];
        [AtmosphereRatingSubView addSubview:AtmosphereTitleLbl];
        
        
        // STARS START
        UIView *AtmosphereStartContainerView=[[UIView alloc]initWithFrame:CGRectMake(170 ,5,103, 26)];
        
        AtmosphereStartContainerView.backgroundColor=[UIColor clearColor];
        
        [AtmosphereRatingSubView addSubview:AtmosphereStartContainerView];
        
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
        
        UITextView *CardTxtView=[[UITextView alloc]initWithFrame:CGRectMake(0, AtmosphereRatingSubView.frame.origin.y+AtmosphereRatingSubView.frame.size.height, CardsContainerView.frame.size.width, 124/2)];
        [CardTxtView setBackgroundColor:RGBCOLOR(239, 239, 239, 1)];
        [CardsScrollView addSubview:CardTxtView];
        [CardTxtView setText:@"This is the text here........"];
        [CardTxtView setFont:HALVELTICA_LIGHT(13)];
        [CardTxtView setTextColor:RGBCOLOR(100, 100, 100, 1)];
        
        UIView *CardTagContainerView=[[UIView alloc]initWithFrame:CGRectMake(0, CardTxtView.frame.origin.y+CardTxtView.frame.size.height, CardsScrollView.frame.size.width, 100)];
        [CardsScrollView addSubview:CardTagContainerView];
        
        
        UIImageView *SmallCardTag=[[UIImageView alloc]initWithFrame:CGRectMake(15, 7, 124/2, 50/2)];
        [SmallCardTag setImage:[UIImage imageNamed:@"SmallTag"]];
        
        
        [CardTagContainerView addSubview:SmallCardTag];
        UILabel *TLbl=[[UILabel alloc]initWithFrame:CGRectMake(2, 1, 50, 20)];
        
        [TLbl setTextColor:RGBCOLOR(100, 100, 100, 1)];
        [TLbl setText:@"#food"];
        [TLbl setFont:HALVELTICA_LIGHT(13)];
        [SmallCardTag addSubview:TLbl];
        
        UIImageView *BigCardTag=[[UIImageView alloc]initWithFrame:CGRectMake(SmallCardTag.frame.origin.x+SmallCardTag.frame.size.width+10, 7, 177/2, 50/2)];
        [BigCardTag setImage:[UIImage imageNamed:@"BigTag"]];
        
        
        [CardTagContainerView addSubview:BigCardTag];
        UILabel *TLbl1=[[UILabel alloc]initWithFrame:CGRectMake(2, 1, 90, 20)];
        [TLbl1 setTextColor:RGBCOLOR(90, 90, 90, 1)];
        [TLbl1 setText:@"#restaurant"];
        [TLbl1 setFont:HALVELTICA_LIGHT(13)];
        [BigCardTag addSubview:TLbl1];
        
        
        UIImageView *SmallCardTag1=[[UIImageView alloc]initWithFrame:CGRectMake(BigCardTag.frame.origin.x+BigCardTag.frame.size.width+10, 7, 124/2, 50/2)];
        [SmallCardTag1 setImage:[UIImage imageNamed:@"SmallTag"]];
        
        
        [CardTagContainerView addSubview:SmallCardTag1];
        UILabel *TLbl2=[[UILabel alloc]initWithFrame:CGRectMake(2, 1, 50, 20)];
        [TLbl2 setTextColor:RGBCOLOR(90, 90, 90, 1)];
        [TLbl2 setText:@"#hot"];
        [TLbl2 setFont:HALVELTICA_LIGHT(13)];
        [SmallCardTag1 addSubview:TLbl2];
        
        
        UIImageView *MidCardTag=[[UIImageView alloc]initWithFrame:CGRectMake(SmallCardTag.frame.origin.x, SmallCardTag.frame.origin.y+SmallCardTag.frame.size.height+7, 139/2, 50/2)];
        [MidCardTag setImage:[UIImage imageNamed:@"MidTag"]];
        
        
        [CardTagContainerView addSubview:MidCardTag];
        UILabel *TLbl3=[[UILabel alloc]initWithFrame:CGRectMake(2, 1, 70, 20)];
        [TLbl3 setTextColor:RGBCOLOR(90, 90, 90, 1)];
        [TLbl3 setText:@"#chicken"];
        [TLbl3 setFont:HALVELTICA_LIGHT(13)];
        [MidCardTag addSubview:TLbl3];
        
        
        UIImageView *MidCardTag1=[[UIImageView alloc]initWithFrame:CGRectMake(MidCardTag.frame.origin.x+MidCardTag.frame.size.width+10, SmallCardTag.frame.origin.y+SmallCardTag.frame.size.height+7, 139/2, 50/2)];
        [MidCardTag1 setImage:[UIImage imageNamed:@"MidTag"]];
        
        
        [CardTagContainerView addSubview:MidCardTag1];
        UILabel *TLbl4=[[UILabel alloc]initWithFrame:CGRectMake(2, 1, 70, 20)];
        [TLbl4 setTextColor:RGBCOLOR(90, 90, 90, 1)];
        [TLbl4 setText:@"#hangout"];
        [TLbl4 setFont:HALVELTICA_LIGHT(13)];
        [MidCardTag1 addSubview:TLbl4];
        
        //SATAR OF BOTTOM CARD PROFOILE
        UIView *BottomCardView=[[UIView alloc]initWithFrame:CGRectMake(SmallCardTag.frame.origin.x,CardTagContainerView.frame.origin.y+CardTagContainerView.frame.size.height, CardsScrollView.frame.size.width-30,312/2)];
        [BottomCardView setBackgroundColor:RGBCOLOR(246, 246, 246, 1)];
        [CardsScrollView addSubview:BottomCardView];
        BottomCardView.layer.cornerRadius=4.0;
        
        UIImageView *ProfilePic=[[UIImageView alloc]initWithFrame:CGRectMake(10, 7, 40, 40)];
        [ProfilePic setImage:[UIImage imageNamed:@"userimage2"]];
        ProfilePic.layer.cornerRadius=ProfilePic.frame.size.height/2;
        ProfilePic.layer.borderColor=[UIColor lightGrayColor].CGColor;
        ProfilePic.layer.borderWidth=2.0;
        [BottomCardView addSubview:ProfilePic];
        
        
        UILabel *ProfileNameLbl=[[UILabel alloc]initWithFrame:CGRectMake(ProfilePic.frame.origin.x+ProfilePic.frame.size.width+10, ProfilePic.frame.origin.y, 100, 20)];
        [ProfileNameLbl setText:@"jack jonson"];
        [ProfileNameLbl setBackgroundColor:[UIColor clearColor]];
        [ProfileNameLbl setTextColor:RGBCOLOR(70, 70, 70, 1)];
        [ProfileNameLbl setFont:HALVELTICA(13)];
        [BottomCardView addSubview:ProfileNameLbl];
        
        
        UILabel *DateLbl=[[UILabel alloc]initWithFrame:CGRectMake(ProfileNameLbl.frame.origin.x+ProfileNameLbl.frame.size.width+42, ProfileNameLbl.frame.origin.y, 60, 20)];
        [DateLbl setTextColor:RGBCOLOR(110, 110, 110, 1)];
        [DateLbl setText:@"15 dec"];
        [DateLbl setFont:HALVELTICA_LIGHT(13)];
        [BottomCardView addSubview:DateLbl];
        
        UILabel *DateLbl1=[[UILabel alloc]initWithFrame:CGRectMake(ProfileNameLbl.frame.origin.x, ProfileNameLbl.frame.size.height+ProfileNameLbl.frame.origin.y, 260, 20)];
        [DateLbl1 setTextColor:RGBCOLOR(110, 110, 110, 1)];
        [DateLbl1 setText:@"@mc_arnold | Lv.1 Foodie"];
        [DateLbl1 setFont:HALVELTICA_LIGHT(13)];
        [BottomCardView addSubview:DateLbl1];
        
        
        
        UITextView *ProfTxtView=[[UITextView alloc]initWithFrame:CGRectMake(0, DateLbl1.frame.origin.y+DateLbl1.frame.size.height, BottomCardView.frame.size.width, 124/2)];
        [ProfTxtView setBackgroundColor:[UIColor clearColor]];
        [BottomCardView addSubview:ProfTxtView];
        [ProfTxtView setText:@"Porta scelericerte fata yehebej kje \n teveb bgfdg"];
        [ProfTxtView setFont:HALVELTICA_LIGHT(13)];
        [ProfTxtView setTextColor:RGBCOLOR(100, 100, 100, 1)];
        
        
        
        
        UIView *Hs7=[[UIView alloc]initWithFrame:CGRectMake(0,ProfTxtView.frame.origin.y+ProfTxtView.frame.size.height+5, BottomCardView.frame.size.width, .5)];
        [Hs7 setBackgroundColor:RGBCOLOR(200, 200, 200, 1)];
        [BottomCardView addSubview:Hs7];
        
        UILabel *Lbl1=[[UILabel alloc]initWithFrame:CGRectMake(14, Hs7.frame.size.height+Hs7.frame.origin.y+1, 20, 20)];
        [Lbl1 setTextColor:RGBCOLOR(110, 110, 110, 1)];
        [Lbl1 setText:@"30"];
        [Lbl1 setBackgroundColor:[UIColor clearColor]];
        [Lbl1 setFont:HALVELTICA_LIGHT(13)];
        [BottomCardView addSubview:Lbl1];
        
        
        UIImageView *HeartPic=[[UIImageView alloc]initWithFrame:CGRectMake(Lbl1.frame.origin.x+Lbl1.frame.size.width+3, Lbl1.frame.origin.y+5, 16, 14)];
        [HeartPic setImage:[UIImage imageNamed:@"heartgray"]];
        [BottomCardView addSubview:HeartPic];
        
        
        
        UILabel *Lbl2=[[UILabel alloc]initWithFrame:CGRectMake(HeartPic.frame.origin.x+HeartPic.frame.size.width+18, Hs7.frame.size.height+Hs7.frame.origin.y+1, 20, 20)];
        [Lbl2 setTextColor:RGBCOLOR(110, 110, 110, 1)];
        [Lbl2 setText:@"30"];
        [Lbl2 setBackgroundColor:[UIColor clearColor]];
        [Lbl2 setFont:HALVELTICA_LIGHT(13)];
        [BottomCardView addSubview:Lbl2];
        
        
        UIImageView *CommentPic=[[UIImageView alloc]initWithFrame:CGRectMake(Lbl2.frame.origin.x+Lbl2.frame.size.width+3, Lbl1.frame.origin.y+5, 29/2,29/2)];
        [CommentPic setImage:[UIImage imageNamed:@"commentgrayimage"]];
        [BottomCardView addSubview:CommentPic];
        
        
        
        
        UIView *Vs7=[[UIView alloc]initWithFrame:CGRectMake(CommentPic.frame.origin.x+CommentPic.frame.size.width+20,Hs7.frame.origin.y+Hs7.frame.size.height, 1,25)];
        [Vs7 setBackgroundColor:RGBCOLOR(200, 200, 200, 1)];
        [BottomCardView addSubview:Vs7];
        
        
        
        UIImageView *HeartPicRed=[[UIImageView alloc]initWithFrame:CGRectMake(Vs7.frame.origin.x+Vs7.frame.size.width+20, Lbl1.frame.origin.y+5, 16, 14)];
        [HeartPicRed setImage:[UIImage imageNamed:@"popularicon"]];
        [BottomCardView addSubview:HeartPicRed];
        
        
        UIImageView *CommentDouble=[[UIImageView alloc]initWithFrame:CGRectMake(HeartPicRed.frame.origin.x+HeartPicRed.frame.size.width+20, Lbl1.frame.origin.y+5, 16, 15)];
        [CommentDouble setImage:[UIImage imageNamed:@"CommentDouble"]];
        [BottomCardView addSubview:CommentDouble];
        
        UIImageView *MorePic=[[UIImageView alloc]initWithFrame:CGRectMake(CommentDouble.frame.origin.x+CommentDouble.frame.size.width+20, Lbl1.frame.origin.y+5, 2.5, 23/2)];
        [MorePic setImage:[UIImage imageNamed:@"more"]];
        [BottomCardView addSubview:MorePic];
        
        UIView *VF=[[UIView alloc]initWithFrame:CGRectMake(0, BottomCardView.frame.size.height+BottomCardView.frame.origin.y, CardsContainerView.frame.size.width, 80)];
        [VF setBackgroundColor:[UIColor clearColor]];
        //[CardsScrollView addSubview:VF];
        
        UIButton *CardSeeMoreBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        [CardSeeMoreBtn setFrame:CGRectMake(25, 20, 497/2, 64/2)];
        [CardSeeMoreBtn setBackgroundImage:[UIImage imageNamed:@"see-more"] forState:UIControlStateNormal];
        [CardSeeMoreBtn setBackgroundImage:[UIImage imageNamed:@"see-more"] forState:UIControlStateSelected];
        [CardSeeMoreBtn setBackgroundImage:[UIImage imageNamed:@"see-more"] forState:UIControlStateHighlighted];
        [VF addSubview:CardSeeMoreBtn];
        
        
        
        
        UIImageView *SeeMoreBtn1=[[UIImageView alloc]initWithFrame:CGRectMake(10, CardsContainerView.frame.origin.y+CardsContainerView.frame.size.height+20, 300, 60)];
        [SeeMoreBtn1 setImage:[UIImage imageNamed:@"See-More-1"]];
        [Backgroundscroll addSubview:SeeMoreBtn1];
        
        UILabel *Lbl11=[[UILabel alloc]initWithFrame:CGRectMake(15, 19, 120, 20)];
        [Lbl11 setFont:HALVELTICA(14)];
        [Lbl11 setText:@"Trading Cards"];
        [Lbl11 setTextColor:RGBCOLOR(90, 90, 90, 1)];
        [SeeMoreBtn1 addSubview:Lbl11];
        
        UIButton *Btn1=[UIButton buttonWithType:UIButtonTypeCustom];
        [Btn1 setFrame:CGRectMake(185, 12, 147/2+30, 36)];
        [Btn1 setBackgroundImage:[UIImage imageNamed:@"SeeMoreBtn"] forState:UIControlStateNormal];
        [SeeMoreBtn1 addSubview:Btn1];
        
        
        
        
        ///////>>>>>>>>>>>>>>>>>>>>>>><<<<<<<<<<<<<<<<<<<<<<<<<
        
        
        UIView *CardTagContainerView1=[[UIView alloc]initWithFrame:CGRectMake(SeeMoreBtn1.frame.origin.x+5, SeeMoreBtn1.frame.origin.y+SeeMoreBtn1.frame.size.height+19, SeeMoreBtn1.frame.size.width-10, 100)];
        [Backgroundscroll addSubview:CardTagContainerView1];
        [CardTagContainerView1 setBackgroundColor:[UIColor whiteColor]];
        CardTagContainerView1.layer.cornerRadius=4.0;
        
        UIImageView *pSmallCardTag=[[UIImageView alloc]initWithFrame:CGRectMake(15, 17, 124/2, 50/2)];
        [pSmallCardTag setImage:[UIImage imageNamed:@"SmallTag"]];
        
        
        [CardTagContainerView1 addSubview:pSmallCardTag];
        UILabel *pTLbl=[[UILabel alloc]initWithFrame:CGRectMake(2, 1, 50, 20)];
        
        [pTLbl setTextColor:RGBCOLOR(100, 100, 100, 1)];
        [pTLbl setText:@"#food"];
        [pTLbl setFont:HALVELTICA_LIGHT(13)];
        [pSmallCardTag addSubview:pTLbl];
        
        UIImageView *pBigCardTag=[[UIImageView alloc]initWithFrame:CGRectMake(pSmallCardTag.frame.origin.x+pSmallCardTag.frame.size.width+10, 17, 177/2, 50/2)];
        [pBigCardTag setImage:[UIImage imageNamed:@"BigTag"]];
        
        
        [CardTagContainerView1 addSubview:pBigCardTag];
        UILabel *pTLbl1=[[UILabel alloc]initWithFrame:CGRectMake(2, 1, 90, 20)];
        [pTLbl1 setTextColor:RGBCOLOR(90, 90, 90, 1)];
        [pTLbl1 setText:@"#restaurant"];
        [pTLbl1 setFont:HALVELTICA_LIGHT(13)];
        [pBigCardTag addSubview:pTLbl1];
        
        
        UIImageView *pSmallCardTag1=[[UIImageView alloc]initWithFrame:CGRectMake(pBigCardTag.frame.origin.x+pBigCardTag.frame.size.width+10, 17, 124/2, 50/2)];
        [pSmallCardTag1 setImage:[UIImage imageNamed:@"SmallTag"]];
        
        
        [CardTagContainerView1 addSubview:pSmallCardTag1];
        UILabel *pTLbl2=[[UILabel alloc]initWithFrame:CGRectMake(2, 1, 50, 20)];
        [pTLbl2 setTextColor:RGBCOLOR(90, 90, 90, 1)];
        [pTLbl2 setText:@"#hot"];
        [pTLbl2 setFont:HALVELTICA_LIGHT(13)];
        [pSmallCardTag1 addSubview:pTLbl2];
        
        
        UIImageView *pMidCardTag=[[UIImageView alloc]initWithFrame:CGRectMake(pSmallCardTag.frame.origin.x, pSmallCardTag.frame.origin.y+pSmallCardTag.frame.size.height+7, 139/2, 50/2)];
        [pMidCardTag setImage:[UIImage imageNamed:@"MidTag"]];
        
        
        [CardTagContainerView1 addSubview:pMidCardTag];
        UILabel *pTLbl3=[[UILabel alloc]initWithFrame:CGRectMake(2, 1, 70, 20)];
        [pTLbl3 setTextColor:RGBCOLOR(90, 90, 90, 1)];
        [pTLbl3 setText:@"#chicken"];
        [pTLbl3 setFont:HALVELTICA_LIGHT(13)];
        [pMidCardTag addSubview:pTLbl3];
        
        
        UIImageView *pMidCardTag1=[[UIImageView alloc]initWithFrame:CGRectMake(pMidCardTag.frame.origin.x+pMidCardTag.frame.size.width+10, pSmallCardTag.frame.origin.y+pSmallCardTag.frame.size.height+7, 139/2, 50/2)];
        [pMidCardTag1 setImage:[UIImage imageNamed:@"MidTag"]];
        
        
        [CardTagContainerView1 addSubview:pMidCardTag1];
        UILabel *pTLbl4=[[UILabel alloc]initWithFrame:CGRectMake(2, 1, 70, 20)];
        [pTLbl4 setTextColor:RGBCOLOR(90, 90, 90, 1)];
        [pTLbl4 setText:@"#hangout"];
        [pTLbl4 setFont:HALVELTICA_LIGHT(13)];
        [pMidCardTag1 addSubview:pTLbl4];
        
        
        
        
        //Explo
        
        UIImageView *ExploreBtn=[[UIImageView alloc]initWithFrame:CGRectMake(10, CardTagContainerView1.frame.origin.y+CardTagContainerView1.frame.size.height+20, 300, 60)];
        [ExploreBtn setImage:[UIImage imageNamed:@"See-More-1"]];
        [Backgroundscroll addSubview:ExploreBtn];
        
        UILabel *ExploreLbl=[[UILabel alloc]initWithFrame:CGRectMake(15, 19, 120, 20)];
        [ExploreLbl setFont:HALVELTICA(14)];
        [ExploreLbl setText:@"Explore Cards"];
        [ExploreLbl setTextColor:RGBCOLOR(90, 90, 90, 1)];
        [ExploreBtn addSubview:ExploreLbl];
        
        UIButton *Btnc=[UIButton buttonWithType:UIButtonTypeCustom];
        [Btnc setFrame:CGRectMake(185, 12, 147/2+30, 36)];
        [Btnc setBackgroundImage:[UIImage imageNamed:@"DropDwnBtn"] forState:UIControlStateNormal];
        [ExploreBtn addSubview:Btnc];
        
        
        UILabel *ExploreLbl1=[[UILabel alloc]initWithFrame:CGRectMake(7, 3, 36, 20)];
        [ExploreLbl1 setFont:HALVELTICA(13)];
        [ExploreLbl1 setText:@"All"];
        [ExploreLbl1 setTextColor:RGBCOLOR(190, 190, 190, 1)];
        [Btnc addSubview:ExploreLbl1];
        
        
        
        ///////////>>>>>>>>>>>>>>>>>>last design
        
        
        UIView *KfcContainerView=[[UIView alloc]initWithFrame:CGRectMake(SeeMoreBtn.frame.origin.x, ExploreBtn.frame.origin.y+ExploreBtn.frame.size.height+20, SeeMoreBtn.frame.size.width, 1016/2+37)];
        //  DealsContainerView.layer.cornerRadius=6.0;
        
        [KfcContainerView setBackgroundColor:[UIColor whiteColor]];
        KfcContainerView.layer.cornerRadius=4.0;
        [Backgroundscroll addSubview:KfcContainerView];
        
        
        UIImageView *KfcTopView=[[UIImageView alloc]initWithFrame:CGRectMake(0,0, CardsContainerView.frame.size.width, TopViewHeight)];
        [KfcTopView setImage:[UIImage imageNamed:@"TopViewBg"]];
        
        
        [KfcContainerView addSubview:KfcTopView];
        
        
        UIImage *KfcImg=[UIImage imageNamed:@"locationredicon"];
        UIImageView *KfcImgView=[[UIImageView alloc] initWithFrame:CGRectMake(20, 10, 12, 33/2)];
        [KfcTopView addSubview:KfcImgView];
        [KfcImgView setImage:KfcImg];
        
        
        
        
        
        UILabel *KfcTxtLbl=[[UILabel alloc]initWithFrame:CGRectMake(40, CardImgView.frame.origin.y-2.5, 180, 18)];
        [KfcTxtLbl setBackgroundColor:[UIColor clearColor]];
        [KfcTxtLbl setFont:HALVELTICA_LIGHT(15)];
        [KfcTxtLbl setTextColor:RGBCOLOR(50, 50, 50, 1)];
        [KfcTxtLbl setTextAlignment:NSTextAlignmentLeft];
        [KfcTxtLbl setText:@"KFC"];
        [KfcTopView addSubview:KfcTxtLbl];
        
        
        UILabel *KfcRestaurantAddressLbl=[[UILabel alloc]initWithFrame:CGRectMake(40, CardTxtLbl.frame.origin.y+CardTxtLbl.frame.size.height+.5, 280,18)];
        [KfcRestaurantAddressLbl setFont:HALVELTICA_LIGHT(13)];
        [KfcRestaurantAddressLbl setTextColor:RGBCOLOR(50, 50, 50, 1)];
        [KfcRestaurantAddressLbl setTextAlignment:NSTextAlignmentLeft];
        [KfcRestaurantAddressLbl setText:@"Lorem ipsum dolor sit amet"];
        [KfcTopView addSubview:KfcRestaurantAddressLbl];
        
        
        UIButton *KfcDropDownBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        [KfcDropDownBtn setFrame:CGRectMake(260, CardImgView.frame.origin.y, 44/2, 22)];
        [KfcDropDownBtn setBackgroundImage:[UIImage imageNamed:@"pin"] forState:UIControlStateNormal];
        [KfcDropDownBtn setBackgroundImage:[UIImage imageNamed:@"pin"] forState:UIControlStateSelected];
        [KfcDropDownBtn setBackgroundImage:[UIImage imageNamed:@"pin"] forState:UIControlStateHighlighted];
        [KfcTopView addSubview:KfcDropDownBtn];
        
        
        
        
        UIView *Hs21=[[UIView alloc]initWithFrame:CGRectMake(0, 56, CardsScrollView.frame.size.width, .5)];
        [Hs21 setBackgroundColor:RGBCOLOR(230, 230, 230, 1)];
        [KfcContainerView addSubview:Hs21];
        
        
        UIImageView *KfcImgView1=[[UIImageView alloc]initWithFrame:CGRectMake(14, Hs21.frame.origin.y+10, KfcContainerView.frame.size.width-28, 287/2)];
        [KfcContainerView addSubview:KfcImgView1];
        [KfcImgView1 setImage:[UIImage imageNamed:@"Pic"]];
        
        UIImageView *RedBg=[[UIImageView alloc]initWithFrame:CGRectMake(14, KfcImgView1.frame.origin.y+KfcImgView1.frame.size.height, KfcContainerView.frame.size.width-28, 87/2)];
        [KfcContainerView addSubview:RedBg];
        [RedBg setImage:[UIImage imageNamed:@"Red-Bg"]];
        
        UILabel *LeftTxtLbl=[[UILabel alloc]initWithFrame:CGRectMake(10, CardImgView.frame.origin.y-2.5, 130, 18)];
        [LeftTxtLbl setBackgroundColor:[UIColor clearColor]];
        [LeftTxtLbl setFont:HALVELTICA(16)];
        [LeftTxtLbl setTextColor:[UIColor whiteColor]];
        [LeftTxtLbl setTextAlignment:NSTextAlignmentLeft];
        [LeftTxtLbl setText:@"Crispi Chicken"];
        [RedBg addSubview:LeftTxtLbl];
        
        UILabel *RightTxtLbl=[[UILabel alloc]initWithFrame:CGRectMake(LeftTxtLbl.frame.size.width+LeftTxtLbl.frame.origin.x+70, CardImgView.frame.origin.y-2.5, 140, 18)];
        [RightTxtLbl setBackgroundColor:[UIColor clearColor]];
        [RightTxtLbl setFont:HALVELTICA(16)];
        [RightTxtLbl setTextColor:[UIColor whiteColor]];
        [RightTxtLbl setTextAlignment:NSTextAlignmentLeft];
        [RightTxtLbl setText:@"50.00"];
        [RedBg addSubview:RightTxtLbl];
        
        
        
        
        UITextView *ExploreTxtView=[[UITextView alloc]initWithFrame:CGRectMake(0, RedBg.frame.origin.y+RedBg.frame.size.height+20, CardsContainerView.frame.size.width, 124/2)];
        [ExploreTxtView setBackgroundColor:RGBCOLOR(239, 239, 239, 1)];
        [KfcContainerView addSubview:ExploreTxtView];
        [ExploreTxtView setText:@"Face impredicted Porte is the text here........"];
        [ExploreTxtView setFont:HALVELTICA_LIGHT(13)];
        [ExploreTxtView setTextColor:RGBCOLOR(100, 100, 100, 1)];
        
        
        
        
        
        
        UIView *KfcTagContainerView=[[UIView alloc]initWithFrame:CGRectMake(SeeMoreBtn1.frame.origin.x, ExploreTxtView.frame.origin.y+ExploreTxtView.frame.size.height, SeeMoreBtn1.frame.size.width-50, 100)];
        [KfcContainerView addSubview:KfcTagContainerView];
        [KfcTagContainerView setBackgroundColor:[UIColor whiteColor]];
        KfcTagContainerView.layer.cornerRadius=4.0;
        
        UIImageView *qSmallCardTag=[[UIImageView alloc]initWithFrame:CGRectMake(15, 17, 124/2, 50/2)];
        [qSmallCardTag setImage:[UIImage imageNamed:@"SmallTag"]];
        
        
        [KfcTagContainerView addSubview:qSmallCardTag];
        UILabel *qTLbl=[[UILabel alloc]initWithFrame:CGRectMake(2, 1, 50, 20)];
        
        [qTLbl setTextColor:RGBCOLOR(100, 100, 100, 1)];
        [qTLbl setText:@"#food"];
        [qTLbl setFont:HALVELTICA_LIGHT(13)];
        [qSmallCardTag addSubview:qTLbl];
        
        UIImageView *qBigCardTag=[[UIImageView alloc]initWithFrame:CGRectMake(qSmallCardTag.frame.origin.x+qSmallCardTag.frame.size.width+10, 17, 177/2, 50/2)];
        [qBigCardTag setImage:[UIImage imageNamed:@"BigTag"]];
        
        
        [KfcTagContainerView addSubview:qBigCardTag];
        UILabel *qTLbl1=[[UILabel alloc]initWithFrame:CGRectMake(2, 1, 90, 20)];
        [qTLbl1 setTextColor:RGBCOLOR(90, 90, 90, 1)];
        [qTLbl1 setText:@"#restaurant"];
        [qTLbl1 setFont:HALVELTICA_LIGHT(13)];
        [qBigCardTag addSubview:qTLbl1];
        
        
        UIImageView *qSmallCardTag1=[[UIImageView alloc]initWithFrame:CGRectMake(qBigCardTag.frame.origin.x+qBigCardTag.frame.size.width+10, 17, 124/2, 50/2)];
        [qSmallCardTag1 setImage:[UIImage imageNamed:@"SmallTag"]];
        
        
        [KfcTagContainerView addSubview:qSmallCardTag1];
        UILabel *qTLbl2=[[UILabel alloc]initWithFrame:CGRectMake(2, 1, 50, 20)];
        [qTLbl2 setTextColor:RGBCOLOR(90, 90, 90, 1)];
        [qTLbl2 setText:@"#hot"];
        [qTLbl2 setFont:HALVELTICA_LIGHT(13)];
        [qSmallCardTag1 addSubview:qTLbl2];
        
        
        UIImageView *qMidCardTag=[[UIImageView alloc]initWithFrame:CGRectMake(qSmallCardTag.frame.origin.x, qSmallCardTag.frame.origin.y+qSmallCardTag.frame.size.height+7, 139/2, 50/2)];
        [qMidCardTag setImage:[UIImage imageNamed:@"MidTag"]];
        
        
        [KfcTagContainerView addSubview:qMidCardTag];
        UILabel *qTLbl3=[[UILabel alloc]initWithFrame:CGRectMake(2, 1, 70, 20)];
        [qTLbl3 setTextColor:RGBCOLOR(90, 90, 90, 1)];
        [qTLbl3 setText:@"#chicken"];
        [qTLbl3 setFont:HALVELTICA_LIGHT(13)];
        [qMidCardTag addSubview:qTLbl3];
        
        
        UIImageView *qMidCardTag1=[[UIImageView alloc]initWithFrame:CGRectMake(qMidCardTag.frame.origin.x+qMidCardTag.frame.size.width+10, qSmallCardTag.frame.origin.y+qSmallCardTag.frame.size.height+7, 139/2, 50/2)];
        [qMidCardTag1 setImage:[UIImage imageNamed:@"MidTag"]];
        
        
        [KfcTagContainerView addSubview:qMidCardTag1];
        UILabel *qTLbl4=[[UILabel alloc]initWithFrame:CGRectMake(2, 1, 70, 20)];
        [qTLbl4 setTextColor:RGBCOLOR(90, 90, 90, 1)];
        [qTLbl4 setText:@"#hangout"];
        [qTLbl4 setFont:HALVELTICA_LIGHT(13)];
        [qMidCardTag1 addSubview:qTLbl4];
        
        
        
        
        
        
        
    }
    
    else
        
        
    {
        UIImageView *SeeMoreBtn=[[UIImageView alloc]initWithFrame:CGRectMake(20, sidescroll.frame.origin.y+sidescroll.frame.size.height-50, 333, 60)];
        [SeeMoreBtn setImage:[UIImage imageNamed:@"See-More-1"]];
        [Backgroundscroll addSubview:SeeMoreBtn];
        
        UILabel *Lbl=[[UILabel alloc]initWithFrame:CGRectMake(15, 19, 120, 20)];
        [Lbl setFont:HALVELTICA(14)];
        [Lbl setText:@"Trading Cards"];
        [Lbl setTextColor:RGBCOLOR(90, 90, 90, 1)];
        [SeeMoreBtn addSubview:Lbl];
        
        UIButton *Btn=[UIButton buttonWithType:UIButtonTypeCustom];
        [Btn setFrame:CGRectMake(215, 12, 147/2+30, 36)];
        [Btn setBackgroundImage:[UIImage imageNamed:@"SeeMoreBtn"] forState:UIControlStateNormal];
        [SeeMoreBtn addSubview:Btn];
        
        
        //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
        
        
        //START OF CARDS
        UIView *CardsContainerView=[[UIView alloc]initWithFrame:CGRectMake(SeeMoreBtn.frame.origin.x, SeeMoreBtn.frame.origin.y+SeeMoreBtn.frame.size.height+20, SeeMoreBtn.frame.size.width, 1316/2+37)];
        //  DealsContainerView.layer.cornerRadius=6.0;
        
        [CardsContainerView setBackgroundColor:[UIColor clearColor]];
        [Backgroundscroll addSubview:CardsContainerView];
        
        
        UIImageView *CardsTopView=[[UIImageView alloc]initWithFrame:CGRectMake(0,0, CardsContainerView.frame.size.width, TopViewHeight)];
        [CardsTopView setImage:[UIImage imageNamed:@"TopViewBg"]];
        
        
        [CardsContainerView addSubview:CardsTopView];
        
        
        UIImage *CardImg=[UIImage imageNamed:@"locationredicon"];
        UIImageView *CardImgView=[[UIImageView alloc] initWithFrame:CGRectMake(20, 10, 12, 33/2)];
        [CardsTopView addSubview:CardImgView];
        [CardImgView setImage:CardImg];
        
        
        
        
        
        UILabel *CardTxtLbl=[[UILabel alloc]initWithFrame:CGRectMake(40, CardImgView.frame.origin.y-2.5, 180, 18)];
        [CardTxtLbl setBackgroundColor:[UIColor clearColor]];
        [CardTxtLbl setFont:HALVELTICA_LIGHT(15)];
        [CardTxtLbl setTextColor:RGBCOLOR(50, 50, 50, 1)];
        [CardTxtLbl setTextAlignment:NSTextAlignmentLeft];
        [CardTxtLbl setText:@"KFC"];
        [CardsTopView addSubview:CardTxtLbl];
        
        
        UILabel *CardRestaurantAddressLbl=[[UILabel alloc]initWithFrame:CGRectMake(40, CardTxtLbl.frame.origin.y+CardTxtLbl.frame.size.height+.5, 280,18)];
        [CardRestaurantAddressLbl setFont:HALVELTICA_LIGHT(13)];
        [CardRestaurantAddressLbl setTextColor:RGBCOLOR(50, 50, 50, 1)];
        [CardRestaurantAddressLbl setTextAlignment:NSTextAlignmentLeft];
        [CardRestaurantAddressLbl setText:@"Lorem ipsum dolor sit amet"];
        [CardsTopView addSubview:CardRestaurantAddressLbl];
        
        
        UIButton *CardsDropDownBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        [CardsDropDownBtn setFrame:CGRectMake(270, CardImgView.frame.origin.y, 44/2, 22)];
        [CardsDropDownBtn setBackgroundImage:[UIImage imageNamed:@"pin"] forState:UIControlStateNormal];
        [CardsDropDownBtn setBackgroundImage:[UIImage imageNamed:@"pin"] forState:UIControlStateSelected];
        [CardsDropDownBtn setBackgroundImage:[UIImage imageNamed:@"pin"] forState:UIControlStateHighlighted];
        [CardsTopView addSubview:CardsDropDownBtn];
        
        
        
        UIView *CardsScrollcontainerView=[[UIView alloc]initWithFrame:CGRectMake(0, CardsTopView.frame.origin.y+CardsTopView.frame.size.height, CardsTopView.frame.size.width, 1316/2-30)];
        [CardsContainerView addSubview:CardsScrollcontainerView];
        [CardsScrollcontainerView setBackgroundColor:[UIColor whiteColor]];
        
        UIImageView *CardsScrollTop=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, CardsScrollcontainerView.frame.size.width, 89/2)];
        [CardsScrollTop setImage:[UIImage imageNamed:@"ShadeImg"]];
        [CardsScrollcontainerView addSubview:CardsScrollTop];
        
        
        UIScrollView *CardsScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, CardsScrollcontainerView.frame.size.width, CardsScrollcontainerView.frame.size.height)];
        [CardsScrollView setBackgroundColor:[UIColor clearColor]];
        [CardsScrollcontainerView addSubview:CardsScrollView];
        
        
        UIImageView *CardsMapAnnotation=[[UIImageView alloc]initWithFrame:CGRectMake(20, 10, 12, 33/2)];
        [CardsMapAnnotation setImage:[UIImage imageNamed:@"locationredicon"]];
        //[CardsScrollView addSubview:CardsMapAnnotation];
        
        UILabel *CardRestaurantNameLbl=[[UILabel alloc]initWithFrame:CGRectMake(40, CardsMapAnnotation.frame.origin.y-2.5, 180, 20)];
        [CardRestaurantNameLbl setBackgroundColor:[UIColor clearColor]];
        [CardRestaurantNameLbl setFont:HALVELTICA_LIGHT(15)];
        [CardRestaurantNameLbl setTextColor:RGBCOLOR(50, 50, 50, 1)];
        [CardRestaurantNameLbl setTextAlignment:NSTextAlignmentLeft];
        [CardRestaurantNameLbl setText:@"KFC"];
        //[CardsScrollView addSubview:CardRestaurantNameLbl];
        
        
        
        
        
        //        UIImageView *CardsMapPin=[[UIImageView alloc]initWithFrame:CGRectMake(252, 10, 35/2, 35/2)];
        //        [CardsMapPin setImage:[UIImage imageNamed:@"pin"]];
        //        //[CardsScrollView addSubview:CardsMapPin];
        
        
        
        
        
        
        UIImageView *BottomCardsCurve=[[UIImageView alloc]initWithFrame:CGRectMake(CardsScrollView.frame.origin.x-5, CardsScrollcontainerView.frame.origin.y+CardsScrollcontainerView.frame.size.height, CardsContainerView.frame.size.width+10, 27/2)];
        [BottomCardsCurve setImage:[UIImage imageNamed:@"BottomCurve"]];
        [CardsContainerView addSubview:BottomCardsCurve];
        
        
        UIView *Hs1=[[UIView alloc]initWithFrame:CGRectMake(0, 56, CardsScrollView.frame.size.width, .5)];
        [Hs1 setBackgroundColor:RGBCOLOR(230, 230, 230, 1)];
        [CardsScrollView addSubview:Hs1];
        
        
        UIView *TopRatingSubView=[[UIView alloc]initWithFrame:CGRectMake(0, Hs1.frame.origin.y+1, CardsScrollView.frame.size.width,42)];
        [TopRatingSubView setBackgroundColor:[UIColor clearColor]];
        [CardsScrollView addSubview:TopRatingSubView];
        int CardstopRate=4;
        UIView *  TopStartContainerView=[[UIView alloc]initWithFrame:CGRectMake(50 ,0, 200, 35)];
        
        TopStartContainerView.backgroundColor=[UIColor clearColor];
        
        [TopRatingSubView addSubview:TopStartContainerView];
        
        CGRect PreFrame2=CGRectMake(0, 5, 49/2, 44/2);
        
        
        
        for (int i=0; i<5; i++) {
            
            UIButton * StarBtn=[UIButton buttonWithType:UIButtonTypeCustom];
            
            [StarBtn setFrame:PreFrame2];
            
            NSString *ImageName=nil;
            
            if (CardstopRate>i) {
                
                ImageName=@"BigStar";
                
            } else {
                ImageName=@"SmallFadeStar";
                
            }
            
            [StarBtn setBackgroundImage:[UIImage imageNamed:ImageName] forState:UIControlStateNormal];
            
            [StarBtn setBackgroundImage:[UIImage imageNamed:ImageName] forState:UIControlStateSelected];
            
            [StarBtn setBackgroundImage:[UIImage imageNamed:ImageName] forState:UIControlStateHighlighted];
            
            [TopStartContainerView addSubview:StarBtn];
            
            PreFrame2.origin.x=PreFrame2.origin.x+PreFrame2.size.width+18;
            
            
            
        }
        UIView *Hs2=[[UIView alloc]initWithFrame:CGRectMake(0, 41, CardsScrollView.frame.size.width, 1.3)];
        [Hs2 setBackgroundColor:RGBCOLOR(230, 230, 230, 1)];
        [TopRatingSubView addSubview:Hs2];
        
        
        
        
        
        //START OF TEST LABEL
        
        int Cradstest=4;
        UIView *TestRatingSubView=[[UIView alloc]initWithFrame:CGRectMake(0,TopRatingSubView.frame.size.height+TopRatingSubView.frame.origin.y, CardsScrollView.frame.size.width,35)];
        
        [TestRatingSubView setBackgroundColor:RGBCOLOR(255, 255, 255, 1)];
        [CardsScrollView addSubview:TestRatingSubView];
        
        UILabel *TitleLbl=[[UILabel alloc] initWithFrame:CGRectMake(20, 4, 50, 23)];
        [TitleLbl setText:@"Test"];
        [TitleLbl setTextColor:RGBCOLOR(100, 100, 100, 1)];
        [TitleLbl setFont:HALVELTICA_LIGHT(14)];
        [TestRatingSubView addSubview:TitleLbl];
        
        
        // STARS START
        UIView * TestStartContainerView=[[UIView alloc]initWithFrame:CGRectMake(170 ,5,103, 26)];
        
        TestStartContainerView.backgroundColor=[UIColor clearColor];
        
        [TestRatingSubView addSubview:TestStartContainerView];
        
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
        UIView *ServiceRatingSubView=[[UIView alloc]initWithFrame:CGRectMake(0,TestRatingSubView.frame.size.height+TestRatingSubView.frame.origin.y, CardsScrollView.frame.size.width,35)];
        
        [ServiceRatingSubView setBackgroundColor:RGBCOLOR(255, 255, 255, 1)];
        [CardsScrollView addSubview:ServiceRatingSubView];
        
        UILabel *ServiceTitleLbl=[[UILabel alloc] initWithFrame:CGRectMake(20, 4, 50, 23)];
        [ServiceTitleLbl setText:@"Service"];
        [ServiceTitleLbl setTextColor:RGBCOLOR(100, 100, 100, 1)];
        [ServiceTitleLbl setFont:HALVELTICA_LIGHT(14)];
        [ServiceRatingSubView addSubview:ServiceTitleLbl];
        
        
        // STARS START
        UIView *ServiceStartContainerView=[[UIView alloc]initWithFrame:CGRectMake(170 ,5,103, 26)];
        
        ServiceStartContainerView.backgroundColor=[UIColor clearColor];
        
        [ServiceRatingSubView addSubview:ServiceStartContainerView];
        
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
        UIView *PresentationRatingSubView=[[UIView alloc]initWithFrame:CGRectMake(0,ServiceRatingSubView.frame.size.height+ServiceRatingSubView.frame.origin.y, CardsScrollView.frame.size.width,35)];
        
        [PresentationRatingSubView setBackgroundColor:RGBCOLOR(255, 255, 255, 1)];
        [CardsScrollView addSubview:PresentationRatingSubView];
        
        UILabel *PresentationTitleLbl=[[UILabel alloc] initWithFrame:CGRectMake(20, 4, 100, 23)];
        [PresentationTitleLbl setText:@"Presentation"];
        [PresentationTitleLbl setTextColor:RGBCOLOR(100, 100, 100, 1)];
        [PresentationTitleLbl setFont:HALVELTICA_LIGHT(14)];
        [PresentationRatingSubView addSubview:PresentationTitleLbl];
        
        
        // STARS START
        UIView *PresentationStartContainerView=[[UIView alloc]initWithFrame:CGRectMake(170 ,5,103, 26)];
        
        PresentationStartContainerView.backgroundColor=[UIColor clearColor];
        
        [PresentationRatingSubView addSubview:PresentationStartContainerView];
        
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
        UIView *AtmosphereRatingSubView=[[UIView alloc]initWithFrame:CGRectMake(0,PresentationRatingSubView.frame.size.height+PresentationRatingSubView.frame.origin.y, CardsScrollView.frame.size.width,35)];
        
        [AtmosphereRatingSubView setBackgroundColor:RGBCOLOR(255, 255, 255, 1)];
        [CardsScrollView addSubview:AtmosphereRatingSubView];
        
        UILabel *AtmosphereTitleLbl=[[UILabel alloc] initWithFrame:CGRectMake(20, 4, 100, 23)];
        [AtmosphereTitleLbl setText:@"Atmosphere"];
        [AtmosphereTitleLbl setTextColor:RGBCOLOR(100, 100, 100, 1)];
        [AtmosphereTitleLbl setFont:HALVELTICA_LIGHT(14)];
        [AtmosphereRatingSubView addSubview:AtmosphereTitleLbl];
        
        
        // STARS START
        UIView *AtmosphereStartContainerView=[[UIView alloc]initWithFrame:CGRectMake(170 ,5,103, 26)];
        
        AtmosphereStartContainerView.backgroundColor=[UIColor clearColor];
        
        [AtmosphereRatingSubView addSubview:AtmosphereStartContainerView];
        
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
        
        UITextView *CardTxtView=[[UITextView alloc]initWithFrame:CGRectMake(0, AtmosphereRatingSubView.frame.origin.y+AtmosphereRatingSubView.frame.size.height, CardsContainerView.frame.size.width, 124/2)];
        [CardTxtView setBackgroundColor:RGBCOLOR(239, 239, 239, 1)];
        [CardsScrollView addSubview:CardTxtView];
        [CardTxtView setText:@"This is the text here........"];
        [CardTxtView setFont:HALVELTICA_LIGHT(13)];
        [CardTxtView setTextColor:RGBCOLOR(100, 100, 100, 1)];
        
        UIView *CardTagContainerView=[[UIView alloc]initWithFrame:CGRectMake(0, CardTxtView.frame.origin.y+CardTxtView.frame.size.height, CardsScrollView.frame.size.width, 100)];
        [CardsScrollView addSubview:CardTagContainerView];
        
        
        UIImageView *SmallCardTag=[[UIImageView alloc]initWithFrame:CGRectMake(15, 7, 124/2, 50/2)];
        [SmallCardTag setImage:[UIImage imageNamed:@"SmallTag"]];
        
        
        [CardTagContainerView addSubview:SmallCardTag];
        UILabel *TLbl=[[UILabel alloc]initWithFrame:CGRectMake(2, 1, 50, 20)];
        
        [TLbl setTextColor:RGBCOLOR(100, 100, 100, 1)];
        [TLbl setText:@"#food"];
        [TLbl setFont:HALVELTICA_LIGHT(13)];
        [SmallCardTag addSubview:TLbl];
        
        UIImageView *BigCardTag=[[UIImageView alloc]initWithFrame:CGRectMake(SmallCardTag.frame.origin.x+SmallCardTag.frame.size.width+10, 7, 177/2, 50/2)];
        [BigCardTag setImage:[UIImage imageNamed:@"BigTag"]];
        
        
        [CardTagContainerView addSubview:BigCardTag];
        UILabel *TLbl1=[[UILabel alloc]initWithFrame:CGRectMake(2, 1, 90, 20)];
        [TLbl1 setTextColor:RGBCOLOR(90, 90, 90, 1)];
        [TLbl1 setText:@"#restaurant"];
        [TLbl1 setFont:HALVELTICA_LIGHT(13)];
        [BigCardTag addSubview:TLbl1];
        
        
        UIImageView *SmallCardTag1=[[UIImageView alloc]initWithFrame:CGRectMake(BigCardTag.frame.origin.x+BigCardTag.frame.size.width+10, 7, 124/2, 50/2)];
        [SmallCardTag1 setImage:[UIImage imageNamed:@"SmallTag"]];
        
        
        [CardTagContainerView addSubview:SmallCardTag1];
        UILabel *TLbl2=[[UILabel alloc]initWithFrame:CGRectMake(2, 1, 50, 20)];
        [TLbl2 setTextColor:RGBCOLOR(90, 90, 90, 1)];
        [TLbl2 setText:@"#hot"];
        [TLbl2 setFont:HALVELTICA_LIGHT(13)];
        [SmallCardTag1 addSubview:TLbl2];
        
        
        UIImageView *MidCardTag=[[UIImageView alloc]initWithFrame:CGRectMake(SmallCardTag.frame.origin.x, SmallCardTag.frame.origin.y+SmallCardTag.frame.size.height+7, 139/2, 50/2)];
        [MidCardTag setImage:[UIImage imageNamed:@"MidTag"]];
        
        
        [CardTagContainerView addSubview:MidCardTag];
        UILabel *TLbl3=[[UILabel alloc]initWithFrame:CGRectMake(2, 1, 70, 20)];
        [TLbl3 setTextColor:RGBCOLOR(90, 90, 90, 1)];
        [TLbl3 setText:@"#chicken"];
        [TLbl3 setFont:HALVELTICA_LIGHT(13)];
        [MidCardTag addSubview:TLbl3];
        
        
        UIImageView *MidCardTag1=[[UIImageView alloc]initWithFrame:CGRectMake(MidCardTag.frame.origin.x+MidCardTag.frame.size.width+10, SmallCardTag.frame.origin.y+SmallCardTag.frame.size.height+7, 139/2, 50/2)];
        [MidCardTag1 setImage:[UIImage imageNamed:@"MidTag"]];
        
        
        [CardTagContainerView addSubview:MidCardTag1];
        UILabel *TLbl4=[[UILabel alloc]initWithFrame:CGRectMake(2, 1, 70, 20)];
        [TLbl4 setTextColor:RGBCOLOR(90, 90, 90, 1)];
        [TLbl4 setText:@"#hangout"];
        [TLbl4 setFont:HALVELTICA_LIGHT(13)];
        [MidCardTag1 addSubview:TLbl4];
        
        //SATAR OF BOTTOM CARD PROFOILE
        UIView *BottomCardView=[[UIView alloc]initWithFrame:CGRectMake(SmallCardTag.frame.origin.x,CardTagContainerView.frame.origin.y+CardTagContainerView.frame.size.height, CardsScrollView.frame.size.width-30,312/2)];
        [BottomCardView setBackgroundColor:RGBCOLOR(246, 246, 246, 1)];
        [CardsScrollView addSubview:BottomCardView];
        BottomCardView.layer.cornerRadius=4.0;
        
        UIImageView *ProfilePic=[[UIImageView alloc]initWithFrame:CGRectMake(10, 7, 40, 40)];
        [ProfilePic setImage:[UIImage imageNamed:@"userimage2"]];
        ProfilePic.layer.cornerRadius=ProfilePic.frame.size.height/2;
        ProfilePic.layer.borderColor=[UIColor lightGrayColor].CGColor;
        ProfilePic.layer.borderWidth=2.0;
        [BottomCardView addSubview:ProfilePic];
        
        
        UILabel *ProfileNameLbl=[[UILabel alloc]initWithFrame:CGRectMake(ProfilePic.frame.origin.x+ProfilePic.frame.size.width+10, ProfilePic.frame.origin.y, 100, 20)];
        [ProfileNameLbl setText:@"jack jonson"];
        [ProfileNameLbl setBackgroundColor:[UIColor clearColor]];
        [ProfileNameLbl setTextColor:RGBCOLOR(70, 70, 70, 1)];
        [ProfileNameLbl setFont:HALVELTICA(13)];
        [BottomCardView addSubview:ProfileNameLbl];
        
        
        UILabel *DateLbl=[[UILabel alloc]initWithFrame:CGRectMake(ProfileNameLbl.frame.origin.x+ProfileNameLbl.frame.size.width+42, ProfileNameLbl.frame.origin.y, 60, 20)];
        [DateLbl setTextColor:RGBCOLOR(110, 110, 110, 1)];
        [DateLbl setText:@"15 dec"];
        [DateLbl setFont:HALVELTICA_LIGHT(13)];
        [BottomCardView addSubview:DateLbl];
        
        UILabel *DateLbl1=[[UILabel alloc]initWithFrame:CGRectMake(ProfileNameLbl.frame.origin.x, ProfileNameLbl.frame.size.height+ProfileNameLbl.frame.origin.y, 260, 20)];
        [DateLbl1 setTextColor:RGBCOLOR(110, 110, 110, 1)];
        [DateLbl1 setText:@"@mc_arnold | Lv.1 Foodie"];
        [DateLbl1 setFont:HALVELTICA_LIGHT(13)];
        [BottomCardView addSubview:DateLbl1];
        
        
        
        UITextView *ProfTxtView=[[UITextView alloc]initWithFrame:CGRectMake(0, DateLbl1.frame.origin.y+DateLbl1.frame.size.height, BottomCardView.frame.size.width, 124/2)];
        [ProfTxtView setBackgroundColor:[UIColor clearColor]];
        [BottomCardView addSubview:ProfTxtView];
        [ProfTxtView setText:@"Porta scelericerte fata yehebej kje \n teveb bgfdg"];
        [ProfTxtView setFont:HALVELTICA_LIGHT(13)];
        [ProfTxtView setTextColor:RGBCOLOR(100, 100, 100, 1)];
        
        
        
        
        UIView *Hs7=[[UIView alloc]initWithFrame:CGRectMake(0,ProfTxtView.frame.origin.y+ProfTxtView.frame.size.height+5, BottomCardView.frame.size.width, .5)];
        [Hs7 setBackgroundColor:RGBCOLOR(200, 200, 200, 1)];
        [BottomCardView addSubview:Hs7];
        
        UILabel *Lbl1=[[UILabel alloc]initWithFrame:CGRectMake(14, Hs7.frame.size.height+Hs7.frame.origin.y+1, 20, 20)];
        [Lbl1 setTextColor:RGBCOLOR(110, 110, 110, 1)];
        [Lbl1 setText:@"30"];
        [Lbl1 setBackgroundColor:[UIColor clearColor]];
        [Lbl1 setFont:HALVELTICA_LIGHT(13)];
        [BottomCardView addSubview:Lbl1];
        
        
        UIImageView *HeartPic=[[UIImageView alloc]initWithFrame:CGRectMake(Lbl1.frame.origin.x+Lbl1.frame.size.width+3, Lbl1.frame.origin.y+5, 16, 14)];
        [HeartPic setImage:[UIImage imageNamed:@"heartgray"]];
        [BottomCardView addSubview:HeartPic];
        
        
        
        UILabel *Lbl2=[[UILabel alloc]initWithFrame:CGRectMake(HeartPic.frame.origin.x+HeartPic.frame.size.width+18, Hs7.frame.size.height+Hs7.frame.origin.y+1, 20, 20)];
        [Lbl2 setTextColor:RGBCOLOR(110, 110, 110, 1)];
        [Lbl2 setText:@"30"];
        [Lbl2 setBackgroundColor:[UIColor clearColor]];
        [Lbl2 setFont:HALVELTICA_LIGHT(13)];
        [BottomCardView addSubview:Lbl2];
        
        
        UIImageView *CommentPic=[[UIImageView alloc]initWithFrame:CGRectMake(Lbl2.frame.origin.x+Lbl2.frame.size.width+3, Lbl1.frame.origin.y+5, 29/2,29/2)];
        [CommentPic setImage:[UIImage imageNamed:@"commentgrayimage"]];
        [BottomCardView addSubview:CommentPic];
        
        
        
        
        UIView *Vs7=[[UIView alloc]initWithFrame:CGRectMake(CommentPic.frame.origin.x+CommentPic.frame.size.width+20,Hs7.frame.origin.y+Hs7.frame.size.height, 1,25)];
        [Vs7 setBackgroundColor:RGBCOLOR(200, 200, 200, 1)];
        [BottomCardView addSubview:Vs7];
        
        
        
        UIImageView *HeartPicRed=[[UIImageView alloc]initWithFrame:CGRectMake(Vs7.frame.origin.x+Vs7.frame.size.width+20, Lbl1.frame.origin.y+5, 16, 14)];
        [HeartPicRed setImage:[UIImage imageNamed:@"popularicon"]];
        [BottomCardView addSubview:HeartPicRed];
        
        
        UIImageView *CommentDouble=[[UIImageView alloc]initWithFrame:CGRectMake(HeartPicRed.frame.origin.x+HeartPicRed.frame.size.width+20, Lbl1.frame.origin.y+5, 16, 15)];
        [CommentDouble setImage:[UIImage imageNamed:@"CommentDouble"]];
        [BottomCardView addSubview:CommentDouble];
        
        UIImageView *MorePic=[[UIImageView alloc]initWithFrame:CGRectMake(CommentDouble.frame.origin.x+CommentDouble.frame.size.width+20, Lbl1.frame.origin.y+5, 2.5, 23/2)];
        [MorePic setImage:[UIImage imageNamed:@"more"]];
        [BottomCardView addSubview:MorePic];
        
        UIView *VF=[[UIView alloc]initWithFrame:CGRectMake(0, BottomCardView.frame.size.height+BottomCardView.frame.origin.y, CardsContainerView.frame.size.width, 80)];
        [VF setBackgroundColor:[UIColor clearColor]];
        //[CardsScrollView addSubview:VF];
        
        UIButton *CardSeeMoreBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        [CardSeeMoreBtn setFrame:CGRectMake(25, 20, 497/2, 64/2)];
        [CardSeeMoreBtn setBackgroundImage:[UIImage imageNamed:@"see-more"] forState:UIControlStateNormal];
        [CardSeeMoreBtn setBackgroundImage:[UIImage imageNamed:@"see-more"] forState:UIControlStateSelected];
        [CardSeeMoreBtn setBackgroundImage:[UIImage imageNamed:@"see-more"] forState:UIControlStateHighlighted];
        [VF addSubview:CardSeeMoreBtn];
        
        
        
        
        UIImageView *SeeMoreBtn1=[[UIImageView alloc]initWithFrame:CGRectMake(20, CardsContainerView.frame.origin.y+CardsContainerView.frame.size.height+20, 333, 60)];
        [SeeMoreBtn1 setImage:[UIImage imageNamed:@"See-More-1"]];
        [Backgroundscroll addSubview:SeeMoreBtn1];
        
        UILabel *Lbl11=[[UILabel alloc]initWithFrame:CGRectMake(15, 19, 120, 20)];
        [Lbl11 setFont:HALVELTICA(14)];
        [Lbl11 setText:@"Trading Cards"];
        [Lbl11 setTextColor:RGBCOLOR(90, 90, 90, 1)];
        [SeeMoreBtn1 addSubview:Lbl11];
        
        UIButton *Btn1=[UIButton buttonWithType:UIButtonTypeCustom];
        [Btn1 setFrame:CGRectMake(215, 12, 147/2+30, 36)];
        [Btn1 setBackgroundImage:[UIImage imageNamed:@"SeeMoreBtn"] forState:UIControlStateNormal];
        [SeeMoreBtn1 addSubview:Btn1];
        
        
        
        
        ///////>>>>>>>>>>>>>>>>>>>>>>><<<<<<<<<<<<<<<<<<<<<<<<<
        
        
        UIView *CardTagContainerView1=[[UIView alloc]initWithFrame:CGRectMake(SeeMoreBtn1.frame.origin.x+5, SeeMoreBtn1.frame.origin.y+SeeMoreBtn1.frame.size.height+19, SeeMoreBtn1.frame.size.width-10, 100)];
        [Backgroundscroll addSubview:CardTagContainerView1];
        [CardTagContainerView1 setBackgroundColor:[UIColor whiteColor]];
        CardTagContainerView1.layer.cornerRadius=4.0;
        
        UIImageView *pSmallCardTag=[[UIImageView alloc]initWithFrame:CGRectMake(15, 17, 124/2, 50/2)];
        [pSmallCardTag setImage:[UIImage imageNamed:@"SmallTag"]];
        
        
        [CardTagContainerView1 addSubview:pSmallCardTag];
        UILabel *pTLbl=[[UILabel alloc]initWithFrame:CGRectMake(2, 1, 50, 20)];
        
        [pTLbl setTextColor:RGBCOLOR(100, 100, 100, 1)];
        [pTLbl setText:@"#food"];
        [pTLbl setFont:HALVELTICA_LIGHT(13)];
        [pSmallCardTag addSubview:pTLbl];
        
        UIImageView *pBigCardTag=[[UIImageView alloc]initWithFrame:CGRectMake(pSmallCardTag.frame.origin.x+pSmallCardTag.frame.size.width+10, 17, 177/2, 50/2)];
        [pBigCardTag setImage:[UIImage imageNamed:@"BigTag"]];
        
        
        [CardTagContainerView1 addSubview:pBigCardTag];
        UILabel *pTLbl1=[[UILabel alloc]initWithFrame:CGRectMake(2, 1, 90, 20)];
        [pTLbl1 setTextColor:RGBCOLOR(90, 90, 90, 1)];
        [pTLbl1 setText:@"#restaurant"];
        [pTLbl1 setFont:HALVELTICA_LIGHT(13)];
        [pBigCardTag addSubview:pTLbl1];
        
        
        UIImageView *pSmallCardTag1=[[UIImageView alloc]initWithFrame:CGRectMake(pBigCardTag.frame.origin.x+pBigCardTag.frame.size.width+10, 17, 124/2, 50/2)];
        [pSmallCardTag1 setImage:[UIImage imageNamed:@"SmallTag"]];
        
        
        [CardTagContainerView1 addSubview:pSmallCardTag1];
        UILabel *pTLbl2=[[UILabel alloc]initWithFrame:CGRectMake(2, 1, 50, 20)];
        [pTLbl2 setTextColor:RGBCOLOR(90, 90, 90, 1)];
        [pTLbl2 setText:@"#hot"];
        [pTLbl2 setFont:HALVELTICA_LIGHT(13)];
        [pSmallCardTag1 addSubview:pTLbl2];
        
        
        UIImageView *pMidCardTag=[[UIImageView alloc]initWithFrame:CGRectMake(pSmallCardTag.frame.origin.x, pSmallCardTag.frame.origin.y+pSmallCardTag.frame.size.height+7, 139/2, 50/2)];
        [pMidCardTag setImage:[UIImage imageNamed:@"MidTag"]];
        
        
        [CardTagContainerView1 addSubview:pMidCardTag];
        UILabel *pTLbl3=[[UILabel alloc]initWithFrame:CGRectMake(2, 1, 70, 20)];
        [pTLbl3 setTextColor:RGBCOLOR(90, 90, 90, 1)];
        [pTLbl3 setText:@"#chicken"];
        [pTLbl3 setFont:HALVELTICA_LIGHT(13)];
        [pMidCardTag addSubview:pTLbl3];
        
        
        UIImageView *pMidCardTag1=[[UIImageView alloc]initWithFrame:CGRectMake(pMidCardTag.frame.origin.x+pMidCardTag.frame.size.width+10, pSmallCardTag.frame.origin.y+pSmallCardTag.frame.size.height+7, 139/2, 50/2)];
        [pMidCardTag1 setImage:[UIImage imageNamed:@"MidTag"]];
        
        
        [CardTagContainerView1 addSubview:pMidCardTag1];
        UILabel *pTLbl4=[[UILabel alloc]initWithFrame:CGRectMake(2, 1, 70, 20)];
        [pTLbl4 setTextColor:RGBCOLOR(90, 90, 90, 1)];
        [pTLbl4 setText:@"#hangout"];
        [pTLbl4 setFont:HALVELTICA_LIGHT(13)];
        [pMidCardTag1 addSubview:pTLbl4];
        
        
        
        
        //Explo
        
        UIImageView *ExploreBtn=[[UIImageView alloc]initWithFrame:CGRectMake(20, CardTagContainerView1.frame.origin.y+CardTagContainerView1.frame.size.height+20, 333, 60)];
        [ExploreBtn setImage:[UIImage imageNamed:@"See-More-1"]];
        [Backgroundscroll addSubview:ExploreBtn];
        
        UILabel *ExploreLbl=[[UILabel alloc]initWithFrame:CGRectMake(15, 19, 120, 20)];
        [ExploreLbl setFont:HALVELTICA(14)];
        [ExploreLbl setText:@"Explore Cards"];
        [ExploreLbl setTextColor:RGBCOLOR(90, 90, 90, 1)];
        [ExploreBtn addSubview:ExploreLbl];
        
        UIButton *Btnc=[UIButton buttonWithType:UIButtonTypeCustom];
        [Btnc setFrame:CGRectMake(215, 12, 147/2+30, 36)];
        [Btnc setBackgroundImage:[UIImage imageNamed:@"DropDwnBtn"] forState:UIControlStateNormal];
        [ExploreBtn addSubview:Btnc];
        
        
        UILabel *ExploreLbl1=[[UILabel alloc]initWithFrame:CGRectMake(7, 3, 36, 20)];
        [ExploreLbl1 setFont:HALVELTICA(13)];
        [ExploreLbl1 setText:@"All"];
        [ExploreLbl1 setTextColor:RGBCOLOR(190, 190, 190, 1)];
        [Btnc addSubview:ExploreLbl1];
        
        
        
        ///////////>>>>>>>>>>>>>>>>>>last design
        
        
        UIView *KfcContainerView=[[UIView alloc]initWithFrame:CGRectMake(SeeMoreBtn.frame.origin.x, ExploreBtn.frame.origin.y+ExploreBtn.frame.size.height+20, SeeMoreBtn.frame.size.width, 1016/2+37)];
        //  DealsContainerView.layer.cornerRadius=6.0;
        
        [KfcContainerView setBackgroundColor:[UIColor whiteColor]];
        KfcContainerView.layer.cornerRadius=4.0;
        [Backgroundscroll addSubview:KfcContainerView];
        
        
        UIImageView *KfcTopView=[[UIImageView alloc]initWithFrame:CGRectMake(0,0, CardsContainerView.frame.size.width, TopViewHeight)];
        [KfcTopView setImage:[UIImage imageNamed:@"TopViewBg"]];
        
        
        [KfcContainerView addSubview:KfcTopView];
        
        
        UIImage *KfcImg=[UIImage imageNamed:@"locationredicon"];
        UIImageView *KfcImgView=[[UIImageView alloc] initWithFrame:CGRectMake(20, 10, 12, 33/2)];
        [KfcTopView addSubview:KfcImgView];
        [KfcImgView setImage:KfcImg];
        
        
        
        
        
        UILabel *KfcTxtLbl=[[UILabel alloc]initWithFrame:CGRectMake(40, CardImgView.frame.origin.y-2.5, 180, 18)];
        [KfcTxtLbl setBackgroundColor:[UIColor clearColor]];
        [KfcTxtLbl setFont:HALVELTICA_LIGHT(15)];
        [KfcTxtLbl setTextColor:RGBCOLOR(50, 50, 50, 1)];
        [KfcTxtLbl setTextAlignment:NSTextAlignmentLeft];
        [KfcTxtLbl setText:@"KFC"];
        [KfcTopView addSubview:KfcTxtLbl];
        
        
        UILabel *KfcRestaurantAddressLbl=[[UILabel alloc]initWithFrame:CGRectMake(40, CardTxtLbl.frame.origin.y+CardTxtLbl.frame.size.height+.5, 280,18)];
        [KfcRestaurantAddressLbl setFont:HALVELTICA_LIGHT(13)];
        [KfcRestaurantAddressLbl setTextColor:RGBCOLOR(50, 50, 50, 1)];
        [KfcRestaurantAddressLbl setTextAlignment:NSTextAlignmentLeft];
        [KfcRestaurantAddressLbl setText:@"Lorem ipsum dolor sit amet"];
        [KfcTopView addSubview:KfcRestaurantAddressLbl];
        
        
        UIButton *KfcDropDownBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        [KfcDropDownBtn setFrame:CGRectMake(270, CardImgView.frame.origin.y, 44/2, 22)];
        [KfcDropDownBtn setBackgroundImage:[UIImage imageNamed:@"pin"] forState:UIControlStateNormal];
        [KfcDropDownBtn setBackgroundImage:[UIImage imageNamed:@"pin"] forState:UIControlStateSelected];
        [KfcDropDownBtn setBackgroundImage:[UIImage imageNamed:@"pin"] forState:UIControlStateHighlighted];
        [KfcTopView addSubview:KfcDropDownBtn];
        
        
        
        
        UIView *Hs21=[[UIView alloc]initWithFrame:CGRectMake(0, 56, CardsScrollView.frame.size.width, .5)];
        [Hs21 setBackgroundColor:RGBCOLOR(230, 230, 230, 1)];
        [KfcContainerView addSubview:Hs21];
        
        
        UIImageView *KfcImgView1=[[UIImageView alloc]initWithFrame:CGRectMake(14, Hs21.frame.origin.y+10, KfcContainerView.frame.size.width-28, 287/2)];
        [KfcContainerView addSubview:KfcImgView1];
        [KfcImgView1 setImage:[UIImage imageNamed:@"Pic"]];
        
        UIImageView *RedBg=[[UIImageView alloc]initWithFrame:CGRectMake(14, KfcImgView1.frame.origin.y+KfcImgView1.frame.size.height, KfcContainerView.frame.size.width-28, 87/2)];
        [KfcContainerView addSubview:RedBg];
        [RedBg setImage:[UIImage imageNamed:@"Red-Bg"]];
        
        UILabel *LeftTxtLbl=[[UILabel alloc]initWithFrame:CGRectMake(10, CardImgView.frame.origin.y-2.5, 140, 18)];
        [LeftTxtLbl setBackgroundColor:[UIColor clearColor]];
        [LeftTxtLbl setFont:HALVELTICA(16)];
        [LeftTxtLbl setTextColor:[UIColor whiteColor]];
        [LeftTxtLbl setTextAlignment:NSTextAlignmentLeft];
        [LeftTxtLbl setText:@"Crispi Chicken"];
        [RedBg addSubview:LeftTxtLbl];
        
        UILabel *RightTxtLbl=[[UILabel alloc]initWithFrame:CGRectMake(LeftTxtLbl.frame.size.width+LeftTxtLbl.frame.origin.x, CardImgView.frame.origin.y-2.5, 140, 18)];
        [RightTxtLbl setBackgroundColor:[UIColor clearColor]];
        [RightTxtLbl setFont:HALVELTICA(16)];
        [RightTxtLbl setTextColor:[UIColor whiteColor]];
        [RightTxtLbl setTextAlignment:NSTextAlignmentRight];
        [RightTxtLbl setText:@"50.00"];
        [RedBg addSubview:RightTxtLbl];
        
        
        
        
        UITextView *ExploreTxtView=[[UITextView alloc]initWithFrame:CGRectMake(0, RedBg.frame.origin.y+RedBg.frame.size.height+20, CardsContainerView.frame.size.width, 124/2)];
        [ExploreTxtView setBackgroundColor:RGBCOLOR(239, 239, 239, 1)];
        [KfcContainerView addSubview:ExploreTxtView];
        [ExploreTxtView setText:@"Face impredicted Porte is the text here........"];
        [ExploreTxtView setFont:HALVELTICA_LIGHT(13)];
        [ExploreTxtView setTextColor:RGBCOLOR(100, 100, 100, 1)];
        
        
        
        
        
        
        UIView *KfcTagContainerView=[[UIView alloc]initWithFrame:CGRectMake(SeeMoreBtn1.frame.origin.x, ExploreTxtView.frame.origin.y+ExploreTxtView.frame.size.height, SeeMoreBtn1.frame.size.width-30, 100)];
        [KfcContainerView addSubview:KfcTagContainerView];
        [KfcTagContainerView setBackgroundColor:[UIColor whiteColor]];
        KfcTagContainerView.layer.cornerRadius=4.0;
        
        UIImageView *qSmallCardTag=[[UIImageView alloc]initWithFrame:CGRectMake(15, 17, 124/2, 50/2)];
        [qSmallCardTag setImage:[UIImage imageNamed:@"SmallTag"]];
        
        
        [KfcTagContainerView addSubview:qSmallCardTag];
        UILabel *qTLbl=[[UILabel alloc]initWithFrame:CGRectMake(2, 1, 50, 20)];
        
        [qTLbl setTextColor:RGBCOLOR(100, 100, 100, 1)];
        [qTLbl setText:@"#food"];
        [qTLbl setFont:HALVELTICA_LIGHT(13)];
        [qSmallCardTag addSubview:qTLbl];
        
        UIImageView *qBigCardTag=[[UIImageView alloc]initWithFrame:CGRectMake(qSmallCardTag.frame.origin.x+qSmallCardTag.frame.size.width+10, 17, 177/2, 50/2)];
        [qBigCardTag setImage:[UIImage imageNamed:@"BigTag"]];
        
        
        [KfcTagContainerView addSubview:qBigCardTag];
        UILabel *qTLbl1=[[UILabel alloc]initWithFrame:CGRectMake(2, 1, 90, 20)];
        [qTLbl1 setTextColor:RGBCOLOR(90, 90, 90, 1)];
        [qTLbl1 setText:@"#restaurant"];
        [qTLbl1 setFont:HALVELTICA_LIGHT(13)];
        [qBigCardTag addSubview:qTLbl1];
        
        
        UIImageView *qSmallCardTag1=[[UIImageView alloc]initWithFrame:CGRectMake(qBigCardTag.frame.origin.x+qBigCardTag.frame.size.width+10, 17, 124/2, 50/2)];
        [qSmallCardTag1 setImage:[UIImage imageNamed:@"SmallTag"]];
        
        
        [KfcTagContainerView addSubview:qSmallCardTag1];
        UILabel *qTLbl2=[[UILabel alloc]initWithFrame:CGRectMake(2, 1, 50, 20)];
        [qTLbl2 setTextColor:RGBCOLOR(90, 90, 90, 1)];
        [qTLbl2 setText:@"#hot"];
        [qTLbl2 setFont:HALVELTICA_LIGHT(13)];
        [qSmallCardTag1 addSubview:qTLbl2];
        
        
        UIImageView *qMidCardTag=[[UIImageView alloc]initWithFrame:CGRectMake(qSmallCardTag.frame.origin.x, qSmallCardTag.frame.origin.y+qSmallCardTag.frame.size.height+7, 139/2, 50/2)];
        [qMidCardTag setImage:[UIImage imageNamed:@"MidTag"]];
        
        
        [KfcTagContainerView addSubview:qMidCardTag];
        UILabel *qTLbl3=[[UILabel alloc]initWithFrame:CGRectMake(2, 1, 70, 20)];
        [qTLbl3 setTextColor:RGBCOLOR(90, 90, 90, 1)];
        [qTLbl3 setText:@"#chicken"];
        [qTLbl3 setFont:HALVELTICA_LIGHT(13)];
        [qMidCardTag addSubview:qTLbl3];
        
        
        UIImageView *qMidCardTag1=[[UIImageView alloc]initWithFrame:CGRectMake(qMidCardTag.frame.origin.x+qMidCardTag.frame.size.width+10, qSmallCardTag.frame.origin.y+qSmallCardTag.frame.size.height+7, 139/2, 50/2)];
        [qMidCardTag1 setImage:[UIImage imageNamed:@"MidTag"]];
        
        
        [KfcTagContainerView addSubview:qMidCardTag1];
        UILabel *qTLbl4=[[UILabel alloc]initWithFrame:CGRectMake(2, 1, 70, 20)];
        [qTLbl4 setTextColor:RGBCOLOR(90, 90, 90, 1)];
        [qTLbl4 setText:@"#hangout"];
        [qTLbl4 setFont:HALVELTICA_LIGHT(13)];
        [qMidCardTag1 addSubview:qTLbl4];
        
        
        
        
        
        
        
    }
    
    // end of iphone 66666666
    
    
    
    
    
    
    
    
    
    
    
    
}















-(void)SegmentFunction:(UIButton *)sender
{
    if ([UIScreen mainScreen].bounds.size.height==568.0f)
    {
        if (sender.tag==1)
        {
            peoplebutton1.selected=YES;
            homebutton.selected=NO;
            placebutton.selected=NO;
            
            [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                
                
                [redline setFrame:CGRectMake(13, 61, 100, 4.0f)];
                people.image=[UIImage imageNamed:@"people2"];
                home.image=[UIImage imageNamed:@"homeicon"];
                place.image=[UIImage imageNamed:@"placeicon"];
                
            } completion:^(BOOL finished)
             {
             }];
            
        }
        else if (sender.tag==2)
        {
            homebutton.selected=YES;
            peoplebutton1.selected=NO;
            placebutton.selected=NO;
            
            [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                
                [redline setFrame:CGRectMake(120, 61, 100, 4.0f)];
                people.image=[UIImage imageNamed:@"peopleicon"];
                home.image=[UIImage imageNamed:@"homeicon2"];
                place.image=[UIImage imageNamed:@"placeicon"];
            } completion:^(BOOL finished)
             {
             }];
            
            
            
        }
        else if (sender.tag==3)
        {
            placebutton.selected=YES;
            homebutton.selected=NO;
            peoplebutton1.selected=NO;
            
            [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                
                [redline setFrame:CGRectMake(230, 61, 100, 4.0f)];
                people.image=[UIImage imageNamed:@"peopleicon"];
                home.image=[UIImage imageNamed:@"homeicon"];
                place.image=[UIImage imageNamed:@"placeicon2"];
                
            } completion:^(BOOL finished)
             {
             }];
            
        }
        
    }
    else
    {
        
        /* ------------------- iphone 6 ------------------ */
        if (sender.tag==1)
        {
            peoplebutton1.selected=YES;
            homebutton.selected=NO;
            placebutton.selected=NO;
            
            [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                
                
                [redline setFrame:CGRectMake(20, 61, 100, 4.0f)];
                people.image=[UIImage imageNamed:@"people2"];
                home.image=[UIImage imageNamed:@"homeicon"];
                place.image=[UIImage imageNamed:@"placeicon"];
                
            } completion:^(BOOL finished)
             {
             }];
            
        }
        else if (sender.tag==2)
        {
            homebutton.selected=YES;
            peoplebutton1.selected=NO;
            placebutton.selected=NO;
            
            [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                
                [redline setFrame:CGRectMake(145, 61, 100, 4.0f)];
                people.image=[UIImage imageNamed:@"peopleicon"];
                home.image=[UIImage imageNamed:@"homeicon2"];
                place.image=[UIImage imageNamed:@"placeicon"];
            } completion:^(BOOL finished)
             {
             }];
            
            
            
        }
        else if (sender.tag==3)
        {
            placebutton.selected=YES;
            homebutton.selected=NO;
            peoplebutton1.selected=NO;
            
            [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                
                [redline setFrame:CGRectMake(262, 61, 100, 4.0f)];
                people.image=[UIImage imageNamed:@"peopleicon"];
                home.image=[UIImage imageNamed:@"homeicon"];
                place.image=[UIImage imageNamed:@"placeicon2"];
                
            } completion:^(BOOL finished)
             {
             }];
            
        }
        
        
    }
    
}
-(void)LeftTogglemenu:(UIButton *)sender
{
    if (toggle==0)
    {
        
        [UIView animateWithDuration:0.7 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0.6
                            options:1 animations:^{
                                
                                [Leftmenu setFrame:CGRectMake(0, 82, 581/2,700)];
                                
                                
                            }
         
                         completion:^(BOOL finished)
         {
             toggle=1;
         }];
        
        
    }
    else
    {
        [UIView animateWithDuration:0.7 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0.6
                            options:1 animations:^{
                                
                                
                                [Leftmenu setFrame:CGRectMake(-300, 82, 581/2,700)];
                                
                                
                            }
         
                         completion:^(BOOL finished)
         {
             toggle=0;
         }];
        
    }
}


-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView  {
    
    if (scrollView==sidescroll)
    {
        
        int pagenumber =sidescroll.contentOffset.x/self.view.frame.size.width;
        
        
        if (pagenumber == 0)
        {
            p1.image=[UIImage imageNamed:@"doton"];
            p2.image=[UIImage imageNamed:@"dotoff"];
            p3.image=[UIImage imageNamed:@"dotoff"];
            p4.image=[UIImage imageNamed:@"dotoff"];
            p5.image=[UIImage imageNamed:@"dotoff"];
            
        }
        else if (pagenumber ==1)
        {
            
            p1.image=[UIImage imageNamed:@"dotoff"];
            p2.image=[UIImage imageNamed:@"doton"];
            p3.image=[UIImage imageNamed:@"dotoff"];
            p4.image=[UIImage imageNamed:@"dotoff"];
            p5.image=[UIImage imageNamed:@"dotoff"];
            
        }
        else if (pagenumber ==2)
        {
            p1.image=[UIImage imageNamed:@"dotoff"];
            p2.image=[UIImage imageNamed:@"dotoff"];
            p3.image=[UIImage imageNamed:@"doton"];
            p4.image=[UIImage imageNamed:@"dotoff"];
            p5.image=[UIImage imageNamed:@"dotoff"];
            
        }
        else if (pagenumber ==3)
        {
            p1.image=[UIImage imageNamed:@"dotoff"];
            p2.image=[UIImage imageNamed:@"dotoff"];
            p3.image=[UIImage imageNamed:@"dotoff"];
            p4.image=[UIImage imageNamed:@"doton"];
            p5.image=[UIImage imageNamed:@"dotoff"];
            
        }
        else if (pagenumber ==4)
        {
            p1.image=[UIImage imageNamed:@"dotoff"];
            p2.image=[UIImage imageNamed:@"dotoff"];
            p3.image=[UIImage imageNamed:@"dotoff"];
            p4.image=[UIImage imageNamed:@"dotoff"];
            p5.image=[UIImage imageNamed:@"doton"];
            
        }
        
        
        
        
    }
    else if(scrollView==Popularsidescroll)
    {
        if ([UIScreen mainScreen].bounds.size.height==568.0f)
        {
            int pagenumber2 =Popularsidescroll.contentOffset.x/self.view.frame.size.width;
            
            if (pagenumber2 == 1)
            {
                [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                    
                    
                    [blackline setFrame:CGRectMake(112,120,90,2)];
                    
                } completion:^(BOOL finished)
                 {
                 }];
                
                
            }
            if (pagenumber2 == 0)
            {
                [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                    
                    [blackline setFrame:CGRectMake(10,120,90,2)];
                    
                } completion:^(BOOL finished)
                 {
                 }];
                
                
                
            }
            if (pagenumber2 == 2)
            {
                [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                    
                    [blackline setFrame:CGRectMake(220,120,88,2)];
                    
                } completion:^(BOOL finished)
                 {
                 }];
                
                
                
            }
            
        }
        else
        {
            
            int pagenumber2 =Popularsidescroll.contentOffset.x/self.view.frame.size.width;
            
            if (pagenumber2 == 1)
            {
                [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                    
                    
                    [blackline setFrame:CGRectMake(128,120,100,2)];
                    
                } completion:^(BOOL finished)
                 {
                 }];
                
                
            }
            if (pagenumber2 == 0)
            {
                [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                    
                    [blackline setFrame:CGRectMake(10,120,100,2)];
                    
                } completion:^(BOOL finished)
                 {
                 }];
                
                
                
            }
            if (pagenumber2 == 2)
            {
                [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                    
                    [blackline setFrame:CGRectMake(250,120,100,2)];
                    
                } completion:^(BOOL finished)
                 {
                 }];
                
                
                
            }
            
        }
        
    }
    
}
-(void)nextpage
{
    [self LeftTogglemenu:menubutton];
    FNaddmenuViewController *next=[[FNaddmenuViewController alloc]init];
    [self.navigationController pushViewController:next animated:YES];
}
-(void)CouponsPage
{
    [self LeftTogglemenu:menubutton];
    FNcouponsViewController *next2=[[FNcouponsViewController alloc]init];
    [self.navigationController pushViewController:next2 animated:YES];
}
-(void)MenuPage
{
    [self LeftTogglemenu:menubutton];
    FNmenuViewController *gotomenu=[[FNmenuViewController alloc]init];
    [self.navigationController pushViewController:gotomenu animated:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

////edit button function........

-(void)Editprofile:(UIButton *)sender{
    
    FNeditprofileViewController *view = [[FNeditprofileViewController alloc]init];
    [self.navigationController pushViewController:view animated:YES];
    
}

//followers list...

-(void)followers:(UITapGestureRecognizer *)sender{
    
    FNfollowersViewController *follow = [[FNfollowersViewController alloc]init];
    [self.navigationController pushViewController:follow animated:NO];
    
}

-(void)edit:(UIButton *)sender
{
    
    
    
}

-(void)resturentlist:(UIButton *)sender{
    FNresturentlistViewController *list = [[FNresturentlistViewController alloc]init];
    [self.navigationController pushViewController:list animated:NO];
    
    
}

-(void)tag:(UIButton *)sender{
    
    FNTradingtagViewController *list = [[FNTradingtagViewController alloc]init];
    [self.navigationController pushViewController:list animated:NO];
    
    
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
