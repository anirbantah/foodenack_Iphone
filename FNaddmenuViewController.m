//
//  FNaddmenuViewController.m
//  Foodenak
//
//  Created by RAHUL - ( iMAC ) on 07/01/15.
//  Copyright (c) 2015 Esolz Tech. All rights reserved.
//

#import "FNaddmenuViewController.h"

@interface FNaddmenuViewController ()

@end

@implementation FNaddmenuViewController
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    /* ////////////////////// Mainview and TopView(RED) /////////////////////// */
    
    
    Backgroundview=[[UIView alloc]initWithFrame:CGRectMake(self.view.frame.origin.x,self.view.frame.origin.y,self.view.frame.size.width,self.view.frame.size.height)];
    Backgroundview.backgroundColor=[UIColor colorWithRed:(222.0f/255.0f) green:(222.0f/255.0f) blue:(222.0f/255.0f) alpha:1];
    Backgroundview.userInteractionEnabled=YES;
    [self.view addSubview:Backgroundview];
    
    topview=[[UIImageView alloc]initWithFrame:CGRectMake(Backgroundview.frame.origin.x,Backgroundview.frame.origin.y-20,Backgroundview.frame.size.width,100)];
    topview.image=[UIImage imageNamed:@"topview"];
    topview.userInteractionEnabled=YES;
    [Backgroundview addSubview:topview];
    
    if ([UIScreen mainScreen].bounds.size.width==320.0f)
    {
        header1=[[UILabel alloc]initWithFrame:CGRectMake(25,50, 180, 40)];
        header1.text=@"KFC : Add Menu";
        header1.textColor=[UIColor whiteColor];
        header1.textAlignment=NSTextAlignmentCenter;
        header1.font=[UIFont fontWithName:@"Helvetica Bold" size:18];
        [topview addSubview:header1];
        
        UIButton *back=[[UIButton alloc]initWithFrame:CGRectMake(10, 54,18-3,31-3)];
        [back setImage:[UIImage imageNamed:@"backarrow"] forState:UIControlStateNormal];
        [back addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
        [topview addSubview:back];
        
        
        UIButton *backtap=[[UIButton alloc]initWithFrame:CGRectMake(1, 40,50,60)];
        [backtap setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [backtap addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
        [topview addSubview:backtap];


    }
    else
    {
        header1=[[UILabel alloc]initWithFrame:CGRectMake(30,50, 200, 40)];
        header1.text=@"KFC : Add Menu";
        header1.textColor=[UIColor whiteColor];
        header1.textAlignment=NSTextAlignmentCenter;
        header1.font=[UIFont fontWithName:@"Helvetica Bold" size:20];
        [topview addSubview:header1];
        
        
        UIButton *back=[[UIButton alloc]initWithFrame:CGRectMake(10, 54,18,31)];
        [back setImage:[UIImage imageNamed:@"backarrow"] forState:UIControlStateNormal];
        [back addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
        [topview addSubview:back];
        
        UIButton *backtap=[[UIButton alloc]initWithFrame:CGRectMake(1, 40,50,60)];
        [backtap setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [backtap addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
        [topview addSubview:backtap];


    }
    
    /*------------------ Top Bar ---------------------*/
    
    if ([UIScreen mainScreen].bounds.size.width==320.0f)
        
    {
        
         /* ----------------------- iphone 5s ------------------------ */
        
        
        topbar=[[UIImageView alloc]initWithFrame:CGRectMake(Backgroundview.frame.origin.x,topview.frame.size.height-20,Backgroundview.frame.size.width,65)];
        topbar.image=[UIImage imageNamed:@"topbar"];
        topbar.userInteractionEnabled=YES;
        [Backgroundview addSubview:topbar];
        
        
        shortview=[[UIImageView alloc]initWithFrame:CGRectMake(Backgroundview.frame.origin.x,topbar.frame.size.height+80,Backgroundview.frame.size.width,65)];
        shortview.backgroundColor=[[UIColor lightGrayColor]colorWithAlphaComponent:.4];
        shortview.userInteractionEnabled=YES;
        [Backgroundview addSubview:shortview];
        
        UILabel *shortlbl=[[UILabel alloc]initWithFrame:CGRectMake(0,0, 100, 65)];
        shortlbl.text=@"Short by";
        shortlbl.textColor=[UIColor blackColor];
        shortlbl.textAlignment=NSTextAlignmentCenter;
        shortlbl.font=[UIFont fontWithName:@"Helvetica" size:20];
        [shortview addSubview:shortlbl];
        
        
        UIImageView *shadwoimg=[[UIImageView alloc]initWithFrame:CGRectMake(Backgroundview.frame.origin.x,shortview.frame.origin.y+65,shortview.frame.size.width,33)];
        shadwoimg.image=[UIImage imageNamed:@"shadow"];
        shadwoimg.userInteractionEnabled=YES;
        [Backgroundview addSubview:shadwoimg];
        
        
        popularlistlbl=[[UILabel alloc]initWithFrame:CGRectMake(180,14, 135, 40)];
        popularlistlbl.backgroundColor=[UIColor colorWithRed:(237.0f/255.0f) green:(237.0f/255.0f) blue:(237.0f/255.0f) alpha:1];
        popularlistlbl.layer.cornerRadius=5;
        popularlistlbl.text=@"  Popular";
        popularlistlbl.textColor=[UIColor grayColor];
        popularlistlbl.textAlignment=NSTextAlignmentLeft;
        popularlistlbl.font=[UIFont fontWithName:@"Helvetica Light" size:18];
        [shortview addSubview:popularlistlbl];
        
        downarrow=[[UIImageView alloc]initWithFrame:CGRectMake(100,15,20,11)];
        downarrow.image=[UIImage imageNamed:@"downarrow2"];
        [popularlistlbl addSubview:downarrow];
        
        
        all=[[UIButton alloc]initWithFrame:CGRectMake(4,0,60,65)];
        [all setTitle:@"All" forState:UIControlStateNormal];
        [all setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [all setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
        [all setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        all.backgroundColor=[UIColor clearColor];
        all.titleLabel.font=[UIFont fontWithName:@"Helvetica" size:17];
        all.tag=1;
        [all addTarget:self action:@selector(SegmentFunction:) forControlEvents:UIControlEventTouchUpInside];
        [topbar addSubview:all];
        
        
        review=[[UIButton alloc]initWithFrame:CGRectMake(55,0,100,65)];
        [review setTitle:@"Review" forState:UIControlStateNormal];
        [review setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [review setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
        [review setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        review.backgroundColor=[UIColor clearColor];
        review.titleLabel.font=[UIFont fontWithName:@"Helvetica" size:17];
        review.tag=2;
        [review addTarget:self action:@selector(SegmentFunction:) forControlEvents:UIControlEventTouchUpInside];
        [topbar addSubview:review];
        
        photo=[[UIButton alloc]initWithFrame:CGRectMake(141,0,85,65)];
        [photo setTitle:@"Photo" forState:UIControlStateNormal];
        [photo setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [photo setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
        [photo setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        photo.backgroundColor=[UIColor clearColor];
        photo.titleLabel.font=[UIFont fontWithName:@"Helvetica" size:17];
        photo.tag=3;
        [photo addTarget:self action:@selector(SegmentFunction:) forControlEvents:UIControlEventTouchUpInside];
        [topbar addSubview:photo];
        
        discussion=[[UIButton alloc]initWithFrame:CGRectMake(219,0,100,65)];
        [discussion setTitle:@"Discussion" forState:UIControlStateNormal];
        [discussion setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [discussion setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
        [discussion setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        discussion.backgroundColor=[UIColor clearColor];
        discussion.titleLabel.font=[UIFont fontWithName:@"Helvetica" size:17];
        discussion.tag=4;
        [discussion addTarget:self action:@selector(SegmentFunction:) forControlEvents:UIControlEventTouchUpInside];
        [topbar addSubview:discussion];
        
        
        redline=[[UIView alloc]initWithFrame:CGRectMake(4, 61, all.frame.size.width, 4.0f)];
        redline.backgroundColor=[UIColor colorWithRed:(230.0f/255.0f) green:(64.0f/255.0f) blue:(73.0f/255.0f) alpha:1];
        [topbar addSubview:redline];
        
        
        Backgroundscroll=[[UIScrollView alloc]initWithFrame:CGRectMake(self.view.frame.origin.x,210,self.view.frame.size.width,self.view.frame.size.height-210)];
        Backgroundscroll.backgroundColor=[UIColor clearColor];
        Backgroundscroll.scrollEnabled=YES;
        [Backgroundscroll setContentSize:CGSizeMake(self.view.frame.origin.x, 900)];
        [Backgroundview addSubview:Backgroundscroll];
        
        UIImageView *popularbackground=[[UIImageView alloc]initWithFrame:CGRectMake(4, 0,514-180,1035)];
        [Backgroundscroll addSubview:popularbackground];
        
        
        UIImageView *popularbase=[[UIImageView alloc]initWithFrame:CGRectMake(10,50,514-220,800)];
        popularbase.image=[UIImage imageNamed:@"popularbg"];
        [popularbackground addSubview:popularbase];
        
        
        UIImageView *logobackground=[[UIImageView alloc]initWithFrame:CGRectMake(6,0,481-200,297-90)];
        logobackground.image=[UIImage imageNamed:@"logobackground"];
        [popularbase addSubview:logobackground];
        
        UIImageView *logo2=[[UIImageView alloc]initWithFrame:CGRectMake(15,20,107-15,99-15)];
        logo2.image=[UIImage imageNamed:@"myfeedlogo"];
        [logobackground addSubview:logo2];
        
        UILabel *populartitle=[[UILabel alloc]initWithFrame:CGRectMake(115, 5, popularbase.frame.size.width-170,60)];
        populartitle.text=@"KFC restaurtent";
        populartitle.textColor=[UIColor whiteColor];
        populartitle.textAlignment=NSTextAlignmentCenter;
        populartitle.font=[UIFont fontWithName:@"Helvetica" size:17];
        [logobackground addSubview:populartitle];
        
        
        UIImageView *pinicon2=[[UIImageView alloc]initWithFrame:CGRectMake(251,15,27-4,27-4)];
        pinicon2.image=[UIImage imageNamed:@"whitepin"];
        [logobackground addSubview:pinicon2];
        
        
        UIImageView *popularlocator=[[UIImageView alloc]initWithFrame:CGRectMake(122,56,25-7, 31-7)];
        popularlocator.image=[UIImage imageNamed:@"nearicon2"];
        [logobackground addSubview:popularlocator];
        
        
        UILabel *popularlocation=[[UILabel alloc]initWithFrame:CGRectMake(140,52, popularbase.frame.size.width-190,30)];
        popularlocation.text=@"kolkata , india";
        popularlocation.textColor=[UIColor lightGrayColor];
        popularlocation.textAlignment=NSTextAlignmentCenter;
        popularlocation.font=[UIFont fontWithName:@"Helvetica" size:15];
        [logobackground addSubview:popularlocation];
        
        
        UIImageView *popularstar1=[[UIImageView alloc]initWithFrame:CGRectMake(65-15,128,49-15,44-15)];
        popularstar1.image=[UIImage imageNamed:@"staron"];
        [logobackground addSubview:popularstar1];
        
        UIImageView *popularstar2=[[UIImageView alloc]initWithFrame:CGRectMake(110-15,128,49-15,44-15)];
        popularstar2.image=[UIImage imageNamed:@"staron"];
        [logobackground addSubview:popularstar2];
        
        UIImageView *popularstar3=[[UIImageView alloc]initWithFrame:CGRectMake(155-15,128,49-15,44-15)];
        popularstar3.image=[UIImage imageNamed:@"staron"];
        [logobackground addSubview:popularstar3];
        
        UIImageView *popularstar4=[[UIImageView alloc]initWithFrame:CGRectMake(200-15,128,49-15,44-15)];
        popularstar4.image=[UIImage imageNamed:@"staron"];
        [logobackground addSubview:popularstar4];
        
        UIImageView *popularstar5=[[UIImageView alloc]initWithFrame:CGRectMake(245-15,128,49-15,44-15)];
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
    }
    else
    {
        
    /* -------------------- iphone 6 ------------------ */
        
        topbar=[[UIImageView alloc]initWithFrame:CGRectMake(Backgroundview.frame.origin.x,topview.frame.size.height-20,Backgroundview.frame.size.width,65)];
        topbar.image=[UIImage imageNamed:@"topbar"];
        topbar.userInteractionEnabled=YES;
        [Backgroundview addSubview:topbar];
        
        
        shortview=[[UIImageView alloc]initWithFrame:CGRectMake(Backgroundview.frame.origin.x,topbar.frame.size.height+80,Backgroundview.frame.size.width,65)];
        shortview.backgroundColor=[[UIColor lightGrayColor]colorWithAlphaComponent:.4];
        shortview.userInteractionEnabled=YES;
        [Backgroundview addSubview:shortview];
        
        UILabel *shortlbl=[[UILabel alloc]initWithFrame:CGRectMake(0,0, 100, 65)];
        shortlbl.text=@"Short by";
        shortlbl.textColor=[UIColor blackColor];
        shortlbl.textAlignment=NSTextAlignmentCenter;
        shortlbl.font=[UIFont fontWithName:@"Helvetica" size:20];
        [shortview addSubview:shortlbl];
        
        
        UIImageView *shadwoimg=[[UIImageView alloc]initWithFrame:CGRectMake(Backgroundview.frame.origin.x,shortview.frame.origin.y+65,shortview.frame.size.width,33)];
        shadwoimg.image=[UIImage imageNamed:@"shadow"];
        shadwoimg.userInteractionEnabled=YES;
        [Backgroundview addSubview:shadwoimg];

        
        popularlistlbl=[[UILabel alloc]initWithFrame:CGRectMake(220,14, 135, 40)];
        popularlistlbl.backgroundColor=[UIColor colorWithRed:(237.0f/255.0f) green:(237.0f/255.0f) blue:(237.0f/255.0f) alpha:1];
        popularlistlbl.layer.cornerRadius=5;
        popularlistlbl.text=@"  Popular";
        popularlistlbl.textColor=[UIColor grayColor];
        popularlistlbl.textAlignment=NSTextAlignmentLeft;
        popularlistlbl.font=[UIFont fontWithName:@"Helvetica Light" size:18];
        [shortview addSubview:popularlistlbl];
        
        downarrow=[[UIImageView alloc]initWithFrame:CGRectMake(100,15,20,11)];
        downarrow.image=[UIImage imageNamed:@"downarrow2"];
        [popularlistlbl addSubview:downarrow];
        
        
        all=[[UIButton alloc]initWithFrame:CGRectMake(4,0,60,65)];
        [all setTitle:@"All" forState:UIControlStateNormal];
        [all setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [all setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
        [all setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        all.backgroundColor=[UIColor clearColor];
        all.titleLabel.font=[UIFont fontWithName:@"Helvetica" size:19];
        all.tag=1;
        [all addTarget:self action:@selector(SegmentFunction:) forControlEvents:UIControlEventTouchUpInside];
        [topbar addSubview:all];
        
        
        review=[[UIButton alloc]initWithFrame:CGRectMake(65,0,100,65)];
        [review setTitle:@"Review" forState:UIControlStateNormal];
        [review setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [review setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
        [review setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        review.backgroundColor=[UIColor clearColor];
        review.titleLabel.font=[UIFont fontWithName:@"Helvetica" size:19];
        review.tag=2;
        [review addTarget:self action:@selector(SegmentFunction:) forControlEvents:UIControlEventTouchUpInside];
        [topbar addSubview:review];
        
        photo=[[UIButton alloc]initWithFrame:CGRectMake(166,0,85,65)];
        [photo setTitle:@"Photo" forState:UIControlStateNormal];
        [photo setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [photo setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
        [photo setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        photo.backgroundColor=[UIColor clearColor];
        photo.titleLabel.font=[UIFont fontWithName:@"Helvetica" size:19];
        photo.tag=3;
        [photo addTarget:self action:@selector(SegmentFunction:) forControlEvents:UIControlEventTouchUpInside];
        [topbar addSubview:photo];
        
        discussion=[[UIButton alloc]initWithFrame:CGRectMake(250,0,120,65)];
        [discussion setTitle:@"Discussion" forState:UIControlStateNormal];
        [discussion setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [discussion setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
        [discussion setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        discussion.backgroundColor=[UIColor clearColor];
        discussion.titleLabel.font=[UIFont fontWithName:@"Helvetica" size:19];
        discussion.tag=4;
        [discussion addTarget:self action:@selector(SegmentFunction:) forControlEvents:UIControlEventTouchUpInside];
        [topbar addSubview:discussion];
        
        
        redline=[[UIView alloc]initWithFrame:CGRectMake(4, 61, 70, 4.0f)];
        redline.backgroundColor=[UIColor colorWithRed:(230.0f/255.0f) green:(64.0f/255.0f) blue:(73.0f/255.0f) alpha:1];
        [topbar addSubview:redline];
        
        
        Backgroundscroll=[[UIScrollView alloc]initWithFrame:CGRectMake(self.view.frame.origin.x,210,self.view.frame.size.width,self.view.frame.size.height-210)];
        Backgroundscroll.backgroundColor=[UIColor clearColor];
        Backgroundscroll.scrollEnabled=YES;
        [Backgroundscroll setContentSize:CGSizeMake(self.view.frame.origin.x, 900)];
        [Backgroundview addSubview:Backgroundscroll];
        
        UIImageView *popularbackground=[[UIImageView alloc]initWithFrame:CGRectMake(4, 0,514-200,1035)];
        [Backgroundscroll addSubview:popularbackground];
        
        
        UIImageView *popularbase=[[UIImageView alloc]initWithFrame:CGRectMake(17,50,514-180,800)];
        popularbase.image=[UIImage imageNamed:@"popularbg"];
        [popularbackground addSubview:popularbase];
        
        
        UIImageView *logobackground=[[UIImageView alloc]initWithFrame:CGRectMake(6,0,481-160,297-90)];
        logobackground.image=[UIImage imageNamed:@"logobackground"];
        [popularbase addSubview:logobackground];
        
        UIImageView *logo2=[[UIImageView alloc]initWithFrame:CGRectMake(15,20,107-15,99-15)];
        logo2.image=[UIImage imageNamed:@"myfeedlogo"];
        [logobackground addSubview:logo2];
        
        UILabel *populartitle=[[UILabel alloc]initWithFrame:CGRectMake(115, 5, popularbase.frame.size.width-190,60)];
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
        
        
        UILabel *popularlocation=[[UILabel alloc]initWithFrame:CGRectMake(130,52, popularbase.frame.size.width-190,30)];
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
    }

    
    
    


    
    
}
-(void)SegmentFunction:(UIButton *)sender
{
    if ([UIScreen mainScreen].bounds.size.height==568.0f)
    {
        if (sender.tag==1)
        {
            
            [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                
                [redline setFrame:CGRectMake(4, 61, all.frame.size.width, 4.0f)];
                
                all.selected=YES;
                discussion.selected=NO;
                photo.selected=NO;
                review.selected=NO;
                
                
            } completion:^(BOOL finished)
             {
             }];
            
        }
        else if (sender.tag==2)
        {
            
            [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                
                [redline setFrame:CGRectMake(55, 61, review.frame.size.width, 4.0f)];
                
                all.selected=NO;
                discussion.selected=NO;
                photo.selected=NO;
                review.selected=YES;
                
            } completion:^(BOOL finished)
             {
             }];
            
            
            
        }
        else if (sender.tag==3)
        {
            
            
            [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                
                [redline setFrame:CGRectMake(141, 61, photo.frame.size.width, 4.0f)];
                
                all.selected=NO;
                review.selected=NO;
                discussion.selected=NO;
                photo.selected=YES;
                
            } completion:^(BOOL finished)
             {
             }];
            
        }
        else if (sender.tag==4)
        {
            
            
            [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                
                [redline setFrame:CGRectMake(219, 61, discussion.frame.size.width, 4.0f)];
                
                all.selected=NO;
                review.selected=NO;
                photo.selected=NO;
                discussion.selected=YES;
                
            } completion:^(BOOL finished)
             {
             }];
            
        }

    }
    else
    {
        if (sender.tag==1)
        {
           
            [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                
                [redline setFrame:CGRectMake(4, 61, all.frame.size.width, 4.0f)];
                
                all.selected=YES;
                discussion.selected=NO;
                photo.selected=NO;
                review.selected=NO;
              
                
            } completion:^(BOOL finished)
             {
             }];
            
        }
        else if (sender.tag==2)
        {
            
            [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                
                [redline setFrame:CGRectMake(65, 61, review.frame.size.width, 4.0f)];
                
                all.selected=NO;
                discussion.selected=NO;
                photo.selected=NO;
                review.selected=YES;
                
            } completion:^(BOOL finished)
             {
             }];
            
            
            
        }
        else if (sender.tag==3)
        {
            
            
            [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                
                [redline setFrame:CGRectMake(166, 61, photo.frame.size.width, 4.0f)];
               
                all.selected=NO;
                review.selected=NO;
                discussion.selected=NO;
                photo.selected=YES;
                
            } completion:^(BOOL finished)
             {
             }];
            
        }
        else if (sender.tag==4)
        {
            
            
            [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                
                [redline setFrame:CGRectMake(250, 61, discussion.frame.size.width, 4.0f)];
                
                all.selected=NO;
                review.selected=NO;
                photo.selected=NO;
                discussion.selected=YES;
                
            } completion:^(BOOL finished)
             {
             }];
            
        }

        
    }
}
-(void)back:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
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
