//
//  ViewController.m
//  Foodenak
//
//  Created by RAHUL - ( iMAC ) on 05/01/15.
//  Copyright (c) 2015 Esolz Tech. All rights reserved.
//

#import "ViewController.h"
#import "FNeditprofileViewController.h"
#import "FNfollowersViewController.h"
#import "FNresturentlistViewController.h"
#import "FNTradingtagViewController.h"
#import "FNtagViewController.h"
#import "FNresturentdetailsViewController.h"

@interface ViewController ()

@end

@implementation ViewController
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    toggle=0;
    self.view.backgroundColor=[UIColor blackColor];
    self.view.userInteractionEnabled=YES;

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

    ////////////////////////////////////////////////////////////////////////////////
    
    /*-------------------------- Main Scroll View------------------------- */
    
    Backgroundscroll=[[UIScrollView alloc]initWithFrame:CGRectMake(Backgroundview.frame.origin.x,topbar.frame.size.height+topview.frame.size.height-20,self.view.frame.size.width,self.view.frame.size.height-140)];
    Backgroundscroll.backgroundColor=[UIColor clearColor];
    Backgroundscroll.scrollEnabled=YES;
    [Backgroundscroll setContentSize:CGSizeMake(self.view.frame.origin.x, 4000)];
    [Backgroundview addSubview:Backgroundscroll];
    
    //////////////////////////////////////////////////////////////////
    
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
         
         
         downarrow=[[UIImageView alloc]initWithFrame:CGRectMake(Backgroundview.frame.origin.x+145,backgroundimage.frame.size.height,42-5,53)];
         downarrow.image=[UIImage imageNamed:@"downarrow"];
         [Backgroundscroll addSubview:downarrow];
         
         
         /* ------------------ iphone 5s ---------------- */
         
         
         statictbutton=[[UIButton alloc]initWithFrame:CGRectMake(5, downarrow.frame.origin.y+70,562-250,100-40)];
         [statictbutton setImage:[UIImage imageNamed:@"statictbtn"] forState:UIControlStateNormal];
         [Backgroundscroll addSubview:statictbutton];
         
         
         popularbackground=[[UIImageView alloc]initWithFrame:CGRectMake(4, statictbutton.frame.origin.y+85,514-200,1035)];
         popularbackground.image=[UIImage imageNamed:@"popularbg"];
         [Backgroundscroll addSubview:popularbackground];
         
         popularview=[[UIImageView alloc]initWithFrame:CGRectMake(7, 0,popularbackground.frame.size.width-14,102)];
         popularview.image=[UIImage imageNamed:@"popularheader"];
         [popularbackground addSubview:popularview];
         
         popularheader=[[UILabel alloc]initWithFrame:CGRectMake(37, 3, backgroundimage.frame.size.width-120,60)];
         popularheader.text=@"Popular Restaurant";
         popularheader.textColor=[UIColor colorWithRed:(230.0f/255.0f) green:(64.0f/255.0f) blue:(73.0f/255.0f) alpha:1];
         popularheader.textAlignment=NSTextAlignmentCenter;
         popularheader.font=[UIFont fontWithName:@"Helvetica" size:20];
         [popularview addSubview:popularheader];
         
         uparrow=[[UIImageView alloc]initWithFrame:CGRectMake(260,15,34,34)];
         uparrow.image=[UIImage imageNamed:@"uparrow"];
         [popularview addSubview:uparrow];
         
         popularicon=[[UIImageView alloc]initWithFrame:CGRectMake(14,21,32-5,28-5)];
         popularicon.image=[UIImage imageNamed:@"popularicon"];
         [popularbackground addSubview:popularicon];
         
         popularbutton=[[UIButton alloc]initWithFrame:CGRectMake(5, popularbackground.frame.origin.y+1055,562-250,100-40)];
         [popularbutton setImage:[UIImage imageNamed:@"populardeals"] forState:UIControlStateNormal];
         [Backgroundscroll addSubview:popularbutton];
         
         
         
         /////////////////////////////////////////////////

         
         topuserbackground=[[UIImageView alloc]initWithFrame:CGRectMake(4, popularbutton.frame.origin.y+100,514-200,500)];
         topuserbackground.image=[UIImage imageNamed:@"popularbg"];
         topuserbackground.userInteractionEnabled=YES;
         [Backgroundscroll addSubview:topuserbackground];
         
         topuserview=[[UIImageView alloc]initWithFrame:CGRectMake(7, 0,topuserbackground.frame.size.width-14,102)];
         topuserview.image=[UIImage imageNamed:@"popularheader"];
         [topuserbackground addSubview:topuserview];
         
         topuserheader=[[UILabel alloc]initWithFrame:CGRectMake(38, 5, backgroundimage.frame.size.width-190,60)];
         topuserheader.text=@"Top user";
         topuserheader.textColor=[UIColor colorWithRed:(230.0f/255.0f) green:(64.0f/255.0f) blue:(73.0f/255.0f) alpha:1];
         topuserheader.textAlignment=NSTextAlignmentCenter;
         topuserheader.font=[UIFont fontWithName:@"Helvetica" size:20];
         [topuserview addSubview:topuserheader];
         
         uparrow2=[[UIImageView alloc]initWithFrame:CGRectMake(218,15,34,34)];
         uparrow2.image=[UIImage imageNamed:@"uparrow"];
         [topuserheader addSubview:uparrow2];
         
         topusericon=[[UIImageView alloc]initWithFrame:CGRectMake(0,18,20,20)];
         topusericon.image=[UIImage imageNamed:@"topusericon"];
         [topuserheader addSubview:topusericon];
         
         
    mypinbackground=[[UIImageView alloc]initWithFrame:CGRectMake(4, topuserbackground.frame.origin.y+530,514-200,840)];
         mypinbackground.image=[UIImage imageNamed:@"popularbg"];
         [Backgroundscroll addSubview:mypinbackground];
         
         mypinview=[[UIImageView alloc]initWithFrame:CGRectMake(7, 0,mypinbackground.frame.size.width-14,102)];
         mypinview.image=[UIImage imageNamed:@"popularheader"];
         [mypinbackground addSubview:mypinview];
         
         
         mypinheader=[[UILabel alloc]initWithFrame:CGRectMake(20, 5, backgroundimage.frame.size.width-190,60)];
         mypinheader.text=@"My pin";
         mypinheader.textColor=[UIColor colorWithRed:(230.0f/255.0f) green:(64.0f/255.0f) blue:(73.0f/255.0f) alpha:1];
         mypinheader.textAlignment=NSTextAlignmentCenter;
         mypinheader.font=[UIFont fontWithName:@"Helvetica" size:22];
         [mypinview addSubview:mypinheader];
         
         
         uparrow3=[[UIImageView alloc]initWithFrame:CGRectMake(218,15,34,34)];
         uparrow3.image=[UIImage imageNamed:@"uparrow"];
         [mypinheader addSubview:uparrow3];
         
         
         mypinicon=[[UIImageView alloc]initWithFrame:CGRectMake(5,18,25,25)];
         mypinicon.image=[UIImage imageNamed:@"mypinicon"];
         [mypinheader addSubview:mypinicon];
         
         myfeedbackground=[[UIImageView alloc]initWithFrame:CGRectMake(4, mypinbackground.frame.origin.y+860,514-200,880)];
         myfeedbackground.image=[UIImage imageNamed:@"popularbg"];
         [Backgroundscroll addSubview:myfeedbackground];
         
         myfeedview=[[UIImageView alloc]initWithFrame:CGRectMake(7, 0,myfeedbackground.frame.size.width-14,102)];
         myfeedview.image=[UIImage imageNamed:@"popularheader"];
         [myfeedbackground addSubview:myfeedview];
         
         myfeedheader=[[UILabel alloc]initWithFrame:CGRectMake(45, 5, backgroundimage.frame.size.width-190,60)];
         myfeedheader.text=@"My feed";
         myfeedheader.textColor=[UIColor colorWithRed:(230.0f/255.0f) green:(64.0f/255.0f) blue:(73.0f/255.0f) alpha:1];
         myfeedheader.textAlignment=NSTextAlignmentCenter;
         myfeedheader.font=[UIFont fontWithName:@"Helvetica" size:22];
         [myfeedview addSubview:myfeedheader];
         
         uparrow4=[[UIImageView alloc]initWithFrame:CGRectMake(218,15,34,34)];
         uparrow4.image=[UIImage imageNamed:@"uparrow"];
         [myfeedheader addSubview:uparrow4];
         
         myfeedicon=[[UIImageView alloc]initWithFrame:CGRectMake(20,18,25,25)];
         myfeedicon.image=[UIImage imageNamed:@"myfeedicon"];
         [myfeedbackground addSubview:myfeedicon];


    /* -------------------- iphone 5s ------------------------ */
         
         
         /*--------------- Popular Design ------------------*/
         
         popularbackground.userInteractionEnabled=YES;
         
         Popularsidescroll=[[UIScrollView alloc]initWithFrame:CGRectMake(-10,160,514-80,800)];
         Popularsidescroll.backgroundColor=[UIColor clearColor];
         Popularsidescroll.scrollEnabled=YES;
         Popularsidescroll.pagingEnabled=YES;
         Popularsidescroll.showsHorizontalScrollIndicator=NO;
         Popularsidescroll.delegate=self;
         [Popularsidescroll setContentSize:CGSizeMake(1400,800)];
         [popularbackground addSubview:Popularsidescroll];

         
         UIImageView *popularbase=[[UIImageView alloc]initWithFrame:CGRectMake(20,0,514-220,800)];
         popularbase.image=[UIImage imageNamed:@"popularbg"];
         [Popularsidescroll addSubview:popularbase];
         
         UIImageView *popularbase2=[[UIImageView alloc]initWithFrame:CGRectMake(454,0,514-220,800)];
         popularbase2.image=[UIImage imageNamed:@"popularbg"];
         [Popularsidescroll addSubview:popularbase2];
         
         UIImageView *popularbase3=[[UIImageView alloc]initWithFrame:CGRectMake(889,0,514-220,800)];
         popularbase3.image=[UIImage imageNamed:@"popularbg"];
         [Popularsidescroll addSubview:popularbase3];

         
         
         UIButton *week=[[UIButton alloc]initWithFrame:CGRectMake(25-8,80,70,25)];
         [week setTitle:@"Week" forState:UIControlStateNormal];
         [week setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
         [week setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
         [week setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
         week.backgroundColor=[UIColor clearColor];
         week.tag=11;
         week.titleLabel.font=[UIFont fontWithName:@"Helvetica" size:19];
         // [week addTarget:self action:@selector() forControlEvents:UIControlEventTouchUpInside];
         [popularbackground addSubview:week];
         
         
         UIButton *month=[[UIButton alloc]initWithFrame:CGRectMake(150-28,80,70,25)];
         [month setTitle:@"Month" forState:UIControlStateNormal];
         [month setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
         [month setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
         [month setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
         month.backgroundColor=[UIColor clearColor];
         month.tag=22;
         month.titleLabel.font=[UIFont fontWithName:@"Helvetica" size:19];
         // [month addTarget:self action:@selector() forControlEvents:UIControlEventTouchUpInside];
         [popularbackground addSubview:month];
         
         
         UIButton *alltime=[[UIButton alloc]initWithFrame:CGRectMake(275-42,80,70,25)];
         [alltime setTitle:@"All time" forState:UIControlStateNormal];
         [alltime setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
         [alltime setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
         [alltime setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
         alltime.backgroundColor=[UIColor clearColor];
         alltime.tag=33;
         alltime.titleLabel.font=[UIFont fontWithName:@"Helvetica" size:19];
         // [alltime addTarget:self action:@selector() forControlEvents:UIControlEventTouchUpInside];
         [popularbackground addSubview:alltime];
         
         UIImageView *pinline1=[[UIImageView alloc]initWithFrame:CGRectMake(6,120,popularbackground.frame.size.width-12,2)];
         pinline1.image=[UIImage imageNamed:@"lineimg2"];
         [popularbackground addSubview:pinline1];
         
         blackline=[[UIView alloc]initWithFrame:CGRectMake(10,120,90,2)];
         blackline.backgroundColor=[UIColor blackColor];
         [popularbackground addSubview:blackline];
         
         UIImageView *logobackground=[[UIImageView alloc]initWithFrame:CGRectMake(4,0,481-198,297-90)];
         logobackground.image=[UIImage imageNamed:@"logobackground"];
         [popularbase addSubview:logobackground];
         
         UIImageView *logobackground2=[[UIImageView alloc]initWithFrame:CGRectMake(4,0,481-198,297-90)];
         logobackground2.image=[UIImage imageNamed:@"logobackground"];
         [popularbase2 addSubview:logobackground2];
         
         UIImageView *logobackground3=[[UIImageView alloc]initWithFrame:CGRectMake(4,0,481-198,297-90)];
         logobackground3.image=[UIImage imageNamed:@"logobackground"];
         [popularbase3 addSubview:logobackground3];
         
         UIImageView *logo21=[[UIImageView alloc]initWithFrame:CGRectMake(15,20,107-15,99-15)];
         logo21.image=[UIImage imageNamed:@"myfeedlogo"];
         [logobackground addSubview:logo21];
         
         UIImageView *logo22=[[UIImageView alloc]initWithFrame:CGRectMake(15,20,107-15,99-15)];
         logo22.image=[UIImage imageNamed:@"myfeedlogo"];
         [logobackground2 addSubview:logo22];
         
         UIImageView *logo23=[[UIImageView alloc]initWithFrame:CGRectMake(15,20,107-15,99-15)];
         logo23.image=[UIImage imageNamed:@"myfeedlogo"];
         [logobackground3 addSubview:logo23];
         
         
         UILabel *populartitle=[[UILabel alloc]initWithFrame:CGRectMake(108, 5, backgroundimage.frame.size.width-190,60)];
         populartitle.text=@"KFC restaurtent";
         populartitle.textColor=[UIColor whiteColor];
         populartitle.textAlignment=NSTextAlignmentCenter;
         populartitle.font=[UIFont fontWithName:@"Helvetica" size:16];
         [logobackground addSubview:populartitle];
         
         
         UIImageView *pinicon2=[[UIImageView alloc]initWithFrame:CGRectMake(240,15,27,27)];
         pinicon2.image=[UIImage imageNamed:@"whitepin"];
         [logobackground addSubview:pinicon2];
         
         
         UIImageView *popularlocator=[[UIImageView alloc]initWithFrame:CGRectMake(122,56,25-7, 31-7)];
         popularlocator.image=[UIImage imageNamed:@"nearicon2"];
         [logobackground addSubview:popularlocator];
         
         
         UILabel *popularlocation=[[UILabel alloc]initWithFrame:CGRectMake(126,52, backgroundimage.frame.size.width-190,30)];
         popularlocation.text=@"kolkata , india";
         popularlocation.textColor=[UIColor lightGrayColor];
         popularlocation.textAlignment=NSTextAlignmentCenter;
         popularlocation.font=[UIFont fontWithName:@"Helvetica" size:15];
         [logobackground addSubview:popularlocation];
         
         
         UIImageView *popularstar1=[[UIImageView alloc]initWithFrame:CGRectMake(65-10,128,49-15,44-15)];
         popularstar1.image=[UIImage imageNamed:@"staron"];
         [logobackground addSubview:popularstar1];
         
         UIImageView *popularstar2=[[UIImageView alloc]initWithFrame:CGRectMake(110-10,128,49-15,44-15)];
         popularstar2.image=[UIImage imageNamed:@"staron"];
         [logobackground addSubview:popularstar2];
         
         UIImageView *popularstar3=[[UIImageView alloc]initWithFrame:CGRectMake(155-10,128,49-15,44-15)];
         popularstar3.image=[UIImage imageNamed:@"staron"];
         [logobackground addSubview:popularstar3];
         
         UIImageView *popularstar4=[[UIImageView alloc]initWithFrame:CGRectMake(200-10,128,49-15,44-15)];
         popularstar4.image=[UIImage imageNamed:@"staron"];
         [logobackground addSubview:popularstar4];
         
         UIImageView *popularstar5=[[UIImageView alloc]initWithFrame:CGRectMake(245-10,128,49-15,44-15)];
         popularstar5.image=[UIImage imageNamed:@"staroff"];
         [logobackground addSubview:popularstar5];
         
         
         UILabel *test=[[UILabel alloc]initWithFrame:CGRectMake(25,logobackground.frame.origin.y+210,100,40)];
         test.text=@"Test";
         test.textColor=[UIColor lightGrayColor];
         test.textAlignment=NSTextAlignmentLeft;
         test.font=[UIFont fontWithName:@"Helvetica" size:18];
         [popularbase addSubview:test];
         
         /*----------------- Test star design---------- */
         
         UIImageView *teststar1=[[UIImageView alloc]initWithFrame:CGRectMake(140,logobackground.frame.origin.y+216,33-8,30-8)];
         teststar1.image=[UIImage imageNamed:@"staron2"];
         [popularbase addSubview:teststar1];
         
         teststar1=[[UIImageView alloc]initWithFrame:CGRectMake(170,logobackground.frame.origin.y+216,33-8,30-8)];
         teststar1.image=[UIImage imageNamed:@"staron2"];
         [popularbase addSubview:teststar1];
         
         teststar1=[[UIImageView alloc]initWithFrame:CGRectMake(200,logobackground.frame.origin.y+216,33-8,30-8)];
         teststar1.image=[UIImage imageNamed:@"staron2"];
         [popularbase addSubview:teststar1];
         
         teststar1=[[UIImageView alloc]initWithFrame:CGRectMake(230,logobackground.frame.origin.y+216,33-8,30-8)];
         teststar1.image=[UIImage imageNamed:@"staron2"];
         [popularbase addSubview:teststar1];
         
         teststar1=[[UIImageView alloc]initWithFrame:CGRectMake(260,logobackground.frame.origin.y+216,33-8,30-8)];
         teststar1.image=[UIImage imageNamed:@"staroff2"];
         [popularbase addSubview:teststar1];
         
         
         ////-----------------------------------------//////
         
         UIImageView *devider=[[UIImageView alloc]initWithFrame:CGRectMake(6,test.frame.origin.y+40,popularbase.frame.size.width-10,2)];
         devider.image=[UIImage imageNamed:@"lineimg"];
         [popularbase addSubview:devider];
         
         UILabel *Service=[[UILabel alloc]initWithFrame:CGRectMake(25,test.frame.origin.y+45,100,40)];
         Service.text=@"Service";
         Service.textColor=[UIColor lightGrayColor];
         Service.textAlignment=NSTextAlignmentLeft;
         Service.font=[UIFont fontWithName:@"Helvetica" size:18];
         [popularbase addSubview:Service];
         
         /*----------------- Service star design----------------- */
         
         UIImageView *servicestar1=[[UIImageView alloc]initWithFrame:CGRectMake(140,test.frame.origin.y+49,33-8,30-8)];
         servicestar1.image=[UIImage imageNamed:@"staron2"];
         [popularbase addSubview:servicestar1];
         
         servicestar1=[[UIImageView alloc]initWithFrame:CGRectMake(170,test.frame.origin.y+49,33-8,30-8)];
         servicestar1.image=[UIImage imageNamed:@"staron2"];
         [popularbase addSubview:servicestar1];
         
         servicestar1=[[UIImageView alloc]initWithFrame:CGRectMake(200,test.frame.origin.y+49,33-8,30-8)];
         servicestar1.image=[UIImage imageNamed:@"staron2"];
         [popularbase addSubview:servicestar1];
         
         servicestar1=[[UIImageView alloc]initWithFrame:CGRectMake(230,test.frame.origin.y+49,33-8,30-8)];
         servicestar1.image=[UIImage imageNamed:@"staroff2"];
         [popularbase addSubview:servicestar1];
         
         servicestar1=[[UIImageView alloc]initWithFrame:CGRectMake(260,test.frame.origin.y+49,33-8,30-8)];
         servicestar1.image=[UIImage imageNamed:@"staroff2"];
         [popularbase addSubview:servicestar1];
         
         /////---------------------------------------------------/////
         
         UIImageView *devider2=[[UIImageView alloc]initWithFrame:CGRectMake(6,Service.frame.origin.y+40,popularbase.frame.size.width-10,2)];
         devider2.image=[UIImage imageNamed:@"lineimg"];
         [popularbase addSubview:devider2];
         
         
         UILabel *Presentation=[[UILabel alloc]initWithFrame:CGRectMake(25,Service.frame.origin.y+45,110,40)];
         Presentation.text=@"Presentation";
         Presentation.textColor=[UIColor lightGrayColor];
         Presentation.textAlignment=NSTextAlignmentLeft;
         Presentation.font=[UIFont fontWithName:@"Helvetica" size:18];
         [popularbase addSubview:Presentation];
         
         /*----------------- Presentation star design----------------- */
         
         UIImageView *presentationstar1=[[UIImageView alloc]initWithFrame:CGRectMake(140,Service.frame.origin.y+49,33-8,30-8)];
         presentationstar1.image=[UIImage imageNamed:@"staron2"];
         [popularbase addSubview:presentationstar1];
         
         presentationstar1=[[UIImageView alloc]initWithFrame:CGRectMake(170,Service.frame.origin.y+49,33-8,30-8)];
         presentationstar1.image=[UIImage imageNamed:@"staron2"];
         [popularbase addSubview:presentationstar1];
         
         presentationstar1=[[UIImageView alloc]initWithFrame:CGRectMake(200,Service.frame.origin.y+49,33-8,30-8)];
         presentationstar1.image=[UIImage imageNamed:@"staron2"];
         [popularbase addSubview:presentationstar1];
         
         presentationstar1=[[UIImageView alloc]initWithFrame:CGRectMake(230,Service.frame.origin.y+49,33-8,30-8)];
         presentationstar1.image=[UIImage imageNamed:@"staron2"];
         [popularbase addSubview:presentationstar1];
         
         presentationstar1=[[UIImageView alloc]initWithFrame:CGRectMake(260,Service.frame.origin.y+49,33-8,30-8)];
         presentationstar1.image=[UIImage imageNamed:@"staron2"];
         [popularbase addSubview:presentationstar1];
         
         
         ///////////----------------------------------------///////////
         
         UIImageView *devider3=[[UIImageView alloc]initWithFrame:CGRectMake(6,Presentation.frame.origin.y+40,popularbase.frame.size.width-10,2)];
         devider3.image=[UIImage imageNamed:@"lineimg"];
         [popularbase addSubview:devider3];
         
         UILabel *Atmosphere=[[UILabel alloc]initWithFrame:CGRectMake(25,Presentation.frame.origin.y+45,110,40)];
         Atmosphere.text=@"Atmosphere";
         Atmosphere.textColor=[UIColor lightGrayColor];
         Atmosphere.textAlignment=NSTextAlignmentLeft;
         Atmosphere.font=[UIFont fontWithName:@"Helvetica" size:18];
         [popularbase addSubview:Atmosphere];
         
         /*----------------- Atmos star design----------------- */
         
         UIImageView *atmosstar1=[[UIImageView alloc]initWithFrame:CGRectMake(140,Presentation.frame.origin.y+49,33-8,30-8)];
         atmosstar1.image=[UIImage imageNamed:@"staron2"];
         [popularbase addSubview:atmosstar1];
         
         atmosstar1=[[UIImageView alloc]initWithFrame:CGRectMake(170,Presentation.frame.origin.y+49,33-8,30-8)];
         atmosstar1.image=[UIImage imageNamed:@"staron2"];
         [popularbase addSubview:atmosstar1];
         
         atmosstar1=[[UIImageView alloc]initWithFrame:CGRectMake(200,Presentation.frame.origin.y+49,33-8,30-8)];
         atmosstar1.image=[UIImage imageNamed:@"staron2"];
         [popularbase addSubview:atmosstar1];
         
         atmosstar1=[[UIImageView alloc]initWithFrame:CGRectMake(230,Presentation.frame.origin.y+49,33-8,30-8)];
         atmosstar1.image=[UIImage imageNamed:@"staron2"];
         [popularbase addSubview:atmosstar1];
         
         atmosstar1=[[UIImageView alloc]initWithFrame:CGRectMake(260,Presentation.frame.origin.y+49,33-8,30-8)];
         atmosstar1.image=[UIImage imageNamed:@"staroff2"];
         [popularbase addSubview:atmosstar1];
         
         ///////////----------------------------------------///////////
         
         UIImageView *devider4=[[UIImageView alloc]initWithFrame:CGRectMake(6,Atmosphere.frame.origin.y+40,popularbase.frame.size.width-10,2)];
         devider4.image=[UIImage imageNamed:@"lineimg"];
         [popularbase addSubview:devider4];
         
         UILabel *populardetails=[[UILabel alloc]initWithFrame:CGRectMake(6,devider4.frame.origin.y+5,popularbase.frame.size.width-10, 100)];
         populardetails.backgroundColor=[[UIColor lightGrayColor]colorWithAlphaComponent:.2];
         populardetails.text=@"ios is a long established fact that a reader will be distracted by the readable content of a page when looking at";
         populardetails.font=[UIFont fontWithName:@"Helvetica" size:17];
         populardetails.textColor=[UIColor grayColor];
         populardetails.numberOfLines=3;
         populardetails.textAlignment=NSTextAlignmentLeft;
         [popularbase addSubview:populardetails];
         
         
         UIImageView *popularfolbl=[[UIImageView alloc]initWithFrame:CGRectMake(8,430,496-178,60)];
         popularfolbl.backgroundColor=[UIColor clearColor];
         [popularbase addSubview:popularfolbl];
         
         UILabel *populartag=[[UILabel alloc]initWithFrame:CGRectMake(2,75,99,40)];
         populartag.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"tagimg3"]];
         populartag.text=@"# food";
         populartag.textColor=[UIColor lightGrayColor];
         populartag.textAlignment=NSTextAlignmentCenter;
         populartag.font=[UIFont fontWithName:@"Helvetica" size:19];
         [popularfolbl addSubview:populartag];
         
         UILabel *populartag1=[[UILabel alloc]initWithFrame:CGRectMake(105,75,99,40)];
         populartag1.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"tagimg3"]];
         populartag1.text=@"# restaurant";
         populartag1.textColor=[UIColor lightGrayColor];
         populartag1.textAlignment=NSTextAlignmentCenter;
         populartag1.font=[UIFont fontWithName:@"Helvetica" size:15];
         [popularfolbl addSubview:populartag1];
         
         UILabel *populartag4=[[UILabel alloc]initWithFrame:CGRectMake(205,75,77,40)];
         populartag4.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"tagimg3"]];
         populartag4.text=@"# hot";
         populartag4.textColor=[UIColor lightGrayColor];
         populartag4.textAlignment=NSTextAlignmentCenter;
         populartag4.font=[UIFont fontWithName:@"Helvetica" size:19];
         [popularfolbl addSubview:populartag4];
         
         UILabel *populartag2=[[UILabel alloc]initWithFrame:CGRectMake(0,75+50,153,40)];
         populartag2.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"tagimg2"]];
         populartag2.text=@"# chicken";
         populartag2.textColor=[UIColor lightGrayColor];
         populartag2.textAlignment=NSTextAlignmentCenter;
         populartag2.font=[UIFont fontWithName:@"Helvetica" size:19];
         [popularfolbl addSubview:populartag2];
         
         UILabel *populartag3=[[UILabel alloc]initWithFrame:CGRectMake(155,75+50,124,40)];
         populartag3.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"tagimg"]];
         populartag3.text=@"# hangout";
         populartag3.textColor=[UIColor lightGrayColor];
         populartag3.textAlignment=NSTextAlignmentCenter;
         populartag3.font=[UIFont fontWithName:@"Helvetica" size:19];
         [popularfolbl addSubview:populartag3];
         
         
         
         /* -------------- Popular Comment Table ------------------ */
         
         popularbase.userInteractionEnabled=YES;
         popularbackground.userInteractionEnabled=YES;
         
         popularcommenttable=[[UITableView alloc]initWithFrame:CGRectMake(9,610, popularbackground.frame.size.width-36,170)];
         popularcommenttable.backgroundColor=[UIColor clearColor];
         popularcommenttable.dataSource=self;
         popularcommenttable.delegate=self;
         popularcommenttable.separatorStyle=NO;
         popularcommenttable.userInteractionEnabled=YES;
         popularcommenttable.tag=1;
         [popularbase addSubview:popularcommenttable];

         
         /////////////////////////////////////////////////////////////////////////
         
         /* -------------- Top Users Table ------------------ */
         
         topuserview.userInteractionEnabled=YES;
         
         topusertable=[[UITableView alloc]initWithFrame:CGRectMake(12, 70, topuserview.frame.size.width-10,400)];
         topusertable.backgroundColor=[UIColor clearColor];
         topusertable.dataSource=self;
         topusertable.delegate=self;
         topusertable.separatorStyle=NO;
         topusertable.userInteractionEnabled=YES;
         topusertable.tag=2;
         [topuserbackground addSubview:topusertable];
         
         /////////////////////////////////////////////////
         
         
         /*--------------- My Pin Design ------------------*/
         
         
         UIImageView *mypinbase=[[UIImageView alloc]initWithFrame:CGRectMake(10,85,514-220,700)];
         mypinbase.image=[UIImage imageNamed:@"popularbg"];
         mypinbase.userInteractionEnabled=YES;
         [mypinbackground addSubview:mypinbase];
         
         UIImageView *logo1=[[UIImageView alloc]initWithFrame:CGRectMake(15,20,107-15,99-15)];
         logo1.image=[UIImage imageNamed:@"myfeedlogo"];
         [mypinbase addSubview:logo1];
         
         UILabel *mypintitle=[[UILabel alloc]initWithFrame:CGRectMake(107, 5, backgroundimage.frame.size.width-190,60)];
         mypintitle.text=@"KFC restaurtent";
         mypintitle.textColor=[UIColor colorWithRed:(230.0f/255.0f) green:(64.0f/255.0f) blue:(73.0f/255.0f) alpha:1];
         mypintitle.textAlignment=NSTextAlignmentCenter;
         mypintitle.font=[UIFont fontWithName:@"Helvetica" size:17];
         [mypinbase addSubview:mypintitle];
         
         
         UIImageView *pinicon1=[[UIImageView alloc]initWithFrame:CGRectMake(257,15,27,27)];
         pinicon1.image=[UIImage imageNamed:@"pinicon"];
         [mypinbase addSubview:pinicon1];
         
         
         UIImageView *mypinlocator=[[UIImageView alloc]initWithFrame:CGRectMake(116,56,25-7, 31-7)];
         mypinlocator.image=[UIImage imageNamed:@"nearicon"];
         [mypinbase addSubview:mypinlocator];
         
         
         UILabel *mypinlocation=[[UILabel alloc]initWithFrame:CGRectMake(130,52, backgroundimage.frame.size.width-190,30)];
         mypinlocation.text=@"kolkata , india";
         mypinlocation.textColor=[UIColor grayColor];
         mypinlocation.textAlignment=NSTextAlignmentCenter;
         mypinlocation.font=[UIFont fontWithName:@"Helvetica" size:15];
         [mypinbase addSubview:mypinlocation];
         
         UIImageView *pinline=[[UIImageView alloc]initWithFrame:CGRectMake(6,120,mypinbase.frame.size.width-10,2)];
         pinline.image=[UIImage imageNamed:@"lineimg"];
         [mypinbase addSubview:pinline];
         
         UILabel *pindetails1=[[UILabel alloc]initWithFrame:CGRectMake(6,110,mypinbase.frame.size.width-10, 150)];
         pindetails1.backgroundColor=[UIColor clearColor];
         pindetails1.text=@"ios is a long established fact that a reader will be distracted by the readable content of a page when looking at";
         pindetails1.font=[UIFont fontWithName:@"Helvetica" size:17];
         pindetails1.textColor=[UIColor grayColor];
         pindetails1.numberOfLines=3;
         pindetails1.textAlignment=NSTextAlignmentLeft;
         [mypinbase addSubview:pindetails1];
         
         
         UILabel *pindetails=[[UILabel alloc]initWithFrame:CGRectMake(6,240,mypinbase.frame.size.width-10, 150)];
         pindetails.backgroundColor=[[UIColor lightGrayColor]colorWithAlphaComponent:.2];
         pindetails.text=@"is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";
         pindetails.font=[UIFont fontWithName:@"Helvetica" size:17];
         pindetails.textColor=[UIColor grayColor];
         pindetails.numberOfLines=6;
         pindetails.textAlignment=NSTextAlignmentLeft;
         [mypinbase addSubview:pindetails];
         
         
         UIImageView *mypinfolbl=[[UIImageView alloc]initWithFrame:CGRectMake(0,330,496-178,60)];
         mypinfolbl.backgroundColor=[UIColor clearColor];
         mypinfolbl.userInteractionEnabled=YES;
         [mypinbase addSubview:mypinfolbl];
         
         UILabel *pintag=[[UILabel alloc]initWithFrame:CGRectMake(10,75,99,40)];
         pintag.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"tagimg3"]];
         pintag.text=@"# food";
         pintag.textColor=[UIColor lightGrayColor];
         pintag.textAlignment=NSTextAlignmentCenter;
         pintag.font=[UIFont fontWithName:@"Helvetica" size:19];
         [mypinfolbl addSubview:pintag];
         
         UILabel *pintag1=[[UILabel alloc]initWithFrame:CGRectMake(115,75,99,40)];
         pintag1.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"tagimg3"]];
         pintag1.text=@"# restaurant";
         pintag1.textColor=[UIColor lightGrayColor];
         pintag1.textAlignment=NSTextAlignmentCenter;
         pintag1.font=[UIFont fontWithName:@"Helvetica" size:15];
         [mypinfolbl addSubview:pintag1];
         
         UILabel *pintag4=[[UILabel alloc]initWithFrame:CGRectMake(220,75,70,40)];
         pintag4.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"tagimg3"]];
         pintag4.text=@"# hot";
         pintag4.textColor=[UIColor lightGrayColor];
         pintag4.textAlignment=NSTextAlignmentCenter;
         pintag4.font=[UIFont fontWithName:@"Helvetica" size:19];
         [mypinfolbl addSubview:pintag4];
         
         UILabel *pintag2=[[UILabel alloc]initWithFrame:CGRectMake(10,75+50,153,40)];
         pintag2.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"tagimg2"]];
         pintag2.text=@"# chicken";
         pintag2.textColor=[UIColor lightGrayColor];
         pintag2.textAlignment=NSTextAlignmentCenter;
         pintag2.font=[UIFont fontWithName:@"Helvetica" size:19];
         [mypinfolbl addSubview:pintag2];
         
         UILabel *pintag3=[[UILabel alloc]initWithFrame:CGRectMake(162,75+50,124,40)];
         pintag3.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"tagimg"]];
         pintag3.text=@"# hangout";
         pintag3.textColor=[UIColor lightGrayColor];
         pintag3.textAlignment=NSTextAlignmentCenter;
         pintag3.font=[UIFont fontWithName:@"Helvetica" size:19];
         [mypinfolbl addSubview:pintag3];
         
         /*----------------- Pin Section Comment Table Design ---------------------*/
         
         
         UIImageView *pincommentbg=[[UIImageView alloc]initWithFrame:CGRectMake(4,pintag3.frame.origin.y+70,528-220,170)];
         
        // pincommentbg.image=[UIImage imageNamed:@"commentbg"];
         pincommentbg.userInteractionEnabled=YES;
         
         [mypinfolbl addSubview:pincommentbg];
         
         
         mypintable=[[UITableView alloc]initWithFrame:CGRectMake(2,0,pincommentbg.frame.size.width-28,pincommentbg.frame.size.height)style:UITableViewStylePlain];
         
         mypintable.delegate=self;
         
         mypintable.dataSource=self;
         
         mypintable.backgroundColor = [UIColor clearColor];
         
         mypintable.tag = 1;
         
         mypintable.separatorStyle=UITableViewCellSeparatorStyleNone;
         
         mypintable.showsVerticalScrollIndicator = YES;
         
         [pincommentbg addSubview:mypintable];
         
         
         ///////////////////////////////////////////////////////////////////////////////////
         
         
         /*--------------- My Feed Design ------------------*/
         
         
         
         UIImageView *myfeedbase=[[UIImageView alloc]initWithFrame:CGRectMake(5,85,self.view.frame.size.width-20,740)];
         
         myfeedbase.image=[UIImage imageNamed:@"popularbg"];
         
         myfeedbase.userInteractionEnabled=YES;
         
         [myfeedbackground addSubview:myfeedbase];
         
         
         
         UIImageView *logo=[[UIImageView alloc]initWithFrame:CGRectMake(15,20,107-15,99-15)];
         
         logo.image=[UIImage imageNamed:@"myfeedlogo"];
         
         [myfeedbase addSubview:logo];
         
         
         
         UILabel *myfeedtitle=[[UILabel alloc]initWithFrame:CGRectMake(115, 5, backgroundimage.frame.size.width-180,60)];
         
         myfeedtitle.text=@"KFC restaurtent";
         
         myfeedtitle.backgroundColor = [UIColor clearColor];
         
         myfeedtitle.textColor=[UIColor colorWithRed:(230.0f/255.0f) green:(64.0f/255.0f) blue:(73.0f/255.0f) alpha:1];
         
         myfeedtitle.textAlignment=NSTextAlignmentCenter;
         
         myfeedtitle.font=[UIFont fontWithName:@"Helvetica" size:17];
         
         [myfeedbase addSubview:myfeedtitle];
         
         
         
         
         
         UIImageView *pinicon=[[UIImageView alloc]initWithFrame:CGRectMake(260,15,27,27)];
         
         pinicon.image=[UIImage imageNamed:@"pinicon"];
         
         [myfeedbase addSubview:pinicon];
         
         
         
         
         
         UIImageView *myfeedlocator=[[UIImageView alloc]initWithFrame:CGRectMake(122,56,25-7, 31-7)];
         
         myfeedlocator.image=[UIImage imageNamed:@"nearicon"];
         
         [myfeedbase addSubview:myfeedlocator];
         
         
         
         
         
         UILabel *myfeedlocation=[[UILabel alloc]initWithFrame:CGRectMake(130,52, backgroundimage.frame.size.width-190,30)];
         
         myfeedlocation.text=@"kolkata , india";
         
         myfeedlocation.textColor=[UIColor grayColor];
         
         myfeedlocation.textAlignment=NSTextAlignmentCenter;
         
         myfeedlocation.font=[UIFont fontWithName:@"Helvetica" size:17];
         
         [myfeedbase addSubview:myfeedlocation];
         
         
         
         
         
         UIImageView *myfeeddisplayimage=[[UIImageView alloc]initWithFrame:CGRectMake(8,120,self.view.frame.size.width-35,330-100)];
         
         myfeeddisplayimage.image=[UIImage imageNamed:@"myfeeddisplayimage"];
         
         [myfeedbase addSubview:myfeeddisplayimage];
         
         
         
         UIImageView *myfeedinfolbl=[[UIImageView alloc]initWithFrame:CGRectMake(8,350,self.view.frame.size.width-35,60)];
         
         myfeedinfolbl.image=[UIImage imageNamed:@"redlbl"];
         
         [myfeedbase addSubview:myfeedinfolbl];
         
         
         
         UILabel *feeditemname=[[UILabel alloc]initWithFrame:CGRectMake(5,0,140,60)];
         
         feeditemname.text=@"Crispi Chicken";
         
         feeditemname.textColor=[UIColor whiteColor];
         
         feeditemname.textAlignment=NSTextAlignmentCenter;
         
         feeditemname.font=[UIFont fontWithName:@"Helvetica Bold" size:18];
         
         [myfeedinfolbl addSubview:feeditemname];
         
         
         
         
         
         UILabel *feeditemprice=[[UILabel alloc]initWithFrame:CGRectMake(210,0,70,60)];
         
         feeditemprice.text=@"50.00";
         
         feeditemprice.textColor=[UIColor whiteColor];
         
         feeditemprice.textAlignment=NSTextAlignmentCenter;
         
         feeditemprice.font=[UIFont fontWithName:@"Helvetica Bold" size:19];
         
         [myfeedinfolbl addSubview:feeditemprice];
         
         
         
         
         
         UILabel *feedtag=[[UILabel alloc]initWithFrame:CGRectMake(0,75,99,40)];
         
         feedtag.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"tagimg3"]];
         
         feedtag.text=@"# food";
         
         feedtag.textColor=[UIColor lightGrayColor];
         
         feedtag.textAlignment=NSTextAlignmentCenter;
         
         feedtag.font=[UIFont fontWithName:@"Helvetica" size:17];
         
         [myfeedinfolbl addSubview:feedtag];
         
         
         
         UILabel *feedtag1=[[UILabel alloc]initWithFrame:CGRectMake(102,75,99,40)];
         
         feedtag1.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"tagimg3"]];
         
         feedtag1.text=@"# restaurant";
         
         feedtag1.textColor=[UIColor lightGrayColor];
         
         feedtag1.textAlignment=NSTextAlignmentCenter;
         
         feedtag1.font=[UIFont fontWithName:@"Helvetica" size:15];
         
         [myfeedinfolbl addSubview:feedtag1];
         
         
         
         UILabel *feedtag4=[[UILabel alloc]initWithFrame:CGRectMake(203,75,79,40)];
         
         feedtag4.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"tagimg3"]];
         
         feedtag4.text=@"# hot";
         
         feedtag4.textColor=[UIColor lightGrayColor];
         
         feedtag4.textAlignment=NSTextAlignmentCenter;
         
         feedtag4.font=[UIFont fontWithName:@"Helvetica" size:19];
         
         [myfeedinfolbl addSubview:feedtag4];
         
         
         
         UILabel *feedtag2=[[UILabel alloc]initWithFrame:CGRectMake(0,75+50,153,40)];
         
         feedtag2.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"tagimg2"]];
         
         feedtag2.text=@"# chicken";
         
         feedtag2.textColor=[UIColor lightGrayColor];
         
         feedtag2.textAlignment=NSTextAlignmentCenter;
         
         feedtag2.font=[UIFont fontWithName:@"Helvetica" size:19];
         
         [myfeedinfolbl addSubview:feedtag2];
         
         
         
         UILabel *feedtag3=[[UILabel alloc]initWithFrame:CGRectMake(159,75+50,124,40)];
         
         feedtag3.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"tagimg"]];
         
         feedtag3.text=@"# hangout";
         
         feedtag3.textColor=[UIColor lightGrayColor];
         
         feedtag3.textAlignment=NSTextAlignmentCenter;
         
         feedtag3.font=[UIFont fontWithName:@"Helvetica" size:19];
         
         [myfeedinfolbl addSubview:feedtag3];
         
         
         
         /*----------------- Feed Section Comment Design ---------------------*/
         
         
         
         UIImageView *feedcommentbg=[[UIImageView alloc]initWithFrame:CGRectMake(0,feedtag3.frame.origin.y+70,self.view.frame.size.width-20,170)];
         
         
         
         feedcommentbg.image=[UIImage imageNamed:@"commentbg"];
         
         feedcommentbg.userInteractionEnabled=YES;
         
         
         
         [myfeedinfolbl addSubview:feedcommentbg];
         
         
         
         
         
         
         
         /* Food section comment list   */
         
         
         
         
         
         
         
         
         
         
         
         //Food table view......
         
         
         
         
         
         
         
         Feedlist_View=[[UITableView alloc]initWithFrame:CGRectMake(myfeedbase.frame.origin.x+3,myfeedbase.frame.origin.y+460,myfeedbase.frame.size.width-25,feedcommentbg.frame.size.height)style:UITableViewStylePlain];
         
         
         
         Feedlist_View.delegate=self;
         
         
         
         Feedlist_View.dataSource=self;
         
         
         
         Feedlist_View.backgroundColor = [UIColor clearColor];
         
         
         
         Feedlist_View.tag = 1;
         
         
         
         Feedlist_View.separatorStyle=UITableViewCellSeparatorStyleNone;
         
         
         
         Feedlist_View.showsVerticalScrollIndicator = NO;
         
         
         
         [myfeedbase addSubview:Feedlist_View];
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
        

    
    downarrow=[[UIImageView alloc]initWithFrame:CGRectMake(Backgroundview.frame.origin.x+170,backgroundimage.frame.size.height,42-5,53)];
    downarrow.image=[UIImage imageNamed:@"downarrow"];
    [Backgroundscroll addSubview:downarrow];
        
      /* ------------------ iphone 6 --------------------- */
        
        
        statictbutton=[[UIButton alloc]initWithFrame:CGRectMake(7, downarrow.frame.origin.y+70,562-200,100-35)];
        [statictbutton setImage:[UIImage imageNamed:@"statictbtn"] forState:UIControlStateNormal];
        [Backgroundscroll addSubview:statictbutton];
        
        
        popularbackground=[[UIImageView alloc]initWithFrame:CGRectMake(6, statictbutton.frame.origin.y+85,514-150,1035)];
        popularbackground.image=[UIImage imageNamed:@"popularbg"];
        [Backgroundscroll addSubview:popularbackground];
        
        popularview=[[UIImageView alloc]initWithFrame:CGRectMake(7, 0,popularbackground.frame.size.width-14,102)];
        popularview.image=[UIImage imageNamed:@"popularheader"];
        [popularbackground addSubview:popularview];
        
        popularheader=[[UILabel alloc]initWithFrame:CGRectMake(20, 5, backgroundimage.frame.size.width-120,60)];
        popularheader.text=@"Popular Restaurant";
        popularheader.textColor=[UIColor colorWithRed:(230.0f/255.0f) green:(64.0f/255.0f) blue:(73.0f/255.0f) alpha:1];
        popularheader.textAlignment=NSTextAlignmentCenter;
        popularheader.font=[UIFont fontWithName:@"Helvetica" size:22];
        [popularview addSubview:popularheader];
        
        popularicon=[[UIImageView alloc]initWithFrame:CGRectMake(7,23,32-5,28-5)];
        popularicon.image=[UIImage imageNamed:@"popularicon"];
        [popularview addSubview:popularicon];
        
        uparrow=[[UIImageView alloc]initWithFrame:CGRectMake(305,15,34,34)];
        uparrow.image=[UIImage imageNamed:@"uparrow"];
        [popularview addSubview:uparrow];
        
    popularbutton=[[UIButton alloc]initWithFrame:CGRectMake(7, popularbackground.frame.origin.y+1055,562-200,100-35)];
        [popularbutton setImage:[UIImage imageNamed:@"populardeals"] forState:UIControlStateNormal];
        [Backgroundscroll addSubview:popularbutton];
        
        /*--------------- Popular Design ------------------*/
        popularbackground.userInteractionEnabled=YES;
        
     Popularsidescroll=[[UIScrollView alloc]initWithFrame:CGRectMake(-10,160,514-80,800)];
        Popularsidescroll.backgroundColor=[UIColor clearColor];
        Popularsidescroll.scrollEnabled=YES;
        Popularsidescroll.pagingEnabled=YES;
        Popularsidescroll.showsHorizontalScrollIndicator=NO;
        Popularsidescroll.delegate=self;
        [Popularsidescroll setContentSize:CGSizeMake(1400,800)];
        [popularbackground addSubview:Popularsidescroll];

        
        UIImageView *popularbase=[[UIImageView alloc]initWithFrame:CGRectMake(26,0,514-180,800)];
        popularbase.image=[UIImage imageNamed:@"popularbg"];
        [Popularsidescroll addSubview:popularbase];
        
        UIImageView *popularbase2=[[UIImageView alloc]initWithFrame:CGRectMake(460,0,514-180,800)];
        popularbase2.image=[UIImage imageNamed:@"popularbg"];
        [Popularsidescroll addSubview:popularbase2];
        
        UIImageView *popularbase3=[[UIImageView alloc]initWithFrame:CGRectMake(894,0,514-180,800)];
        popularbase3.image=[UIImage imageNamed:@"popularbg"];
        [Popularsidescroll addSubview:popularbase3];

        
     UIButton *week=[[UIButton alloc]initWithFrame:CGRectMake(25-8,80,70,25)];
        [week setTitle:@"Week" forState:UIControlStateNormal];
        [week setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [week setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
        [week setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        week.backgroundColor=[UIColor clearColor];
        week.tag=11;
        week.titleLabel.font=[UIFont fontWithName:@"Helvetica" size:21];
       // [week addTarget:self action:@selector() forControlEvents:UIControlEventTouchUpInside];
        [popularbackground addSubview:week];
        
        
        UIButton *month=[[UIButton alloc]initWithFrame:CGRectMake(150-8,80,70,25)];
        [month setTitle:@"Month" forState:UIControlStateNormal];
        [month setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [month setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
        [month setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        month.backgroundColor=[UIColor clearColor];
        month.tag=22;
        month.titleLabel.font=[UIFont fontWithName:@"Helvetica" size:21];
        // [month addTarget:self action:@selector() forControlEvents:UIControlEventTouchUpInside];
        [popularbackground addSubview:month];
        
        
        UIButton *alltime=[[UIButton alloc]initWithFrame:CGRectMake(275-8,80,70,25)];
        [alltime setTitle:@"All time" forState:UIControlStateNormal];
        [alltime setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [alltime setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
        [alltime setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        alltime.backgroundColor=[UIColor clearColor];
        alltime.tag=33;
        alltime.titleLabel.font=[UIFont fontWithName:@"Helvetica" size:21];
        // [alltime addTarget:self action:@selector() forControlEvents:UIControlEventTouchUpInside];
        [popularbackground addSubview:alltime];

        UIImageView *pinline1=[[UIImageView alloc]initWithFrame:CGRectMake(6,120,popularbackground.frame.size.width-12,2)];
        pinline1.image=[UIImage imageNamed:@"lineimg2"];
        [popularbackground addSubview:pinline1];
        
        blackline=[[UIView alloc]initWithFrame:CGRectMake(10,120,100,2)];
        blackline.backgroundColor=[UIColor blackColor];
        [popularbackground addSubview:blackline];
        
        UIImageView *logobackground=[[UIImageView alloc]initWithFrame:CGRectMake(6,0,481-160,297-90)];
        logobackground.image=[UIImage imageNamed:@"logobackground"];
        [popularbase addSubview:logobackground];
        
        UIImageView *logobackground2=[[UIImageView alloc]initWithFrame:CGRectMake(6,0,481-160,297-90)];
        logobackground2.image=[UIImage imageNamed:@"logobackground"];
        [popularbase2 addSubview:logobackground2];
        
        UIImageView *logobackground3=[[UIImageView alloc]initWithFrame:CGRectMake(6,0,481-160,297-90)];
        logobackground3.image=[UIImage imageNamed:@"logobackground"];
        [popularbase3 addSubview:logobackground3];
        
        
        UIImageView *logo21=[[UIImageView alloc]initWithFrame:CGRectMake(15,20,107-15,99-15)];
        logo21.image=[UIImage imageNamed:@"myfeedlogo"];
        [logobackground addSubview:logo21];
        
        UIImageView *logo22=[[UIImageView alloc]initWithFrame:CGRectMake(15,20,107-15,99-15)];
        logo22.image=[UIImage imageNamed:@"myfeedlogo"];
        [logobackground2 addSubview:logo22];
        
        UIImageView *logo23=[[UIImageView alloc]initWithFrame:CGRectMake(15,20,107-15,99-15)];
        logo23.image=[UIImage imageNamed:@"myfeedlogo"];
        [logobackground3 addSubview:logo23];
        
        UILabel *populartitle=[[UILabel alloc]initWithFrame:CGRectMake(100, 5, backgroundimage.frame.size.width-190,60)];
        populartitle.text=@"KFC restaurtent";
        populartitle.textColor=[UIColor whiteColor];
        populartitle.textAlignment=NSTextAlignmentCenter;
        populartitle.font=[UIFont fontWithName:@"Helvetica" size:19];
        [logobackground addSubview:populartitle];
        
        
        UIImageView *pinicon2=[[UIImageView alloc]initWithFrame:CGRectMake(285,15,27,27)];
        pinicon2.image=[UIImage imageNamed:@"whitepin"];
        [logobackground addSubview:pinicon2];
        
        
        UIImageView *popularlocator=[[UIImageView alloc]initWithFrame:CGRectMake(122,56,25-7, 31-7)];
        popularlocator.image=[UIImage imageNamed:@"nearicon2"];
        [logobackground addSubview:popularlocator];
        
        
    UILabel *popularlocation=[[UILabel alloc]initWithFrame:CGRectMake(110,52, backgroundimage.frame.size.width-190,30)];
        popularlocation.text=@"kolkata , india";
        popularlocation.textColor=[UIColor lightGrayColor];
        popularlocation.textAlignment=NSTextAlignmentCenter;
        popularlocation.font=[UIFont fontWithName:@"Helvetica" size:17];
        [logobackground addSubview:popularlocation];
        

    UIImageView *popularstar1=[[UIImageView alloc]initWithFrame:CGRectMake(65,128,49-15,44-15)];
        popularstar1.image=[UIImage imageNamed:@"staron"];
        [logobackground addSubview:popularstar1];
        
        UIImageView *popularstar2=[[UIImageView alloc]initWithFrame:CGRectMake(110,128,49-15,44-15)];
        popularstar2.image=[UIImage imageNamed:@"staron"];
        [logobackground addSubview:popularstar2];
        
        UIImageView *popularstar3=[[UIImageView alloc]initWithFrame:CGRectMake(155,128,49-15,44-15)];
        popularstar3.image=[UIImage imageNamed:@"staron"];
        [logobackground addSubview:popularstar3];
        
        UIImageView *popularstar4=[[UIImageView alloc]initWithFrame:CGRectMake(200,128,49-15,44-15)];
        popularstar4.image=[UIImage imageNamed:@"staron"];
        [logobackground addSubview:popularstar4];
        
        UIImageView *popularstar5=[[UIImageView alloc]initWithFrame:CGRectMake(245,128,49-15,44-15)];
        popularstar5.image=[UIImage imageNamed:@"staroff"];
        [logobackground addSubview:popularstar5];
        
        
        UILabel *test=[[UILabel alloc]initWithFrame:CGRectMake(25,logobackground.frame.origin.y+210,100,40)];
        test.text=@"Test";
        test.textColor=[UIColor lightGrayColor];
        test.textAlignment=NSTextAlignmentLeft;
        test.font=[UIFont fontWithName:@"Helvetica" size:18];
        [popularbase addSubview:test];
        
      /*----------------- Test star design---------- */
        
  UIImageView *teststar1=[[UIImageView alloc]initWithFrame:CGRectMake(150,logobackground.frame.origin.y+216,33-8,30-8)];
        teststar1.image=[UIImage imageNamed:@"staron2"];
        [popularbase addSubview:teststar1];
        
        teststar1=[[UIImageView alloc]initWithFrame:CGRectMake(180,logobackground.frame.origin.y+216,33-8,30-8)];
        teststar1.image=[UIImage imageNamed:@"staron2"];
        [popularbase addSubview:teststar1];
        
        teststar1=[[UIImageView alloc]initWithFrame:CGRectMake(210,logobackground.frame.origin.y+216,33-8,30-8)];
        teststar1.image=[UIImage imageNamed:@"staron2"];
        [popularbase addSubview:teststar1];
        
        teststar1=[[UIImageView alloc]initWithFrame:CGRectMake(240,logobackground.frame.origin.y+216,33-8,30-8)];
        teststar1.image=[UIImage imageNamed:@"staron2"];
        [popularbase addSubview:teststar1];
        
        teststar1=[[UIImageView alloc]initWithFrame:CGRectMake(270,logobackground.frame.origin.y+216,33-8,30-8)];
        teststar1.image=[UIImage imageNamed:@"staroff2"];
        [popularbase addSubview:teststar1];
        
        
     ////-----------------------------------------//////
        
        UIImageView *devider=[[UIImageView alloc]initWithFrame:CGRectMake(6,test.frame.origin.y+40,popularbase.frame.size.width-10,2)];
        devider.image=[UIImage imageNamed:@"lineimg"];
        [popularbase addSubview:devider];
        
        UILabel *Service=[[UILabel alloc]initWithFrame:CGRectMake(25,test.frame.origin.y+45,100,40)];
        Service.text=@"Service";
        Service.textColor=[UIColor lightGrayColor];
        Service.textAlignment=NSTextAlignmentLeft;
        Service.font=[UIFont fontWithName:@"Helvetica" size:18];
        [popularbase addSubview:Service];
        
        /*----------------- Service star design----------------- */
        
UIImageView *servicestar1=[[UIImageView alloc]initWithFrame:CGRectMake(150,test.frame.origin.y+49,33-8,30-8)];
        servicestar1.image=[UIImage imageNamed:@"staron2"];
        [popularbase addSubview:servicestar1];
        
        servicestar1=[[UIImageView alloc]initWithFrame:CGRectMake(180,test.frame.origin.y+49,33-8,30-8)];
        servicestar1.image=[UIImage imageNamed:@"staron2"];
        [popularbase addSubview:servicestar1];
        
        servicestar1=[[UIImageView alloc]initWithFrame:CGRectMake(210,test.frame.origin.y+49,33-8,30-8)];
        servicestar1.image=[UIImage imageNamed:@"staron2"];
        [popularbase addSubview:servicestar1];
        
        servicestar1=[[UIImageView alloc]initWithFrame:CGRectMake(240,test.frame.origin.y+49,33-8,30-8)];
        servicestar1.image=[UIImage imageNamed:@"staroff2"];
        [popularbase addSubview:servicestar1];
        
        servicestar1=[[UIImageView alloc]initWithFrame:CGRectMake(270,test.frame.origin.y+49,33-8,30-8)];
        servicestar1.image=[UIImage imageNamed:@"staroff2"];
        [popularbase addSubview:servicestar1];
        
     /////---------------------------------------------------/////
        
        UIImageView *devider2=[[UIImageView alloc]initWithFrame:CGRectMake(6,Service.frame.origin.y+40,popularbase.frame.size.width-10,2)];
        devider2.image=[UIImage imageNamed:@"lineimg"];
        [popularbase addSubview:devider2];

        
        UILabel *Presentation=[[UILabel alloc]initWithFrame:CGRectMake(25,Service.frame.origin.y+45,110,40)];
        Presentation.text=@"Presentation";
        Presentation.textColor=[UIColor lightGrayColor];
        Presentation.textAlignment=NSTextAlignmentLeft;
        Presentation.font=[UIFont fontWithName:@"Helvetica" size:18];
        [popularbase addSubview:Presentation];
        
        /*----------------- Presentation star design----------------- */
        
UIImageView *presentationstar1=[[UIImageView alloc]initWithFrame:CGRectMake(150,Service.frame.origin.y+49,33-8,30-8)];
        presentationstar1.image=[UIImage imageNamed:@"staron2"];
        [popularbase addSubview:presentationstar1];
        
        presentationstar1=[[UIImageView alloc]initWithFrame:CGRectMake(180,Service.frame.origin.y+49,33-8,30-8)];
        presentationstar1.image=[UIImage imageNamed:@"staron2"];
        [popularbase addSubview:presentationstar1];
        
        presentationstar1=[[UIImageView alloc]initWithFrame:CGRectMake(210,Service.frame.origin.y+49,33-8,30-8)];
        presentationstar1.image=[UIImage imageNamed:@"staron2"];
        [popularbase addSubview:presentationstar1];
        
        presentationstar1=[[UIImageView alloc]initWithFrame:CGRectMake(240,Service.frame.origin.y+49,33-8,30-8)];
        presentationstar1.image=[UIImage imageNamed:@"staron2"];
        [popularbase addSubview:presentationstar1];
        
        presentationstar1=[[UIImageView alloc]initWithFrame:CGRectMake(270,Service.frame.origin.y+49,33-8,30-8)];
        presentationstar1.image=[UIImage imageNamed:@"staron2"];
        [popularbase addSubview:presentationstar1];

        
        ///////////----------------------------------------///////////
        
        UIImageView *devider3=[[UIImageView alloc]initWithFrame:CGRectMake(6,Presentation.frame.origin.y+40,popularbase.frame.size.width-10,2)];
        devider3.image=[UIImage imageNamed:@"lineimg"];
        [popularbase addSubview:devider3];
        
        UILabel *Atmosphere=[[UILabel alloc]initWithFrame:CGRectMake(25,Presentation.frame.origin.y+45,110,40)];
        Atmosphere.text=@"Atmosphere";
        Atmosphere.textColor=[UIColor lightGrayColor];
        Atmosphere.textAlignment=NSTextAlignmentLeft;
        Atmosphere.font=[UIFont fontWithName:@"Helvetica" size:18];
        [popularbase addSubview:Atmosphere];
        
         /*----------------- Atmos star design----------------- */
        
UIImageView *atmosstar1=[[UIImageView alloc]initWithFrame:CGRectMake(150,Presentation.frame.origin.y+49,33-8,30-8)];
        atmosstar1.image=[UIImage imageNamed:@"staron2"];
        [popularbase addSubview:atmosstar1];
        
        atmosstar1=[[UIImageView alloc]initWithFrame:CGRectMake(180,Presentation.frame.origin.y+49,33-8,30-8)];
        atmosstar1.image=[UIImage imageNamed:@"staron2"];
        [popularbase addSubview:atmosstar1];
        
        atmosstar1=[[UIImageView alloc]initWithFrame:CGRectMake(210,Presentation.frame.origin.y+49,33-8,30-8)];
        atmosstar1.image=[UIImage imageNamed:@"staron2"];
        [popularbase addSubview:atmosstar1];
        
        atmosstar1=[[UIImageView alloc]initWithFrame:CGRectMake(240,Presentation.frame.origin.y+49,33-8,30-8)];
        atmosstar1.image=[UIImage imageNamed:@"staron2"];
        [popularbase addSubview:atmosstar1];
        
        atmosstar1=[[UIImageView alloc]initWithFrame:CGRectMake(270,Presentation.frame.origin.y+49,33-8,30-8)];
        atmosstar1.image=[UIImage imageNamed:@"staroff2"];
        [popularbase addSubview:atmosstar1];
        
        ///////////----------------------------------------///////////
        
        UIImageView *devider4=[[UIImageView alloc]initWithFrame:CGRectMake(6,Atmosphere.frame.origin.y+40,popularbase.frame.size.width-10,2)];
        devider4.image=[UIImage imageNamed:@"lineimg"];
        [popularbase addSubview:devider4];
        
        UILabel *populardetails=[[UILabel alloc]initWithFrame:CGRectMake(6,devider4.frame.origin.y+5,popularbase.frame.size.width-10, 100)];
        populardetails.backgroundColor=[[UIColor lightGrayColor]colorWithAlphaComponent:.2];
        populardetails.text=@"ios is a long established fact that a reader will be distracted by the readable content of a page when looking at";
        populardetails.font=[UIFont fontWithName:@"Helvetica" size:17];
        populardetails.textColor=[UIColor grayColor];
        populardetails.numberOfLines=3;
        populardetails.textAlignment=NSTextAlignmentLeft;
        [popularbase addSubview:populardetails];

        
        UIImageView *popularfolbl=[[UIImageView alloc]initWithFrame:CGRectMake(8,430,496-178,60)];
        popularfolbl.backgroundColor=[UIColor clearColor];
        [popularbase addSubview:popularfolbl];
        
        UILabel *populartag=[[UILabel alloc]initWithFrame:CGRectMake(10,75,99,40)];
        populartag.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"tagimg3"]];
        populartag.text=@"# food";
        populartag.textColor=[UIColor lightGrayColor];
        populartag.textAlignment=NSTextAlignmentCenter;
        populartag.font=[UIFont fontWithName:@"Helvetica" size:19];
        [popularfolbl addSubview:populartag];
        
        UILabel *populartag1=[[UILabel alloc]initWithFrame:CGRectMake(115,75,99,40)];
        populartag1.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"tagimg3"]];
        populartag1.text=@"# restaurant";
        populartag1.textColor=[UIColor lightGrayColor];
        populartag1.textAlignment=NSTextAlignmentCenter;
        populartag1.font=[UIFont fontWithName:@"Helvetica" size:15];
        [popularfolbl addSubview:populartag1];
        
        UILabel *populartag4=[[UILabel alloc]initWithFrame:CGRectMake(220,75,99,40)];
        populartag4.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"tagimg3"]];
        populartag4.text=@"# hot";
        populartag4.textColor=[UIColor lightGrayColor];
        populartag4.textAlignment=NSTextAlignmentCenter;
        populartag4.font=[UIFont fontWithName:@"Helvetica" size:19];
        [popularfolbl addSubview:populartag4];
        
        UILabel *populartag2=[[UILabel alloc]initWithFrame:CGRectMake(10,75+50,153,40)];
        populartag2.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"tagimg2"]];
        populartag2.text=@"# chicken";
        populartag2.textColor=[UIColor lightGrayColor];
        populartag2.textAlignment=NSTextAlignmentCenter;
        populartag2.font=[UIFont fontWithName:@"Helvetica" size:19];
        [popularfolbl addSubview:populartag2];
        
        UILabel *populartag3=[[UILabel alloc]initWithFrame:CGRectMake(169,75+50,124,40)];
        populartag3.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"tagimg"]];
        populartag3.text=@"# hangout";
        populartag3.textColor=[UIColor lightGrayColor];
        populartag3.textAlignment=NSTextAlignmentCenter;
        populartag3.font=[UIFont fontWithName:@"Helvetica" size:19];
        [popularfolbl addSubview:populartag3];

        
        
        /* -------------- Popular Comment Table ------------------ */
        
        popularbackground.userInteractionEnabled=YES;
        
        popularcommenttable=[[UITableView alloc]initWithFrame:CGRectMake(7,610, popularbackground.frame.size.width-44,170)];
        popularcommenttable.backgroundColor=[UIColor clearColor];
        popularcommenttable.dataSource=self;
        popularcommenttable.delegate=self;
        popularcommenttable.separatorStyle=NO;
        popularcommenttable.userInteractionEnabled=YES;
        popularcommenttable.tag=1;
        [popularbase addSubview:popularcommenttable];

        
        
        /////////////////////////////////////////////////////////////////////////
        topuserbackground=[[UIImageView alloc]initWithFrame:CGRectMake(6, popularbutton.frame.origin.y+100,514-150,500)];
        topuserbackground.image=[UIImage imageNamed:@"popularbg"];
        topuserbackground.userInteractionEnabled=YES;
        [Backgroundscroll addSubview:topuserbackground];
        
        topuserview=[[UIImageView alloc]initWithFrame:CGRectMake(7, 0,topuserbackground.frame.size.width-14,102)];
        topuserview.image=[UIImage imageNamed:@"popularheader"];
        [topuserbackground addSubview:topuserview];

        topuserheader=[[UILabel alloc]initWithFrame:CGRectMake(20, 5, backgroundimage.frame.size.width-190,60)];
        topuserheader.text=@"Top user";
        topuserheader.textColor=[UIColor colorWithRed:(230.0f/255.0f) green:(64.0f/255.0f) blue:(73.0f/255.0f) alpha:1];
        topuserheader.textAlignment=NSTextAlignmentCenter;
        topuserheader.font=[UIFont fontWithName:@"Helvetica" size:22];
        [topuserview addSubview:topuserheader];
        
        uparrow2=[[UIImageView alloc]initWithFrame:CGRectMake(280,15,34,34)];
        uparrow2.image=[UIImage imageNamed:@"uparrow"];
        [topuserheader addSubview:uparrow2];
        
        topusericon=[[UIImageView alloc]initWithFrame:CGRectMake(5,18,25,25)];
        topusericon.image=[UIImage imageNamed:@"topusericon"];
        [topuserheader addSubview:topusericon];
        
    /* -------------- Top Users Table ------------------ */
        
        topuserview.userInteractionEnabled=YES;
        
 topusertable=[[UITableView alloc]initWithFrame:CGRectMake(12, 70, topuserview.frame.size.width-10,400)];
        topusertable.backgroundColor=[UIColor clearColor];
        topusertable.dataSource=self;
        topusertable.delegate=self;
        topusertable.separatorStyle=NO;
        topusertable.userInteractionEnabled=YES;
        topusertable.tag=2;
        [topuserbackground addSubview:topusertable];
        
       /////////////////////////////////////////////////
        
        
    mypinbackground=[[UIImageView alloc]initWithFrame:CGRectMake(6, topuserbackground.frame.origin.y+530,514-150,840)];
        mypinbackground.image=[UIImage imageNamed:@"popularbg"];
        mypinbackground.userInteractionEnabled=YES;
        [Backgroundscroll addSubview:mypinbackground];

        mypinview=[[UIImageView alloc]initWithFrame:CGRectMake(7, 0,mypinbackground.frame.size.width-14,102)];
        mypinview.image=[UIImage imageNamed:@"popularheader"];
        [mypinbackground addSubview:mypinview];
        
        
        mypinheader=[[UILabel alloc]initWithFrame:CGRectMake(20, 5, backgroundimage.frame.size.width-190,60)];
        mypinheader.text=@"My pin";
        mypinheader.textColor=[UIColor colorWithRed:(230.0f/255.0f) green:(64.0f/255.0f) blue:(73.0f/255.0f) alpha:1];
        mypinheader.textAlignment=NSTextAlignmentCenter;
        mypinheader.font=[UIFont fontWithName:@"Helvetica" size:22];
        [mypinview addSubview:mypinheader];
        
        
        uparrow3=[[UIImageView alloc]initWithFrame:CGRectMake(280,15,34,34)];
        uparrow3.image=[UIImage imageNamed:@"uparrow"];
        [mypinheader addSubview:uparrow3];


        mypinicon=[[UIImageView alloc]initWithFrame:CGRectMake(5,18,25,25)];
        mypinicon.image=[UIImage imageNamed:@"mypinicon"];
        [mypinheader addSubview:mypinicon];
        
        /*--------------- My Pin Design ------------------*/
        
        
        UIImageView *mypinbase=[[UIImageView alloc]initWithFrame:CGRectMake(15,85,514-180,700)];
        mypinbase.image=[UIImage imageNamed:@"popularbg"];
        mypinbase.userInteractionEnabled=YES;
        [mypinbackground addSubview:mypinbase];
        
        UIImageView *logo1=[[UIImageView alloc]initWithFrame:CGRectMake(15,20,107-15,99-15)];
        logo1.image=[UIImage imageNamed:@"myfeedlogo"];
        [mypinbase addSubview:logo1];
        
        UILabel *mypintitle=[[UILabel alloc]initWithFrame:CGRectMake(100, 5, backgroundimage.frame.size.width-190,60)];
        mypintitle.text=@"KFC restaurtent";
        mypintitle.textColor=[UIColor colorWithRed:(230.0f/255.0f) green:(64.0f/255.0f) blue:(73.0f/255.0f) alpha:1];
        mypintitle.textAlignment=NSTextAlignmentCenter;
        mypintitle.font=[UIFont fontWithName:@"Helvetica" size:19];
        [mypinbase addSubview:mypintitle];
        
        
        UIImageView *pinicon1=[[UIImageView alloc]initWithFrame:CGRectMake(285,15,27,27)];
        pinicon1.image=[UIImage imageNamed:@"pinicon"];
        [mypinbase addSubview:pinicon1];
        
        
        UIImageView *mypinlocator=[[UIImageView alloc]initWithFrame:CGRectMake(122,56,25-7, 31-7)];
        mypinlocator.image=[UIImage imageNamed:@"nearicon"];
        [mypinbase addSubview:mypinlocator];
        
        
    UILabel *mypinlocation=[[UILabel alloc]initWithFrame:CGRectMake(110,52, backgroundimage.frame.size.width-190,30)];
        mypinlocation.text=@"kolkata , india";
        mypinlocation.textColor=[UIColor grayColor];
        mypinlocation.textAlignment=NSTextAlignmentCenter;
        mypinlocation.font=[UIFont fontWithName:@"Helvetica" size:17];
        [mypinbase addSubview:mypinlocation];
        
    UIImageView *pinline=[[UIImageView alloc]initWithFrame:CGRectMake(6,120,mypinbase.frame.size.width-10,2)];
        pinline.image=[UIImage imageNamed:@"lineimg"];
        [mypinbase addSubview:pinline];
        
        UILabel *pindetails1=[[UILabel alloc]initWithFrame:CGRectMake(6,110,mypinbase.frame.size.width-10, 150)];
        pindetails1.backgroundColor=[UIColor clearColor];
        pindetails1.text=@"ios is a long established fact that a reader will be distracted by the readable content of a page when looking at";
        pindetails1.font=[UIFont fontWithName:@"Helvetica" size:17];
        pindetails1.textColor=[UIColor grayColor];
        pindetails1.numberOfLines=3;
        pindetails1.textAlignment=NSTextAlignmentLeft;
        [mypinbase addSubview:pindetails1];

        
        UILabel *pindetails=[[UILabel alloc]initWithFrame:CGRectMake(6,240,mypinbase.frame.size.width-10, 150)];
        pindetails.backgroundColor=[[UIColor lightGrayColor]colorWithAlphaComponent:.2];
        pindetails.text=@"is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";
        pindetails.font=[UIFont fontWithName:@"Helvetica" size:17];
        pindetails.textColor=[UIColor grayColor];
        pindetails.numberOfLines=6;
        pindetails.textAlignment=NSTextAlignmentLeft;
        [mypinbase addSubview:pindetails];
        
        
        UIImageView *mypinfolbl=[[UIImageView alloc]initWithFrame:CGRectMake(8,330,496-178,60)];
        mypinfolbl.backgroundColor=[UIColor clearColor];
        mypinfolbl.userInteractionEnabled=YES;
        [mypinbase addSubview:mypinfolbl];

        UILabel *pintag=[[UILabel alloc]initWithFrame:CGRectMake(10,75,99,40)];
        pintag.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"tagimg3"]];
        pintag.text=@"# food";
        pintag.textColor=[UIColor lightGrayColor];
        pintag.textAlignment=NSTextAlignmentCenter;
        pintag.font=[UIFont fontWithName:@"Helvetica" size:19];
        [mypinfolbl addSubview:pintag];
        
        UILabel *pintag1=[[UILabel alloc]initWithFrame:CGRectMake(115,75,99,40)];
        pintag1.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"tagimg3"]];
        pintag1.text=@"# restaurant";
        pintag1.textColor=[UIColor lightGrayColor];
        pintag1.textAlignment=NSTextAlignmentCenter;
        pintag1.font=[UIFont fontWithName:@"Helvetica" size:15];
        [mypinfolbl addSubview:pintag1];
        
        UILabel *pintag4=[[UILabel alloc]initWithFrame:CGRectMake(220,75,99,40)];
        pintag4.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"tagimg3"]];
        pintag4.text=@"# hot";
        pintag4.textColor=[UIColor lightGrayColor];
        pintag4.textAlignment=NSTextAlignmentCenter;
        pintag4.font=[UIFont fontWithName:@"Helvetica" size:19];
        [mypinfolbl addSubview:pintag4];
        
        UILabel *pintag2=[[UILabel alloc]initWithFrame:CGRectMake(10,75+50,153,40)];
        pintag2.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"tagimg2"]];
        pintag2.text=@"# chicken";
        pintag2.textColor=[UIColor lightGrayColor];
        pintag2.textAlignment=NSTextAlignmentCenter;
        pintag2.font=[UIFont fontWithName:@"Helvetica" size:19];
        [mypinfolbl addSubview:pintag2];
        
        UILabel *pintag3=[[UILabel alloc]initWithFrame:CGRectMake(169,75+50,124,40)];
        pintag3.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"tagimg"]];
        pintag3.text=@"# hangout";
        pintag3.textColor=[UIColor lightGrayColor];
        pintag3.textAlignment=NSTextAlignmentCenter;
        pintag3.font=[UIFont fontWithName:@"Helvetica" size:19];
        [mypinfolbl addSubview:pintag3];

    /*----------------- Pin Section Comment Table Design ---------------------*/
        
        
 UIImageView *pincommentbg=[[UIImageView alloc]initWithFrame:CGRectMake(0,pintag3.frame.origin.y+70,528-210,170)];
        
        pincommentbg.image=[UIImage imageNamed:@"commentbg"];
        pincommentbg.userInteractionEnabled=YES;
        
        [mypinfolbl addSubview:pincommentbg];

        
        mypintable=[[UITableView alloc]initWithFrame:CGRectMake(0,0,pincommentbg.frame.size.width,pincommentbg.frame.size.height)style:UITableViewStylePlain];
        
        mypintable.delegate=self;
        
        mypintable.dataSource=self;
        
        mypintable.backgroundColor = [UIColor clearColor];
        
        mypintable.tag = 1;
        
        mypintable.separatorStyle=UITableViewCellSeparatorStyleNone;
        
        mypintable.showsVerticalScrollIndicator = YES;
        
        [pincommentbg addSubview:mypintable];
        
    /////////////////////////////////////////////////////////


        
        
///////////////////////////////////////////////////////////////////////////////////
        
    myfeedbackground=[[UIImageView alloc]initWithFrame:CGRectMake(6, mypinbackground.frame.origin.y+850,514-150,880)];
        myfeedbackground.image=[UIImage imageNamed:@"popularbg"];
        myfeedbackground.userInteractionEnabled=YES;
        [Backgroundscroll addSubview:myfeedbackground];
        
        myfeedview=[[UIImageView alloc]initWithFrame:CGRectMake(7, 0,myfeedbackground.frame.size.width-14,102)];
        myfeedview.image=[UIImage imageNamed:@"popularheader"];
        [myfeedbackground addSubview:myfeedview];
        
        myfeedheader=[[UILabel alloc]initWithFrame:CGRectMake(20, 5, backgroundimage.frame.size.width-190,60)];
        myfeedheader.text=@"My feed";
        myfeedheader.textColor=[UIColor colorWithRed:(230.0f/255.0f) green:(64.0f/255.0f) blue:(73.0f/255.0f) alpha:1];
        myfeedheader.textAlignment=NSTextAlignmentCenter;
        myfeedheader.font=[UIFont fontWithName:@"Helvetica" size:22];
        [myfeedview addSubview:myfeedheader];
        
        uparrow4=[[UIImageView alloc]initWithFrame:CGRectMake(280,15,34,34)];
        uparrow4.image=[UIImage imageNamed:@"uparrow"];
        [myfeedheader addSubview:uparrow4];
        
        myfeedicon=[[UIImageView alloc]initWithFrame:CGRectMake(5,18,25,25)];
        myfeedicon.image=[UIImage imageNamed:@"myfeedicon"];
        [myfeedheader addSubview:myfeedicon];

    /*--------------- My Feed Design ------------------*/
        
        
        UIImageView *myfeedbase=[[UIImageView alloc]initWithFrame:CGRectMake(15,85,514-180,740)];
        myfeedbase.image=[UIImage imageNamed:@"popularbg"];
        myfeedbase.userInteractionEnabled=YES;
        [myfeedbackground addSubview:myfeedbase];
        
      UIImageView *logo=[[UIImageView alloc]initWithFrame:CGRectMake(15,20,107-15,99-15)];
        logo.image=[UIImage imageNamed:@"myfeedlogo"];
        [myfeedbase addSubview:logo];
        
     UILabel *myfeedtitle=[[UILabel alloc]initWithFrame:CGRectMake(100, 5, backgroundimage.frame.size.width-190,60)];
        myfeedtitle.text=@"KFC restaurtent";
        myfeedtitle.textColor=[UIColor colorWithRed:(230.0f/255.0f) green:(64.0f/255.0f) blue:(73.0f/255.0f) alpha:1];
        myfeedtitle.textAlignment=NSTextAlignmentCenter;
        myfeedtitle.font=[UIFont fontWithName:@"Helvetica" size:19];
        [myfeedbase addSubview:myfeedtitle];
        
        
       UIImageView *pinicon=[[UIImageView alloc]initWithFrame:CGRectMake(285,15,27,27)];
        pinicon.image=[UIImage imageNamed:@"pinicon"];
        [myfeedbase addSubview:pinicon];
        
        
      UIImageView *myfeedlocator=[[UIImageView alloc]initWithFrame:CGRectMake(122,56,25-7, 31-7)];
        myfeedlocator.image=[UIImage imageNamed:@"nearicon"];
        [myfeedbase addSubview:myfeedlocator];
        
        
    UILabel *myfeedlocation=[[UILabel alloc]initWithFrame:CGRectMake(110,52, backgroundimage.frame.size.width-190,30)];
        myfeedlocation.text=@"kolkata , india";
        myfeedlocation.textColor=[UIColor grayColor];
        myfeedlocation.textAlignment=NSTextAlignmentCenter;
        myfeedlocation.font=[UIFont fontWithName:@"Helvetica" size:17];
        [myfeedbase addSubview:myfeedlocation];


    UIImageView *myfeeddisplayimage=[[UIImageView alloc]initWithFrame:CGRectMake(8,120,496-178,330-100)];
    myfeeddisplayimage.image=[UIImage imageNamed:@"myfeeddisplayimage"];
    [myfeedbase addSubview:myfeeddisplayimage];
        
   UIImageView *myfeedinfolbl=[[UIImageView alloc]initWithFrame:CGRectMake(8,350,496-178,60)];
    myfeedinfolbl.image=[UIImage imageNamed:@"redlbl"];
    [myfeedbase addSubview:myfeedinfolbl];
        
  UILabel *feeditemname=[[UILabel alloc]initWithFrame:CGRectMake(10,0,140,60)];
        feeditemname.text=@"Crispi Chicken";
        feeditemname.textColor=[UIColor whiteColor];
        feeditemname.textAlignment=NSTextAlignmentCenter;
        feeditemname.font=[UIFont fontWithName:@"Helvetica Bold" size:18];
        [myfeedinfolbl addSubview:feeditemname];
        
        
  UILabel *feeditemprice=[[UILabel alloc]initWithFrame:CGRectMake(220,0,100,60)];
        feeditemprice.text=@"50.00";
        feeditemprice.textColor=[UIColor whiteColor];
        feeditemprice.textAlignment=NSTextAlignmentCenter;
        feeditemprice.font=[UIFont fontWithName:@"Helvetica Bold" size:19];
        [myfeedinfolbl addSubview:feeditemprice];

        
    UILabel *feedtag=[[UILabel alloc]initWithFrame:CGRectMake(10,75,99,40)];
        feedtag.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"tagimg3"]];
        feedtag.text=@"# food";
        feedtag.textColor=[UIColor lightGrayColor];
        feedtag.textAlignment=NSTextAlignmentCenter;
        feedtag.font=[UIFont fontWithName:@"Helvetica" size:19];
        [myfeedinfolbl addSubview:feedtag];
        
    UILabel *feedtag1=[[UILabel alloc]initWithFrame:CGRectMake(115,75,99,40)];
        feedtag1.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"tagimg3"]];
        feedtag1.text=@"# restaurant";
        feedtag1.textColor=[UIColor lightGrayColor];
        feedtag1.textAlignment=NSTextAlignmentCenter;
        feedtag1.font=[UIFont fontWithName:@"Helvetica" size:15];
        [myfeedinfolbl addSubview:feedtag1];
        
    UILabel *feedtag4=[[UILabel alloc]initWithFrame:CGRectMake(220,75,99,40)];
        feedtag4.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"tagimg3"]];
        feedtag4.text=@"# hot";
        feedtag4.textColor=[UIColor lightGrayColor];
        feedtag4.textAlignment=NSTextAlignmentCenter;
        feedtag4.font=[UIFont fontWithName:@"Helvetica" size:19];
        [myfeedinfolbl addSubview:feedtag4];
        
    UILabel *feedtag2=[[UILabel alloc]initWithFrame:CGRectMake(10,75+50,153,40)];
        feedtag2.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"tagimg2"]];
        feedtag2.text=@"# chicken";
        feedtag2.textColor=[UIColor lightGrayColor];
        feedtag2.textAlignment=NSTextAlignmentCenter;
        feedtag2.font=[UIFont fontWithName:@"Helvetica" size:19];
        [myfeedinfolbl addSubview:feedtag2];
        
    UILabel *feedtag3=[[UILabel alloc]initWithFrame:CGRectMake(169,75+50,124,40)];
        feedtag3.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"tagimg"]];
        feedtag3.text=@"# hangout";
        feedtag3.textColor=[UIColor lightGrayColor];
        feedtag3.textAlignment=NSTextAlignmentCenter;
        feedtag3.font=[UIFont fontWithName:@"Helvetica" size:19];
        [myfeedinfolbl addSubview:feedtag3];

 /*----------------- Feed Section Comment Design ---------------------*/
        
        UIImageView *feedcommentbg=[[UIImageView alloc]initWithFrame:CGRectMake(0,feedtag3.frame.origin.y+70,528-210,170)];
        
        feedcommentbg.image=[UIImage imageNamed:@"commentbg"];
        feedcommentbg.userInteractionEnabled=YES;
        
        [myfeedinfolbl addSubview:feedcommentbg];
        
        
        
        /* Food section comment list   */
        
        
        
        
        
        //Food table view......
        
        
        
        Feedlist_View=[[UITableView alloc]initWithFrame:CGRectMake(myfeedbase.frame.origin.x-5,myfeedbase.frame.origin.y+460,myfeedbase.frame.size.width-20,feedcommentbg.frame.size.height)style:UITableViewStylePlain];
        
        Feedlist_View.delegate=self;
        
        Feedlist_View.dataSource=self;
        
        Feedlist_View.backgroundColor = [UIColor clearColor];
        
        Feedlist_View.tag = 1;
        
        Feedlist_View.separatorStyle=UITableViewCellSeparatorStyleNone;
        
        Feedlist_View.showsVerticalScrollIndicator = YES;
        
        [myfeedbase addSubview:Feedlist_View];
        


    
        
   /////////////////////////////////////////////////////////

        
    }
    
    
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
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView.tag==1)
    {
        return 5;
    }
    else if (tableView.tag==2)
    {
         return 10;
    }
    return NO;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    cell.backgroundColor =[UIColor clearColor];
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    
    if (tableView.tag==1)
    {
        
        if ([UIScreen mainScreen].bounds.size.height==568.0f)
            
        {
            cell.backgroundColor = [UIColor colorWithRed:(247.0f/255.0f) green:(247.0f/255.0f) blue:(247.0f/255.0f) alpha:1.0];
            
            
            
            UIImageView *userimage=[[UIImageView alloc]initWithFrame:CGRectMake(5,10,55,55)];
            
            
            
            userimage.image=[UIImage imageNamed:@"userimg"];
            
            
            
            [cell addSubview:userimage];
            
            
            
            UILabel *feedusername=[[UILabel alloc]initWithFrame:CGRectMake(65, 5,120,50)];
            
            
            
            feedusername.text=@"Mc Arnold";
            
            
            
            feedusername.textColor=[UIColor grayColor];
            
            
            
            feedusername.textAlignment=NSTextAlignmentLeft;
            
            
            
            [feedusername setBackgroundColor:[UIColor clearColor]];
            
            
            
            feedusername.font=[UIFont fontWithName:@"Helvetica Bold" size:20];
            
            
            
            [cell addSubview:feedusername];
            
            
            
            
            
            
            
            
            
            
            
            UILabel *feedusercommentdate = [[UILabel alloc]initWithFrame:CGRectMake(200, 5,80,50)];
            
            
            
            feedusercommentdate.text=@"12 dec";
            
            
            
            feedusercommentdate.textColor=[UIColor lightGrayColor];
            
            
            
            feedusercommentdate.textAlignment=NSTextAlignmentCenter;
            
            
            
            [feedusercommentdate setBackgroundColor:[UIColor clearColor]];
            
            
            
            feedusercommentdate.font=[UIFont fontWithName:@"Helvetica" size:19];
            
            
            
            [cell addSubview:feedusercommentdate];
            
            
            
            
            
            UILabel *feedusertitle = [[UILabel alloc]initWithFrame:CGRectMake(65, 40,210,50)];
            
            
            
            feedusertitle.text=@"@mc_arnold | Lv. 1 Foodie";
            
            
            
            feedusertitle.textColor=[UIColor lightGrayColor];
            
            
            
            feedusertitle.textAlignment=NSTextAlignmentLeft;
            
            
            
            [feedusertitle setBackgroundColor:[UIColor clearColor]];
            
            
            
            feedusertitle.font=[UIFont fontWithName:@"Helvetica" size:15];
            
            
            
            [cell addSubview:feedusertitle];
            
            
            
            
            
            UILabel *feeduserdescription = [[UILabel alloc]initWithFrame:CGRectMake(15, 70,270,40)];
            
            
            
            feeduserdescription.text=@"Fusce imperdiet porta imperdiet";
            
            
            
            feeduserdescription.textColor=[UIColor colorWithRed:(168.0f/255.0f) green:(168.0f/255.0f) blue:(168.0f/255.0f) alpha:1];
            
            
            
            feeduserdescription.textAlignment=NSTextAlignmentLeft;
            
            
            
            [feeduserdescription setBackgroundColor:[UIColor clearColor]];
            
            
            
            feeduserdescription.font=[UIFont fontWithName:@"Helvetica" size:16];
            
            
            
            [cell addSubview:feeduserdescription];
            
            
            
            UIImageView *lineimage = [[UIImageView alloc]initWithFrame:CGRectMake(Feedlist_View.frame.origin.x-7, feeduserdescription.frame.origin.x+100, Feedlist_View.frame.size.width-10, 40)];
            
            
            
            [lineimage setImage:[UIImage imageNamed:@"bottomdividerline"]];
            
            
            
            [cell addSubview:lineimage];
            
            
            
            
            
            UILabel *heartgraycount = [[UILabel alloc]initWithFrame:CGRectMake(Feedlist_View.frame.origin.x+2, feeduserdescription.frame.origin.x+105,30,30)];
            
            
            
            heartgraycount.text=@"30";
            
            
            
            heartgraycount.textColor=[UIColor lightGrayColor];
            
            
            
            heartgraycount.textAlignment=NSTextAlignmentLeft;
            
            
            
            [heartgraycount setBackgroundColor:[UIColor clearColor]];
            
            
            
            heartgraycount.font=[UIFont fontWithName:@"Helvetica" size:18];
            
            
            
            [cell addSubview:heartgraycount];
            
            
            
            
            
            
            
            UIImageView *heartgrayimage = [[UIImageView alloc]initWithFrame:CGRectMake(Feedlist_View.frame.origin.x+26, feeduserdescription.frame.origin.x+110, 32-8, 28-8)];
            
            
            
            [heartgrayimage setImage:[UIImage imageNamed:@"heartgray"]];
            
            
            
            [cell addSubview:heartgrayimage];
            
            
            
            
            
            UILabel *commentgraycount = [[UILabel alloc]initWithFrame:CGRectMake(Feedlist_View.frame.origin.x+66, feeduserdescription.frame.origin.x+105,30,30)];
            
            
            
            commentgraycount.text=@"20";
            
            
            
            commentgraycount.textColor=[UIColor lightGrayColor];
            
            
            
            commentgraycount.textAlignment=NSTextAlignmentLeft;
            
            
            
            [commentgraycount setBackgroundColor:[UIColor clearColor]];
            
            
            
            commentgraycount.font=[UIFont fontWithName:@"Helvetica" size:18];
            
            
            
            [cell addSubview:commentgraycount];
            
        
            
            UIImageView *commentgrayimage = [[UIImageView alloc]initWithFrame:CGRectMake(Feedlist_View.frame.origin.x+95, feeduserdescription.frame.origin.x+110, 29-8, 29-8)];
            
            
            
            [commentgrayimage setImage:[UIImage imageNamed:@"commentgrayimage"]];
            
            
            
            [cell addSubview:commentgrayimage];
            
            
            
            
            
            
            
            UIImageView *heartredimage = [[UIImageView alloc]initWithFrame:CGRectMake(Feedlist_View.frame.origin.x+145, feeduserdescription.frame.origin.x+110, 32-8, 28-8)];
            
            
            
            [heartredimage setImage:[UIImage imageNamed:@"heartred"]];
            
            
            
            [cell addSubview:heartredimage];
            
            
            
            
            
            
            
            UIImageView *commentbuttonblack = [[UIImageView alloc]initWithFrame:CGRectMake(Feedlist_View.frame.origin.x+190, feeduserdescription.frame.origin.x+110, 32-8, 28-8)];
            
            
            
            [commentbuttonblack setImage:[UIImage imageNamed:@"commentbuttonblack"]];
            
            
            
            [cell addSubview:commentbuttonblack];
            
            
            
            
            
            
            
            UIImageView *settingsbutton = [[UIImageView alloc]initWithFrame:CGRectMake(Feedlist_View.frame.origin.x+240, feeduserdescription.frame.origin.x+110, 5, 23)];
            
            
            
            [settingsbutton setImage:[UIImage imageNamed:@"morebutton"]];
            
            
            
            
            
            [cell addSubview:settingsbutton];
        }
        
        else
        {

        cell.backgroundColor = [UIColor colorWithRed:(247.0f/255.0f) green:(247.0f/255.0f) blue:(247.0f/255.0f) alpha:1.0];
        
        
        
        UIImageView *userimage=[[UIImageView alloc]initWithFrame:CGRectMake(5,10,55,55)];
        
        userimage.image=[UIImage imageNamed:@"userimg"];
        
        [cell addSubview:userimage];
        
        
        
        
        
        UILabel *feedusername=[[UILabel alloc]initWithFrame:CGRectMake(80, 5,120,50)];
        
        feedusername.text=@"Mc Arnold";
        
        feedusername.textColor=[UIColor grayColor];
        
        feedusername.textAlignment=NSTextAlignmentLeft;
        
        [feedusername setBackgroundColor:[UIColor clearColor]];
        
        feedusername.font=[UIFont fontWithName:@"Helvetica Bold" size:20];
        
        [cell addSubview:feedusername];
        
        
        
        
        
        UILabel *feedusercommentdate = [[UILabel alloc]initWithFrame:CGRectMake(230, 5,80,50)];
        
        feedusercommentdate.text=@"12 dec";
        
        feedusercommentdate.textColor=[UIColor lightGrayColor];
        
        feedusercommentdate.textAlignment=NSTextAlignmentCenter;
        
        [feedusercommentdate setBackgroundColor:[UIColor clearColor]];
        
        feedusercommentdate.font=[UIFont fontWithName:@"Helvetica" size:20];
        
        [cell addSubview:feedusercommentdate];
        
        
        
        
        
        UILabel *feedusertitle = [[UILabel alloc]initWithFrame:CGRectMake(80, 40,230,50)];
        
        feedusertitle.text=@"@mc_arnold | Lv. 1 Foodie";
        
        feedusertitle.textColor=[UIColor lightGrayColor];
        
        feedusertitle.textAlignment=NSTextAlignmentLeft;
        
        [feedusertitle setBackgroundColor:[UIColor clearColor]];
        
        feedusertitle.font=[UIFont fontWithName:@"Helvetica" size:17];
        
        [cell addSubview:feedusertitle];
        
        
        
        
        
        UILabel *feeduserdescription = [[UILabel alloc]initWithFrame:CGRectMake(15, 70,280,40)];
        
        feeduserdescription.text=@"Fusce imperdiet porta imperdiet";
        
        feeduserdescription.textColor=[UIColor colorWithRed:(168.0f/255.0f) green:(168.0f/255.0f) blue:(168.0f/255.0f) alpha:1];
        
        feeduserdescription.textAlignment=NSTextAlignmentLeft;
        
        [feeduserdescription setBackgroundColor:[UIColor clearColor]];
        
        feeduserdescription.font=[UIFont fontWithName:@"Helvetica" size:18];
        
        [cell addSubview:feeduserdescription];
        
        
        
        
        
        
        
        UIImageView *lineimage = [[UIImageView alloc]initWithFrame:CGRectMake(Feedlist_View.frame.origin.x-5, feeduserdescription.frame.origin.x+100, Feedlist_View.frame.size.width-10, 40)];
        
        [lineimage setImage:[UIImage imageNamed:@"bottomdividerline"]];
        
        [cell addSubview:lineimage];
        
        
        
        
        
        UILabel *heartgraycount = [[UILabel alloc]initWithFrame:CGRectMake(Feedlist_View.frame.origin.x+2, feeduserdescription.frame.origin.x+105,30,30)];
        
        heartgraycount.text=@"30";
        
        heartgraycount.textColor=[UIColor lightGrayColor];
        
        heartgraycount.textAlignment=NSTextAlignmentLeft;
        
        [heartgraycount setBackgroundColor:[UIColor clearColor]];
        
        heartgraycount.font=[UIFont fontWithName:@"Helvetica" size:20];
        
        [cell addSubview:heartgraycount];
        
        
        
        UIImageView *heartgrayimage = [[UIImageView alloc]initWithFrame:CGRectMake(Feedlist_View.frame.origin.x+33, feeduserdescription.frame.origin.x+110, 32-6, 28-6)];
        
        [heartgrayimage setImage:[UIImage imageNamed:@"heartgray"]];
        
        [cell addSubview:heartgrayimage];
        
        
        
        UILabel *commentgraycount = [[UILabel alloc]initWithFrame:CGRectMake(Feedlist_View.frame.origin.x+78, feeduserdescription.frame.origin.x+105,30,30)];
        
        commentgraycount.text=@"20";
        
        commentgraycount.textColor=[UIColor lightGrayColor];
        
        commentgraycount.textAlignment=NSTextAlignmentLeft;
        
        [commentgraycount setBackgroundColor:[UIColor clearColor]];
        
        commentgraycount.font=[UIFont fontWithName:@"Helvetica" size:20];
        
        [cell addSubview:commentgraycount];
        
        
        
        UIImageView *commentgrayimage = [[UIImageView alloc]initWithFrame:CGRectMake(Feedlist_View.frame.origin.x+110, feeduserdescription.frame.origin.x+110, 29-6, 29-6)];
        
        [commentgrayimage setImage:[UIImage imageNamed:@"commentgrayimage"]];
        
        [cell addSubview:commentgrayimage];
        
        
        
        UIImageView *heartredimage = [[UIImageView alloc]initWithFrame:CGRectMake(Feedlist_View.frame.origin.x+169, feeduserdescription.frame.origin.x+110, 32-6, 28-6)];
        
        [heartredimage setImage:[UIImage imageNamed:@"heartred"]];
        
        [cell addSubview:heartredimage];
        
        
        
        UIImageView *commentbuttonblack = [[UIImageView alloc]initWithFrame:CGRectMake(Feedlist_View.frame.origin.x+220, feeduserdescription.frame.origin.x+110, 32-6, 28-6)];
        
        [commentbuttonblack setImage:[UIImage imageNamed:@"commentbuttonblack"]];
        
        [cell addSubview:commentbuttonblack];
        
        
        
        UIImageView *settingsbutton = [[UIImageView alloc]initWithFrame:CGRectMake(Feedlist_View.frame.origin.x+270, feeduserdescription.frame.origin.x+110, 5, 23)];
        
        [settingsbutton setImage:[UIImage imageNamed:@"morebutton"]];
        
        
        [cell addSubview:settingsbutton];
        }
    }
    else if (tableView.tag==2)
    {
    UIView *followview=[[UIView alloc]initWithFrame:CGRectMake(0, 0,tableView.frame.size.width,136)];
    followview.backgroundColor=[[UIColor lightGrayColor]colorWithAlphaComponent:.2];
    followview.layer.cornerRadius=5;
    followview.userInteractionEnabled=YES;
    [cell addSubview:followview];
    
    UIImageView *userimage=[[UIImageView alloc]initWithFrame:CGRectMake(15,20,55,55)];
    userimage.image=[UIImage imageNamed:@"userimg"];
    [followview addSubview:userimage];
    
    UILabel *feedusername=[[UILabel alloc]initWithFrame:CGRectMake(80, 5,100,60)];
    feedusername.text=@"Mr. Roy";
    feedusername.textColor=[UIColor grayColor];
    feedusername.textAlignment=NSTextAlignmentCenter;
    feedusername.font=[UIFont fontWithName:@"Helvetica Bold" size:18];
    [followview addSubview:feedusername];
    
    UILabel *cardscount=[[UILabel alloc]initWithFrame:CGRectMake(95,45,100,40)];
    cardscount.text=@"100 Cards";
    cardscount.textColor=[UIColor grayColor];
    cardscount.textAlignment=NSTextAlignmentLeft;
    cardscount.font=[UIFont fontWithName:@"Helvetica" size:15];
    [followview addSubview:cardscount];
    
    UILabel *followscount=[[UILabel alloc]initWithFrame:CGRectMake(95,70,100,40)];
    followscount.text=@"100 Followers";
    followscount.textColor=[UIColor grayColor];
    followscount.textAlignment=NSTextAlignmentLeft;
    followscount.font=[UIFont fontWithName:@"Helvetica" size:15];
    [followview addSubview:followscount];
    
        if ([UIScreen mainScreen].bounds.size.height==568.0f)
        {
            UIButton *followbtn=[[UIButton alloc]initWithFrame:CGRectMake(195, 40,174/2,50/2 )];
            [followbtn setImage:[UIImage imageNamed:@"followed"] forState:UIControlStateNormal];
            [followview addSubview:followbtn];

        }
        else
        {
            UIButton *followbtn=[[UIButton alloc]initWithFrame:CGRectMake(235, 40,174/2,50/2 )];
            [followbtn setImage:[UIImage imageNamed:@"followed"] forState:UIControlStateNormal];
            [followview addSubview:followbtn];

        }
    
        
    }
    cell.selectionStyle=NO;
    
    return cell;

}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag==1)
    {
        return 170;
    }
   else if (tableView.tag==2)
   {
       return 140;
   }
    return 140;
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

-(void)edit:(UIButton *)sender{
    
//    FNresturentlistViewController *list = [[FNresturentlistViewController alloc]init];
//    [self.navigationController pushViewController:list animated:NO];
    
//    FNTradingtagViewController *list = [[FNTradingtagViewController alloc]init];
//    [self.navigationController pushViewController:list animated:NO];
    
//    FNtagViewController *list = [[FNtagViewController alloc]init];
//    [self.navigationController pushViewController:list animated:NO];
    
    FNresturentdetailsViewController*list = [[FNresturentdetailsViewController alloc]init];
    [self.navigationController pushViewController:list animated:NO];

    
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

@end
