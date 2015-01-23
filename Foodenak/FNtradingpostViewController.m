//
//  FNtradingpostViewController.m
//  Foodenak
//
//  Created by Soumarsi Kundu on 22/01/15.
//  Copyright (c) 2015 Esolz Tech. All rights reserved.
//

#import "FNtradingpostViewController.h"
#import "ViewController.h"

@interface FNtradingpostViewController ()<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>{
    UIView *MainView;
    UIImageView *TopView,*topbar;
    UIButton *BackButton,*weekbutton,*monthbutton,*alltimebutton;
    UILabel *EditProfileLbl;
    UIImageView *followersselectedline,*followingselectedline,*gradientview,*gradientview1;
    UIScrollView *MainScroll;
    UITableView *mypintable,*mypintable2,*mypintable3;
}


@end

@implementation FNtradingpostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //background view...........
    
    MainView=[[UIView alloc]initWithFrame:CGRectMake(self.view.frame.origin.x,self.view.frame.origin.y,self.view.frame.size.width,self.view.frame.size.height)];
    MainView.backgroundColor=[UIColor colorWithRed:(222.0f/255.0f) green:(222.0f/255.0f) blue:(222.0f/255.0f) alpha:1];
    MainView.userInteractionEnabled=YES;
    [self.view addSubview:MainView];
    
    
    //Header imageview.......
    
    TopView=[[UIImageView alloc]initWithFrame:CGRectMake(MainView.frame.origin.x,MainView.frame.origin.y,MainView.frame.size.width,80)];
    TopView.image=[UIImage imageNamed:@"topview"];
    TopView.userInteractionEnabled=YES;
    [MainView addSubview:TopView];
    
    
    //back button declare......
    
    BackButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [BackButton setFrame:CGRectMake(self.view.frame.origin.x+20, self.view.frame.origin.y+35, 18, 31)];
    [BackButton setImage:[UIImage imageNamed:@"backarrow"] forState:UIControlStateNormal];
    [BackButton addTarget:self action:@selector(Backbutton:) forControlEvents:UIControlEventTouchUpInside];
    [TopView addSubview:BackButton];
    
    
    //edit profile label allocation....
    
    EditProfileLbl = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.origin.x+45, self.view.frame.origin.y+35, 160, 30)];
    [EditProfileLbl setBackgroundColor:[UIColor clearColor]];
    [EditProfileLbl setText:@"Trading Post"];
    [EditProfileLbl setTextAlignment:NSTextAlignmentLeft];
    [EditProfileLbl setTextColor:[UIColor whiteColor]];
    [EditProfileLbl setFont:[UIFont fontWithName:@"Helvetica Bold" size:20]];
    [TopView addSubview:EditProfileLbl];
    
    //topbar gradient/////
    
    topbar=[[UIImageView alloc]initWithFrame:CGRectMake(MainView.frame.origin.x,TopView.frame.size.height,MainView.frame.size.width,55)];
    topbar.image=[UIImage imageNamed:@"topbar"];
    topbar.userInteractionEnabled=YES;
    [MainView addSubview:topbar];
    
    //week label...
    
    weekbutton = [[UIButton alloc]init];
    [weekbutton setTitle:@"Week" forState:UIControlStateNormal];
    [weekbutton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [weekbutton setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [weekbutton setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    weekbutton.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:18];
    [weekbutton addTarget:self action:@selector(weekcommon:) forControlEvents:UIControlEventTouchUpInside];
    weekbutton.tag = 1;
    [MainView addSubview:weekbutton];
    
    
    followersselectedline = [[UIImageView alloc]init];
    [followersselectedline setImage:[UIImage imageNamed:@"textline"]];
    [MainView addSubview:followersselectedline];
    
    //month label....
    monthbutton = [[UIButton alloc]init];
    [monthbutton setTitle:@"Month" forState:UIControlStateNormal];
    [monthbutton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [monthbutton setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [monthbutton setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    monthbutton.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:18];
    [monthbutton addTarget:self action:@selector(weekcommon:) forControlEvents:UIControlEventTouchUpInside];
    monthbutton.tag = 2;
    [MainView addSubview:monthbutton];
    

    
    //alltime label....
    alltimebutton = [[UIButton alloc]init];
    [alltimebutton setTitle:@"All-time" forState:UIControlStateNormal];
    [alltimebutton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [alltimebutton setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [alltimebutton setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    alltimebutton.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:18];
    [alltimebutton addTarget:self action:@selector(weekcommon:) forControlEvents:UIControlEventTouchUpInside];
    alltimebutton.tag = 3;
    [MainView addSubview:alltimebutton];
    
    
    MainScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0.0f, 140.0f, self.view.frame.size.width, self.view.frame.size.height-140)];
    MainScroll.userInteractionEnabled=YES;
    MainScroll.scrollEnabled=YES;
    MainScroll.delegate=self;
    MainScroll.bounces=YES;
    MainScroll.showsHorizontalScrollIndicator=NO;
    [MainView addSubview:MainScroll];
    
    MainScroll.contentSize = CGSizeMake(0, 2400);
    
    //////////////////=============================///////////////////////====================
    
    //gradientview.........
    
    gradientview = [[UIImageView alloc]init];
    [gradientview setImage:[UIImage imageNamed:@"gradientview"]];
    [MainScroll addSubview:gradientview];
    
    [gradientview setFrame:CGRectMake(20, 10, self.view.frame.size.width-40, 30)];
    
    
    //scrollbackview.....
    
    UIView *tablebackview = [[UIView alloc]initWithFrame:CGRectMake(20, 40, self.view.frame.size.width-40, 700)];
    [tablebackview setBackgroundColor:[UIColor whiteColor]];
    [MainScroll addSubview:tablebackview];
    
    /////////////=====================================first part..............===================/////////////////////
    
    
    UIImageView *locationimage = [[UIImageView alloc]initWithFrame:CGRectMake(10, -10, 20, 30)];
    [locationimage setImage:[UIImage imageNamed:@"locationredicon"]];
    [tablebackview addSubview:locationimage];
    
    UILabel *kfclabl = [[UILabel alloc]initWithFrame:CGRectMake(45, -14, 50, 30)];
    [kfclabl setBackgroundColor:[UIColor clearColor]];
    [kfclabl setText:@"KFC"];
    [kfclabl setTextAlignment:NSTextAlignmentLeft];
    [kfclabl setTextColor:[UIColor blackColor]];
    [kfclabl setFont:[UIFont fontWithName:@"Helvetica" size:19]];
    [tablebackview addSubview:kfclabl];
    
    UILabel *kfclabl1 = [[UILabel alloc]initWithFrame:CGRectMake(45, 3, 200, 30)];
    [kfclabl1 setBackgroundColor:[UIColor clearColor]];
    [kfclabl1 setText:@"Lorem ipsum lorem ipsum"];
    [kfclabl1 setTextAlignment:NSTextAlignmentLeft];
    [kfclabl1 setTextColor:[UIColor blackColor]];
    [kfclabl1 setFont:[UIFont fontWithName:@"Helvetica Light" size:16]];
    [tablebackview addSubview:kfclabl1];
    
    UIImageView *pinimage = [[UIImageView alloc]init];
    [pinimage setImage:[UIImage imageNamed:@"mypinicon"]];
    [tablebackview addSubview:pinimage];
    
    UIImageView *backimage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 50, tablebackview.frame.size.width, 100)];
    [backimage setImage:[UIImage imageNamed:@"logobg"]];
    [tablebackview addSubview:backimage];
    
    
    UILabel *backlabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 5, tablebackview.frame.size.width-20, 90)];
    [backlabel setBackgroundColor:[UIColor clearColor]];
    [backlabel setText:@" Instead of focusing on all the things you don't have or all of the things you want, take a minute to think about how lucky you are compared to most people out there. Though your life may not be perfect in the moment, there are surely some things that you can be very grateful for, whether it's your loving "];
    [backlabel setTextAlignment:NSTextAlignmentLeft];
    [backlabel setTextColor:[UIColor lightGrayColor]];
    backlabel.numberOfLines = 3;
    [backlabel setFont:[UIFont fontWithName:@"Helvetica" size:16]];
    [backimage addSubview:backlabel];
    
    
    
    UILabel *backlabel1 = [[UILabel alloc]initWithFrame:CGRectMake(10, 155, tablebackview.frame.size.width-20, 200)];
    [backlabel1 setBackgroundColor:[UIColor clearColor]];
    [backlabel1 setText:@" Instead of focusing on all the things you don't have or all of the things you want, take a minute to think about how lucky you are compared to most people out there. Though your life may not be perfect in the moment, there are surely some things that you can be very grateful for, whether it's your loving. Be thankful for the air you breathe, the food that nourishes you, the quiet home you live in, the sunshine that brightens up your day. Every little detail in your life counts. Focus on those little things and be thankful that you are still alive. You could focus on the love of your pet, the amazing bakery down the street that spruces up your breakfasts, the perfect climate in your region, or your awesome library with an endless supply of books. It doesn't have to be anything earth shattering, but it does have to make you realize how much happiness is all around you."];
    [backlabel1 setTextAlignment:NSTextAlignmentLeft];
    [backlabel1 setTextColor:[UIColor lightGrayColor]];
    backlabel1.numberOfLines = 14;
    [backlabel1 setFont:[UIFont fontWithName:@"Helvetica" size:16]];
    [tablebackview addSubview:backlabel1];
    
    UIButton *seemorebutton = [UIButton buttonWithType:UIButtonTypeCustom];
    [seemorebutton setFrame:CGRectMake(10, 355, 100, 20)];
    seemorebutton.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:18];
    [seemorebutton setTitle:@"See more.." forState:UIControlStateNormal];
    [seemorebutton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [tablebackview addSubview:seemorebutton];
    
    
    
    //lineview.....
    
    UIView *lineimage = [[UIView alloc]initWithFrame:CGRectMake(10, 390, tablebackview.frame.size.width-20, 1)];
    [lineimage setBackgroundColor:[UIColor lightGrayColor]];
    [tablebackview addSubview:lineimage];
    
    
    
    mypintable=[[UITableView alloc]init];
    
    mypintable.delegate=self;
    
    mypintable.dataSource=self;
    
    mypintable.backgroundColor = [UIColor clearColor];
    
    mypintable.tag = 1;
    
    mypintable.separatorStyle=UITableViewCellSeparatorStyleNone;
    
    mypintable.showsVerticalScrollIndicator = YES;
    
    [tablebackview addSubview:mypintable];
    
    
    
    ///===================================second view.....////////////======================
    
    
    //gradientview.........
    
    gradientview1 = [[UIImageView alloc]init];
    [gradientview1 setImage:[UIImage imageNamed:@"gradientview"]];
    [MainScroll addSubview:gradientview1];
    
    [gradientview1 setFrame:CGRectMake(20, 770, self.view.frame.size.width-40, 30)];
    
    
    //scrollbackview.....
    
    UIView *tablebackview2 = [[UIView alloc]initWithFrame:CGRectMake(20, 800, self.view.frame.size.width-40, 700)];
    [tablebackview2 setBackgroundColor:[UIColor whiteColor]];
    [MainScroll addSubview:tablebackview2];
    
    UIImageView *locationimage1 = [[UIImageView alloc]initWithFrame:CGRectMake(10, -10, 20, 30)];
    [locationimage1 setImage:[UIImage imageNamed:@"locationredicon"]];
    [tablebackview2 addSubview:locationimage1];
    
    UILabel *kfclabl2 = [[UILabel alloc]initWithFrame:CGRectMake(45, -14, 50, 30)];
    [kfclabl2 setBackgroundColor:[UIColor clearColor]];
    [kfclabl2 setText:@"KFC"];
    [kfclabl2 setTextAlignment:NSTextAlignmentLeft];
    [kfclabl2 setTextColor:[UIColor blackColor]];
    [kfclabl2 setFont:[UIFont fontWithName:@"Helvetica" size:19]];
    [tablebackview2 addSubview:kfclabl2];
    
    UILabel *kfclabl3 = [[UILabel alloc]initWithFrame:CGRectMake(45, 3, 200, 30)];
    [kfclabl3 setBackgroundColor:[UIColor clearColor]];
    [kfclabl3 setText:@"Lorem ipsum lorem ipsum"];
    [kfclabl3 setTextAlignment:NSTextAlignmentLeft];
    [kfclabl3 setTextColor:[UIColor blackColor]];
    [kfclabl3 setFont:[UIFont fontWithName:@"Helvetica Light" size:16]];
    [tablebackview2 addSubview:kfclabl3];
    
    UIImageView *pinimage1 = [[UIImageView alloc]init];
    [pinimage1 setImage:[UIImage imageNamed:@"mypinicon"]];
    [tablebackview2 addSubview:pinimage1];
    
    
    if ([[UIScreen mainScreen]bounds].size.width == 320) {
        
        
        UIView *lineview = [[UIView alloc]initWithFrame:CGRectMake(tablebackview2.frame.origin.x-20, 50, tablebackview.frame.size.width, 1.0f)];
        [lineview setBackgroundColor:[UIColor lightGrayColor]];
        [tablebackview2 addSubview:lineview];
        
        UIImageView *tststar=[[UIImageView alloc]initWithFrame:CGRectMake(20,lineview.frame.origin.y+13,47-8,40-8)];
        tststar.image=[UIImage imageNamed:@"staron2"];
        [tablebackview2 addSubview:tststar];
        
        UIImageView *tststar1=[[UIImageView alloc]initWithFrame:CGRectMake(70,lineview.frame.origin.y+13,47-8,40-8)];
        tststar1.image=[UIImage imageNamed:@"staron2"];
        [tablebackview2 addSubview:tststar1];
        
        UIImageView *tststar2=[[UIImageView alloc]initWithFrame:CGRectMake(120,lineview.frame.origin.y+13,47-8,40-8)];
        tststar2.image=[UIImage imageNamed:@"staron2"];
        [tablebackview2 addSubview:tststar2];
        
        UIImageView *tststar3=[[UIImageView alloc]initWithFrame:CGRectMake(170,lineview.frame.origin.y+13,47-8,40-8)];
        tststar3.image=[UIImage imageNamed:@"staron2"];
        [tablebackview2 addSubview:tststar3];
        
        UIImageView *tststar4=[[UIImageView alloc]initWithFrame:CGRectMake(220,lineview.frame.origin.y+13,47-8,40-8)];
        tststar4.image=[UIImage imageNamed:@"staroff2"];
        [tablebackview2 addSubview:tststar4];
        
        UIView *lineviewscnd = [[UIView alloc]initWithFrame:CGRectMake(tablebackview2.frame.origin.x-20, 100, tablebackview.frame.size.width, 1.0f)];
        [lineviewscnd setBackgroundColor:[UIColor lightGrayColor]];
        [tablebackview2 addSubview:lineviewscnd];
        
        
        UILabel *test=[[UILabel alloc]initWithFrame:CGRectMake(25,lineviewscnd.frame.origin.y+4,100,40)];
        test.text=@"Test";
        test.textColor=[UIColor lightGrayColor];
        test.textAlignment=NSTextAlignmentLeft;
        test.font=[UIFont fontWithName:@"Helvetica" size:18];
        [tablebackview2 addSubview:test];
        
        /*----------------- Test star design---------- */
        
        UIImageView *teststar1=[[UIImageView alloc]initWithFrame:CGRectMake(130,lineviewscnd.frame.origin.y+10,33-8,30-8)];
        teststar1.image=[UIImage imageNamed:@"staron2"];
        [tablebackview2 addSubview:teststar1];
        
        teststar1=[[UIImageView alloc]initWithFrame:CGRectMake(160,lineviewscnd.frame.origin.y+10,33-8,30-8)];
        teststar1.image=[UIImage imageNamed:@"staron2"];
        [tablebackview2 addSubview:teststar1];
        
        teststar1=[[UIImageView alloc]initWithFrame:CGRectMake(190,lineviewscnd.frame.origin.y+10,33-8,30-8)];
        teststar1.image=[UIImage imageNamed:@"staron2"];
        [tablebackview2 addSubview:teststar1];
        
        teststar1=[[UIImageView alloc]initWithFrame:CGRectMake(220,lineviewscnd.frame.origin.y+10,33-8,30-8)];
        teststar1.image=[UIImage imageNamed:@"staron2"];
        [tablebackview2 addSubview:teststar1];
        
        teststar1=[[UIImageView alloc]initWithFrame:CGRectMake(250,lineviewscnd.frame.origin.y+10,33-8,30-8)];
        teststar1.image=[UIImage imageNamed:@"staroff2"];
        [tablebackview2 addSubview:teststar1];
        
        
        
        
        
        
        ////-----------------------------------------//////
        
        UIImageView *devider=[[UIImageView alloc]initWithFrame:CGRectMake(6,test.frame.origin.y+40,270,2)];
        devider.image=[UIImage imageNamed:@"lineimg"];
        [tablebackview2 addSubview:devider];
        
        UILabel *Service=[[UILabel alloc]initWithFrame:CGRectMake(25,test.frame.origin.y+45,100,40)];
        Service.text=@"Service";
        Service.textColor=[UIColor lightGrayColor];
        Service.textAlignment=NSTextAlignmentLeft;
        Service.font=[UIFont fontWithName:@"Helvetica" size:18];
        [tablebackview2 addSubview:Service];
        
        /*----------------- Service star design----------------- */
        
        UIImageView *servicestar1=[[UIImageView alloc]initWithFrame:CGRectMake(130,test.frame.origin.y+49,33-8,30-8)];
        servicestar1.image=[UIImage imageNamed:@"staron2"];
        [tablebackview2 addSubview:servicestar1];
        
        servicestar1=[[UIImageView alloc]initWithFrame:CGRectMake(160,test.frame.origin.y+49,33-8,30-8)];
        servicestar1.image=[UIImage imageNamed:@"staron2"];
        [tablebackview2 addSubview:servicestar1];
        
        servicestar1=[[UIImageView alloc]initWithFrame:CGRectMake(190,test.frame.origin.y+49,33-8,30-8)];
        servicestar1.image=[UIImage imageNamed:@"staron2"];
        [tablebackview2 addSubview:servicestar1];
        
        servicestar1=[[UIImageView alloc]initWithFrame:CGRectMake(220,test.frame.origin.y+49,33-8,30-8)];
        servicestar1.image=[UIImage imageNamed:@"staroff2"];
        [tablebackview2 addSubview:servicestar1];
        
        servicestar1=[[UIImageView alloc]initWithFrame:CGRectMake(250,test.frame.origin.y+49,33-8,30-8)];
        servicestar1.image=[UIImage imageNamed:@"staroff2"];
        [tablebackview2 addSubview:servicestar1];
        
        /////---------------------------------------------------/////
        
        UIImageView *devider2=[[UIImageView alloc]initWithFrame:CGRectMake(6,Service.frame.origin.y+40,270,2)];
        devider2.image=[UIImage imageNamed:@"lineimg"];
        [tablebackview2 addSubview:devider2];
        
        
        UILabel *Presentation=[[UILabel alloc]initWithFrame:CGRectMake(25,Service.frame.origin.y+45,110,40)];
        Presentation.text=@"Presentation";
        Presentation.textColor=[UIColor lightGrayColor];
        Presentation.textAlignment=NSTextAlignmentLeft;
        Presentation.font=[UIFont fontWithName:@"Helvetica" size:18];
        [tablebackview2 addSubview:Presentation];
        
        /*----------------- Presentation star design----------------- */
        
        UIImageView *presentationstar1=[[UIImageView alloc]initWithFrame:CGRectMake(130,Service.frame.origin.y+49,33-8,30-8)];
        presentationstar1.image=[UIImage imageNamed:@"staron2"];
        [tablebackview2 addSubview:presentationstar1];
        
        presentationstar1=[[UIImageView alloc]initWithFrame:CGRectMake(160,Service.frame.origin.y+49,33-8,30-8)];
        presentationstar1.image=[UIImage imageNamed:@"staron2"];
        [tablebackview2 addSubview:presentationstar1];
        
        presentationstar1=[[UIImageView alloc]initWithFrame:CGRectMake(190,Service.frame.origin.y+49,33-8,30-8)];
        presentationstar1.image=[UIImage imageNamed:@"staron2"];
        [tablebackview2 addSubview:presentationstar1];
        
        presentationstar1=[[UIImageView alloc]initWithFrame:CGRectMake(220,Service.frame.origin.y+49,33-8,30-8)];
        presentationstar1.image=[UIImage imageNamed:@"staron2"];
        [tablebackview2 addSubview:presentationstar1];
        
        presentationstar1=[[UIImageView alloc]initWithFrame:CGRectMake(250,Service.frame.origin.y+49,33-8,30-8)];
        presentationstar1.image=[UIImage imageNamed:@"staron2"];
        [tablebackview2 addSubview:presentationstar1];
        
        
        ///////////----------------------------------------///////////
        
        UIImageView *devider3=[[UIImageView alloc]initWithFrame:CGRectMake(6,Presentation.frame.origin.y+40,270,2)];
        devider3.image=[UIImage imageNamed:@"lineimg"];
        [tablebackview2 addSubview:devider3];
        
        UILabel *Atmosphere=[[UILabel alloc]initWithFrame:CGRectMake(25,Presentation.frame.origin.y+45,110,40)];
        Atmosphere.text=@"Atmosphere";
        Atmosphere.textColor=[UIColor lightGrayColor];
        Atmosphere.textAlignment=NSTextAlignmentLeft;
        Atmosphere.font=[UIFont fontWithName:@"Helvetica" size:18];
        [tablebackview2 addSubview:Atmosphere];
        
        /*----------------- Atmos star design----------------- */
        
        UIImageView *atmosstar1=[[UIImageView alloc]initWithFrame:CGRectMake(130,Presentation.frame.origin.y+49,33-8,30-8)];
        atmosstar1.image=[UIImage imageNamed:@"staron2"];
        [tablebackview2 addSubview:atmosstar1];
        
        atmosstar1=[[UIImageView alloc]initWithFrame:CGRectMake(160,Presentation.frame.origin.y+49,33-8,30-8)];
        atmosstar1.image=[UIImage imageNamed:@"staron2"];
        [tablebackview2 addSubview:atmosstar1];
        
        atmosstar1=[[UIImageView alloc]initWithFrame:CGRectMake(190,Presentation.frame.origin.y+49,33-8,30-8)];
        atmosstar1.image=[UIImage imageNamed:@"staron2"];
        [tablebackview2 addSubview:atmosstar1];
        
        atmosstar1=[[UIImageView alloc]initWithFrame:CGRectMake(220,Presentation.frame.origin.y+49,33-8,30-8)];
        atmosstar1.image=[UIImage imageNamed:@"staron2"];
        [tablebackview2 addSubview:atmosstar1];
        
        atmosstar1=[[UIImageView alloc]initWithFrame:CGRectMake(250,Presentation.frame.origin.y+49,33-8,30-8)];
        atmosstar1.image=[UIImage imageNamed:@"staroff2"];
        [tablebackview2 addSubview:atmosstar1];
        
        ///////////----------------------------------------///////////
        
        
        
        
        UIImageView *backimage = [[UIImageView alloc]initWithFrame:CGRectMake(0, atmosstar1.frame.origin.y+40, tablebackview2.frame.size.width, 80)];
        [backimage setImage:[UIImage imageNamed:@"logobg"]];
        [tablebackview2 addSubview:backimage];
        
        UILabel *backlabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 5, tablebackview.frame.size.width-20, 90)];
        [backlabel setBackgroundColor:[UIColor clearColor]];
        [backlabel setText:@" Instead of focusing on all the things you don't have or all of the things you want, take a minute to think about how lucky you are compared to most people out there. Though your life may not be perfect in the moment, there are surely some things that you can be very grateful for, whether it's your loving "];
        [backlabel setTextAlignment:NSTextAlignmentLeft];
        [backlabel setTextColor:[UIColor lightGrayColor]];
        backlabel.numberOfLines = 2;
        [backlabel setFont:[UIFont fontWithName:@"Helvetica" size:16]];
        [backimage addSubview:backlabel];
        
        
        UILabel *populartag=[[UILabel alloc]initWithFrame:CGRectMake(2,backimage.frame.origin.y+95,99,40)];
        populartag.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"tagimg3"]];
        populartag.text=@"# food";
        populartag.textColor=[UIColor lightGrayColor];
        populartag.textAlignment=NSTextAlignmentCenter;
        populartag.font=[UIFont fontWithName:@"Helvetica" size:19];
        [tablebackview2 addSubview:populartag];
        
        UILabel *populartag1=[[UILabel alloc]initWithFrame:CGRectMake(105,backimage.frame.origin.y+95,99,40)];
        populartag1.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"tagimg3"]];
        populartag1.text=@"# restaurant";
        populartag1.textColor=[UIColor lightGrayColor];
        populartag1.textAlignment=NSTextAlignmentCenter;
        populartag1.font=[UIFont fontWithName:@"Helvetica" size:15];
        [tablebackview2 addSubview:populartag1];
        
        UILabel *populartag4=[[UILabel alloc]initWithFrame:CGRectMake(205,backimage.frame.origin.y+95,77,40)];
        populartag4.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"tagimg3"]];
        populartag4.text=@"# hot";
        populartag4.textColor=[UIColor lightGrayColor];
        populartag4.textAlignment=NSTextAlignmentCenter;
        populartag4.font=[UIFont fontWithName:@"Helvetica" size:19];
        [tablebackview2 addSubview:populartag4];
        
        UILabel *populartag2=[[UILabel alloc]initWithFrame:CGRectMake(0,backimage.frame.origin.y+95+50,153,40)];
        populartag2.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"tagimg2"]];
        populartag2.text=@"# chicken";
        populartag2.textColor=[UIColor lightGrayColor];
        populartag2.textAlignment=NSTextAlignmentCenter;
        populartag2.font=[UIFont fontWithName:@"Helvetica" size:19];
        [tablebackview2 addSubview:populartag2];
        
        UILabel *populartag3=[[UILabel alloc]initWithFrame:CGRectMake(155,backimage.frame.origin.y+95+50,124,40)];
        populartag3.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"tagimg"]];
        populartag3.text=@"# hangout";
        populartag3.textColor=[UIColor lightGrayColor];
        populartag3.textAlignment=NSTextAlignmentCenter;
        populartag3.font=[UIFont fontWithName:@"Helvetica" size:19];
        [tablebackview2 addSubview:populartag3];
    }
    else
    {
        
        UIView *lineview = [[UIView alloc]initWithFrame:CGRectMake(tablebackview2.frame.origin.x-20, 50, tablebackview.frame.size.width, 1.0f)];
        [lineview setBackgroundColor:[UIColor lightGrayColor]];
        [tablebackview2 addSubview:lineview];
        
        UIImageView *tststar=[[UIImageView alloc]initWithFrame:CGRectMake(40,lineview.frame.origin.y+13,47-8,40-8)];
        tststar.image=[UIImage imageNamed:@"staron2"];
        [tablebackview2 addSubview:tststar];
        
        UIImageView *tststar1=[[UIImageView alloc]initWithFrame:CGRectMake(100,lineview.frame.origin.y+13,47-8,40-8)];
        tststar1.image=[UIImage imageNamed:@"staron2"];
        [tablebackview2 addSubview:tststar1];
        
        UIImageView *tststar2=[[UIImageView alloc]initWithFrame:CGRectMake(160,lineview.frame.origin.y+13,47-8,40-8)];
        tststar2.image=[UIImage imageNamed:@"staron2"];
        [tablebackview2 addSubview:tststar2];
        
        UIImageView *tststar3=[[UIImageView alloc]initWithFrame:CGRectMake(220,lineview.frame.origin.y+13,47-8,40-8)];
        tststar3.image=[UIImage imageNamed:@"staron2"];
        [tablebackview2 addSubview:tststar3];
        
        UIImageView *tststar4=[[UIImageView alloc]initWithFrame:CGRectMake(280,lineview.frame.origin.y+13,47-8,40-8)];
        tststar4.image=[UIImage imageNamed:@"staroff2"];
        [tablebackview2 addSubview:tststar4];
        
        UIView *lineviewscnd = [[UIView alloc]initWithFrame:CGRectMake(tablebackview2.frame.origin.x-20, 100, tablebackview.frame.size.width, 1.0f)];
        [lineviewscnd setBackgroundColor:[UIColor lightGrayColor]];
        [tablebackview2 addSubview:lineviewscnd];
        
        
        UILabel *test=[[UILabel alloc]initWithFrame:CGRectMake(25,lineviewscnd.frame.origin.y+4,100,40)];
        test.text=@"Test";
        test.textColor=[UIColor lightGrayColor];
        test.textAlignment=NSTextAlignmentLeft;
        test.font=[UIFont fontWithName:@"Helvetica" size:18];
        [tablebackview2 addSubview:test];
        
        /*----------------- Test star design---------- */
        
        UIImageView *teststar1=[[UIImageView alloc]initWithFrame:CGRectMake(150,lineviewscnd.frame.origin.y+10,33-8,30-8)];
        teststar1.image=[UIImage imageNamed:@"staron2"];
        [tablebackview2 addSubview:teststar1];
        
        teststar1=[[UIImageView alloc]initWithFrame:CGRectMake(180,lineviewscnd.frame.origin.y+10,33-8,30-8)];
        teststar1.image=[UIImage imageNamed:@"staron2"];
        [tablebackview2 addSubview:teststar1];
        
        teststar1=[[UIImageView alloc]initWithFrame:CGRectMake(210,lineviewscnd.frame.origin.y+10,33-8,30-8)];
        teststar1.image=[UIImage imageNamed:@"staron2"];
        [tablebackview2 addSubview:teststar1];
        
        teststar1=[[UIImageView alloc]initWithFrame:CGRectMake(240,lineviewscnd.frame.origin.y+10,33-8,30-8)];
        teststar1.image=[UIImage imageNamed:@"staron2"];
        [tablebackview2 addSubview:teststar1];
        
        teststar1=[[UIImageView alloc]initWithFrame:CGRectMake(270,lineviewscnd.frame.origin.y+10,33-8,30-8)];
        teststar1.image=[UIImage imageNamed:@"staroff2"];
        [tablebackview2 addSubview:teststar1];
        
        
        ////-----------------------------------------//////
        
        UIImageView *devider=[[UIImageView alloc]initWithFrame:CGRectMake(6,test.frame.origin.y+40,330,2)];
        devider.image=[UIImage imageNamed:@"lineimg"];
        [tablebackview2 addSubview:devider];
        
        UILabel *Service=[[UILabel alloc]initWithFrame:CGRectMake(25,test.frame.origin.y+45,100,40)];
        Service.text=@"Service";
        Service.textColor=[UIColor lightGrayColor];
        Service.textAlignment=NSTextAlignmentLeft;
        Service.font=[UIFont fontWithName:@"Helvetica" size:18];
        [tablebackview2 addSubview:Service];
        
        /*----------------- Service star design----------------- */
        
        UIImageView *servicestar1=[[UIImageView alloc]initWithFrame:CGRectMake(150,test.frame.origin.y+49,33-8,30-8)];
        servicestar1.image=[UIImage imageNamed:@"staron2"];
        [tablebackview2 addSubview:servicestar1];
        
        servicestar1=[[UIImageView alloc]initWithFrame:CGRectMake(180,test.frame.origin.y+49,33-8,30-8)];
        servicestar1.image=[UIImage imageNamed:@"staron2"];
        [tablebackview2 addSubview:servicestar1];
        
        servicestar1=[[UIImageView alloc]initWithFrame:CGRectMake(210,test.frame.origin.y+49,33-8,30-8)];
        servicestar1.image=[UIImage imageNamed:@"staron2"];
        [tablebackview2 addSubview:servicestar1];
        
        servicestar1=[[UIImageView alloc]initWithFrame:CGRectMake(240,test.frame.origin.y+49,33-8,30-8)];
        servicestar1.image=[UIImage imageNamed:@"staroff2"];
        [tablebackview2 addSubview:servicestar1];
        
        servicestar1=[[UIImageView alloc]initWithFrame:CGRectMake(270,test.frame.origin.y+49,33-8,30-8)];
        servicestar1.image=[UIImage imageNamed:@"staroff2"];
        [tablebackview2 addSubview:servicestar1];
        
        /////---------------------------------------------------/////
        
        UIImageView *devider2=[[UIImageView alloc]initWithFrame:CGRectMake(6,Service.frame.origin.y+40,330,2)];
        devider2.image=[UIImage imageNamed:@"lineimg"];
        [tablebackview2 addSubview:devider2];
        
        
        UILabel *Presentation=[[UILabel alloc]initWithFrame:CGRectMake(25,Service.frame.origin.y+45,110,40)];
        Presentation.text=@"Presentation";
        Presentation.textColor=[UIColor lightGrayColor];
        Presentation.textAlignment=NSTextAlignmentLeft;
        Presentation.font=[UIFont fontWithName:@"Helvetica" size:18];
        [tablebackview2 addSubview:Presentation];
        
        /*----------------- Presentation star design----------------- */
        
        UIImageView *presentationstar1=[[UIImageView alloc]initWithFrame:CGRectMake(150,Service.frame.origin.y+49,33-8,30-8)];
        presentationstar1.image=[UIImage imageNamed:@"staron2"];
        [tablebackview2 addSubview:presentationstar1];
        
        presentationstar1=[[UIImageView alloc]initWithFrame:CGRectMake(180,Service.frame.origin.y+49,33-8,30-8)];
        presentationstar1.image=[UIImage imageNamed:@"staron2"];
        [tablebackview2 addSubview:presentationstar1];
        
        presentationstar1=[[UIImageView alloc]initWithFrame:CGRectMake(210,Service.frame.origin.y+49,33-8,30-8)];
        presentationstar1.image=[UIImage imageNamed:@"staron2"];
        [tablebackview2 addSubview:presentationstar1];
        
        presentationstar1=[[UIImageView alloc]initWithFrame:CGRectMake(240,Service.frame.origin.y+49,33-8,30-8)];
        presentationstar1.image=[UIImage imageNamed:@"staron2"];
        [tablebackview2 addSubview:presentationstar1];
        
        presentationstar1=[[UIImageView alloc]initWithFrame:CGRectMake(270,Service.frame.origin.y+49,33-8,30-8)];
        presentationstar1.image=[UIImage imageNamed:@"staron2"];
        [tablebackview2 addSubview:presentationstar1];
        
        
        ///////////----------------------------------------///////////
        
        UIImageView *devider3=[[UIImageView alloc]initWithFrame:CGRectMake(6,Presentation.frame.origin.y+40,330,2)];
        devider3.image=[UIImage imageNamed:@"lineimg"];
        [tablebackview2 addSubview:devider3];
        
        UILabel *Atmosphere=[[UILabel alloc]initWithFrame:CGRectMake(25,Presentation.frame.origin.y+45,110,40)];
        Atmosphere.text=@"Atmosphere";
        Atmosphere.textColor=[UIColor lightGrayColor];
        Atmosphere.textAlignment=NSTextAlignmentLeft;
        Atmosphere.font=[UIFont fontWithName:@"Helvetica" size:18];
        [tablebackview2 addSubview:Atmosphere];
        
        /*----------------- Atmos star design----------------- */
        
        UIImageView *atmosstar1=[[UIImageView alloc]initWithFrame:CGRectMake(150,Presentation.frame.origin.y+49,33-8,30-8)];
        atmosstar1.image=[UIImage imageNamed:@"staron2"];
        [tablebackview2 addSubview:atmosstar1];
        
        atmosstar1=[[UIImageView alloc]initWithFrame:CGRectMake(180,Presentation.frame.origin.y+49,33-8,30-8)];
        atmosstar1.image=[UIImage imageNamed:@"staron2"];
        [tablebackview2 addSubview:atmosstar1];
        
        atmosstar1=[[UIImageView alloc]initWithFrame:CGRectMake(210,Presentation.frame.origin.y+49,33-8,30-8)];
        atmosstar1.image=[UIImage imageNamed:@"staron2"];
        [tablebackview2 addSubview:atmosstar1];
        
        atmosstar1=[[UIImageView alloc]initWithFrame:CGRectMake(240,Presentation.frame.origin.y+49,33-8,30-8)];
        atmosstar1.image=[UIImage imageNamed:@"staron2"];
        [tablebackview2 addSubview:atmosstar1];
        
        atmosstar1=[[UIImageView alloc]initWithFrame:CGRectMake(270,Presentation.frame.origin.y+49,33-8,30-8)];
        atmosstar1.image=[UIImage imageNamed:@"staroff2"];
        [tablebackview2 addSubview:atmosstar1];
        
        ///////////----------------------------------------///////////
        
        
        UIImageView *backimage = [[UIImageView alloc]initWithFrame:CGRectMake(0, atmosstar1.frame.origin.y+40, tablebackview2.frame.size.width, 80)];
        [backimage setImage:[UIImage imageNamed:@"logobg"]];
        [tablebackview2 addSubview:backimage];
        
        UILabel *backlabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 5, tablebackview.frame.size.width-20, 90)];
        [backlabel setBackgroundColor:[UIColor clearColor]];
        [backlabel setText:@" Instead of focusing on all the things you don't have or all of the things you want, take a minute to think about how lucky you are compared to most people out there. Though your life may not be perfect in the moment, there are surely some things that you can be very grateful for, whether it's your loving "];
        [backlabel setTextAlignment:NSTextAlignmentLeft];
        [backlabel setTextColor:[UIColor lightGrayColor]];
        backlabel.numberOfLines = 2;
        [backlabel setFont:[UIFont fontWithName:@"Helvetica" size:16]];
        [backimage addSubview:backlabel];
        
        
        UILabel *feedtag=[[UILabel alloc]initWithFrame:CGRectMake(10,backimage.frame.origin.y+95,99,40)];
        feedtag.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"tagimg3"]];
        feedtag.text=@"# food";
        feedtag.textColor=[UIColor lightGrayColor];
        feedtag.textAlignment=NSTextAlignmentCenter;
        feedtag.font=[UIFont fontWithName:@"Helvetica" size:19];
        [tablebackview2 addSubview:feedtag];
        
        UILabel *feedtag1=[[UILabel alloc]initWithFrame:CGRectMake(115,backimage.frame.origin.y+95,99,40)];
        feedtag1.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"tagimg3"]];
        feedtag1.text=@"# restaurant";
        feedtag1.textColor=[UIColor lightGrayColor];
        feedtag1.textAlignment=NSTextAlignmentCenter;
        feedtag1.font=[UIFont fontWithName:@"Helvetica" size:15];
        [tablebackview2 addSubview:feedtag1];
        
        UILabel *feedtag4=[[UILabel alloc]initWithFrame:CGRectMake(220,backimage.frame.origin.y+95,99,40)];
        feedtag4.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"tagimg3"]];
        feedtag4.text=@"# hot";
        feedtag4.textColor=[UIColor lightGrayColor];
        feedtag4.textAlignment=NSTextAlignmentCenter;
        feedtag4.font=[UIFont fontWithName:@"Helvetica" size:19];
        [tablebackview2 addSubview:feedtag4];
        
        UILabel *feedtag2=[[UILabel alloc]initWithFrame:CGRectMake(10,backimage.frame.origin.y+95+50,153,40)];
        feedtag2.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"tagimg2"]];
        feedtag2.text=@"# chicken";
        feedtag2.textColor=[UIColor lightGrayColor];
        feedtag2.textAlignment=NSTextAlignmentCenter;
        feedtag2.font=[UIFont fontWithName:@"Helvetica" size:19];
        [tablebackview2 addSubview:feedtag2];
        
        UILabel *feedtag3=[[UILabel alloc]initWithFrame:CGRectMake(169,backimage.frame.origin.y+95+50,124,40)];
        feedtag3.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"tagimg"]];
        feedtag3.text=@"# hangout";
        feedtag3.textColor=[UIColor lightGrayColor];
        feedtag3.textAlignment=NSTextAlignmentCenter;
        feedtag3.font=[UIFont fontWithName:@"Helvetica" size:19];
        [tablebackview2 addSubview:feedtag3];
        
        
    }
    
    mypintable2=[[UITableView alloc]init];
    
    mypintable2.delegate=self;
    
    mypintable2.dataSource=self;
    
    mypintable2.backgroundColor = [UIColor clearColor];
    
    mypintable2.tag = 1;
    
    mypintable2.separatorStyle=UITableViewCellSeparatorStyleNone;
    
    mypintable2.showsVerticalScrollIndicator = YES;
    
    [tablebackview2 addSubview:mypintable2];
    
    //////////////===========================/////////////////================
    
    
    ///////////////====================================third section...........=======================//////////////////////////
    
    
    //gradientview.........
    
    UIImageView *gradientimage = [[UIImageView alloc]init];
    [gradientimage setImage:[UIImage imageNamed:@"gradientview"]];
    [MainScroll addSubview:gradientimage];
    
    [gradientimage setFrame:CGRectMake(20, 1550, self.view.frame.size.width-40, 30)];
    
    
    //scrollbackview.....
    
    UIView *tablebackview3 = [[UIView alloc]initWithFrame:CGRectMake(20, 1580, self.view.frame.size.width-40, 800)];
    [tablebackview3 setBackgroundColor:[UIColor whiteColor]];
    [MainScroll addSubview:tablebackview3];
    
    UIImageView *locationimage2 = [[UIImageView alloc]initWithFrame:CGRectMake(10, -10, 20, 30)];
    [locationimage2 setImage:[UIImage imageNamed:@"locationredicon"]];
    [tablebackview3 addSubview:locationimage2];
    
    UILabel *kfclabl4 = [[UILabel alloc]initWithFrame:CGRectMake(45, -14, 50, 30)];
    [kfclabl4 setBackgroundColor:[UIColor clearColor]];
    [kfclabl4 setText:@"KFC"];
    [kfclabl4 setTextAlignment:NSTextAlignmentLeft];
    [kfclabl4 setTextColor:[UIColor blackColor]];
    [kfclabl4 setFont:[UIFont fontWithName:@"Helvetica" size:19]];
    [tablebackview3 addSubview:kfclabl4];
    
    UILabel *kfclabl5 = [[UILabel alloc]initWithFrame:CGRectMake(45, 3, 200, 30)];
    [kfclabl5 setBackgroundColor:[UIColor clearColor]];
    [kfclabl5 setText:@"Lorem ipsum lorem ipsum"];
    [kfclabl5 setTextAlignment:NSTextAlignmentLeft];
    [kfclabl5 setTextColor:[UIColor blackColor]];
    [kfclabl5 setFont:[UIFont fontWithName:@"Helvetica Light" size:16]];
    [tablebackview3 addSubview:kfclabl5];
    
    UIImageView *pinimage2 = [[UIImageView alloc]init];
    [pinimage2 setImage:[UIImage imageNamed:@"mypinicon"]];
    [tablebackview3 addSubview:pinimage2];
    
    
    UIView *linevie5 = [[UIView alloc]initWithFrame:CGRectMake(tablebackview3.frame.origin.x-20, 50, tablebackview3.frame.size.width, 1.0f)];
    [linevie5 setBackgroundColor:[UIColor lightGrayColor]];
    [tablebackview3 addSubview:linevie5];
    
    
    UIImageView *myfeeddisplayimage=[[UIImageView alloc]initWithFrame:CGRectMake(tablebackview3.frame.origin.x,65,tablebackview3.frame.size.width-40,330-100)];
    
    myfeeddisplayimage.image=[UIImage imageNamed:@"myfeeddisplayimage"];
    
    [tablebackview3 addSubview:myfeeddisplayimage];
    
    
    
    UIImageView *myfeedinfolbl=[[UIImageView alloc]initWithFrame:CGRectMake(tablebackview3.frame.origin.x,350-65,tablebackview3.frame.size.width-40,60)];
    
    myfeedinfolbl.image=[UIImage imageNamed:@"redlbl"];
    
    [tablebackview3 addSubview:myfeedinfolbl];
    
    
    
    UILabel *feeditemname=[[UILabel alloc]initWithFrame:CGRectMake(5,0,140,60)];
    
    feeditemname.text=@"Crispi Chicken";
    
    feeditemname.textColor=[UIColor whiteColor];
    
    feeditemname.textAlignment=NSTextAlignmentCenter;
    
    feeditemname.font=[UIFont fontWithName:@"Helvetica Bold" size:18];
    
    [myfeedinfolbl addSubview:feeditemname];
    
    
    
    UILabel *feeditemprice=[[UILabel alloc]init];
    
    feeditemprice.text=@"50.00";
    
    feeditemprice.textColor=[UIColor whiteColor];
    
    feeditemprice.textAlignment=NSTextAlignmentCenter;
    
    feeditemprice.font=[UIFont fontWithName:@"Helvetica Bold" size:19];
    
    [myfeedinfolbl addSubview:feeditemprice];
    
    
    if ([[UIScreen mainScreen]bounds].size.width == 320) {
        
        UIImageView *backimage = [[UIImageView alloc]initWithFrame:CGRectMake(0, myfeedinfolbl.frame.origin.y+70, tablebackview3.frame.size.width, 80)];
        [backimage setImage:[UIImage imageNamed:@"logobg"]];
        [tablebackview3 addSubview:backimage];
        
        UILabel *backlabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 5, tablebackview3.frame.size.width-20, 70)];
        [backlabel setBackgroundColor:[UIColor clearColor]];
        [backlabel setText:@" Instead of focusing on all the things you don't have or all of the things you want, take a minute to think about how lucky you are compared to most people out there. Though your life may not be perfect in the moment, there are surely some things that you can be very grateful for, whether it's your loving "];
        [backlabel setTextAlignment:NSTextAlignmentLeft];
        [backlabel setTextColor:[UIColor lightGrayColor]];
        backlabel.numberOfLines = 2;
        [backlabel setFont:[UIFont fontWithName:@"Helvetica" size:16]];
        [backimage addSubview:backlabel];
        
        
        UILabel *populartag=[[UILabel alloc]initWithFrame:CGRectMake(2,backimage.frame.origin.y+95,99,40)];
        populartag.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"tagimg3"]];
        populartag.text=@"# food";
        populartag.textColor=[UIColor lightGrayColor];
        populartag.textAlignment=NSTextAlignmentCenter;
        populartag.font=[UIFont fontWithName:@"Helvetica" size:19];
        [tablebackview3 addSubview:populartag];
        
        UILabel *populartag1=[[UILabel alloc]initWithFrame:CGRectMake(105,backimage.frame.origin.y+95,99,40)];
        populartag1.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"tagimg3"]];
        populartag1.text=@"# restaurant";
        populartag1.textColor=[UIColor lightGrayColor];
        populartag1.textAlignment=NSTextAlignmentCenter;
        populartag1.font=[UIFont fontWithName:@"Helvetica" size:15];
        [tablebackview3 addSubview:populartag1];
        
        UILabel *populartag4=[[UILabel alloc]initWithFrame:CGRectMake(205,backimage.frame.origin.y+95,77,40)];
        populartag4.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"tagimg3"]];
        populartag4.text=@"# hot";
        populartag4.textColor=[UIColor lightGrayColor];
        populartag4.textAlignment=NSTextAlignmentCenter;
        populartag4.font=[UIFont fontWithName:@"Helvetica" size:19];
        [tablebackview3 addSubview:populartag4];
        
        UILabel *populartag2=[[UILabel alloc]initWithFrame:CGRectMake(0,backimage.frame.origin.y+95+50,153,40)];
        populartag2.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"tagimg2"]];
        populartag2.text=@"# chicken";
        populartag2.textColor=[UIColor lightGrayColor];
        populartag2.textAlignment=NSTextAlignmentCenter;
        populartag2.font=[UIFont fontWithName:@"Helvetica" size:19];
        [tablebackview3 addSubview:populartag2];
        
        UILabel *populartag3=[[UILabel alloc]initWithFrame:CGRectMake(155,backimage.frame.origin.y+95+50,124,40)];
        populartag3.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"tagimg"]];
        populartag3.text=@"# hangout";
        populartag3.textColor=[UIColor lightGrayColor];
        populartag3.textAlignment=NSTextAlignmentCenter;
        populartag3.font=[UIFont fontWithName:@"Helvetica" size:19];
        [tablebackview3 addSubview:populartag3];
        
    }
    else
    {
        UIImageView *backimage = [[UIImageView alloc]initWithFrame:CGRectMake(0, myfeedinfolbl.frame.origin.y+70, tablebackview3.frame.size.width, 80)];
        [backimage setImage:[UIImage imageNamed:@"logobg"]];
        [tablebackview3 addSubview:backimage];
        
        UILabel *backlabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 5, tablebackview3.frame.size.width-20, 70)];
        [backlabel setBackgroundColor:[UIColor clearColor]];
        [backlabel setText:@" Instead of focusing on all the things you don't have or all of the things you want, take a minute to think about how lucky you are compared to most people out there. Though your life may not be perfect in the moment, there are surely some things that you can be very grateful for, whether it's your loving "];
        [backlabel setTextAlignment:NSTextAlignmentLeft];
        [backlabel setTextColor:[UIColor lightGrayColor]];
        backlabel.numberOfLines = 2;
        [backlabel setFont:[UIFont fontWithName:@"Helvetica" size:16]];
        [backimage addSubview:backlabel];
        
        
        UILabel *feedtag=[[UILabel alloc]initWithFrame:CGRectMake(10,backimage.frame.origin.y+95,99,40)];
        feedtag.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"tagimg3"]];
        feedtag.text=@"# food";
        feedtag.textColor=[UIColor lightGrayColor];
        feedtag.textAlignment=NSTextAlignmentCenter;
        feedtag.font=[UIFont fontWithName:@"Helvetica" size:19];
        [tablebackview3 addSubview:feedtag];
        
        UILabel *feedtag1=[[UILabel alloc]initWithFrame:CGRectMake(115,backimage.frame.origin.y+95,99,40)];
        feedtag1.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"tagimg3"]];
        feedtag1.text=@"# restaurant";
        feedtag1.textColor=[UIColor lightGrayColor];
        feedtag1.textAlignment=NSTextAlignmentCenter;
        feedtag1.font=[UIFont fontWithName:@"Helvetica" size:15];
        [tablebackview3 addSubview:feedtag1];
        
        UILabel *feedtag4=[[UILabel alloc]initWithFrame:CGRectMake(220,backimage.frame.origin.y+95,99,40)];
        feedtag4.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"tagimg3"]];
        feedtag4.text=@"# hot";
        feedtag4.textColor=[UIColor lightGrayColor];
        feedtag4.textAlignment=NSTextAlignmentCenter;
        feedtag4.font=[UIFont fontWithName:@"Helvetica" size:19];
        [tablebackview3 addSubview:feedtag4];
        
        UILabel *feedtag2=[[UILabel alloc]initWithFrame:CGRectMake(10,backimage.frame.origin.y+95+50,153,40)];
        feedtag2.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"tagimg2"]];
        feedtag2.text=@"# chicken";
        feedtag2.textColor=[UIColor lightGrayColor];
        feedtag2.textAlignment=NSTextAlignmentCenter;
        feedtag2.font=[UIFont fontWithName:@"Helvetica" size:19];
        [tablebackview3 addSubview:feedtag2];
        
        UILabel *feedtag3=[[UILabel alloc]initWithFrame:CGRectMake(169,backimage.frame.origin.y+95+50,124,40)];
        feedtag3.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"tagimg"]];
        feedtag3.text=@"# hangout";
        feedtag3.textColor=[UIColor lightGrayColor];
        feedtag3.textAlignment=NSTextAlignmentCenter;
        feedtag3.font=[UIFont fontWithName:@"Helvetica" size:19];
        [tablebackview3 addSubview:feedtag3];
        
    }
    
    
    //////////////////////////==================================end section======/////////////////////////=========================
    
    
    
    mypintable3=[[UITableView alloc]init];
    
    mypintable3.delegate=self;
    
    mypintable3.dataSource=self;
    
    mypintable3.backgroundColor = [UIColor clearColor];
    
    mypintable3.tag = 1;
    
    mypintable3.separatorStyle=UITableViewCellSeparatorStyleNone;
    
    mypintable3.showsVerticalScrollIndicator = YES;
    
    [tablebackview3 addSubview:mypintable3];
    ///==
    
    
    if ([[UIScreen mainScreen]bounds].size.width == 320)
    {
        
        UILabel *pintag=[[UILabel alloc]initWithFrame:CGRectMake(0,405,99,40)];
        pintag.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"tagimg3"]];
        pintag.text=@"# food";
        pintag.textColor=[UIColor lightGrayColor];
        pintag.textAlignment=NSTextAlignmentCenter;
        pintag.font=[UIFont fontWithName:@"Helvetica" size:19];
        [tablebackview addSubview:pintag];
        
        UILabel *pintag1=[[UILabel alloc]initWithFrame:CGRectMake(105,405,99,40)];
        pintag1.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"tagimg3"]];
        pintag1.text=@"# restaurant";
        pintag1.textColor=[UIColor lightGrayColor];
        pintag1.textAlignment=NSTextAlignmentCenter;
        pintag1.font=[UIFont fontWithName:@"Helvetica" size:15];
        [tablebackview addSubview:pintag1];
        
        UILabel *pintag4=[[UILabel alloc]initWithFrame:CGRectMake(210,405,70,40)];
        pintag4.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"tagimg3"]];
        pintag4.text=@"# hot";
        pintag4.textColor=[UIColor lightGrayColor];
        pintag4.textAlignment=NSTextAlignmentCenter;
        pintag4.font=[UIFont fontWithName:@"Helvetica" size:19];
        [tablebackview addSubview:pintag4];
        
        weekbutton.frame = CGRectMake(20, 100, 80, 30);
        monthbutton.frame = CGRectMake(110, 100, 80, 30);
        alltimebutton.frame = CGRectMake(210, 100, 80, 30);
        followersselectedline.frame = CGRectMake(30, 132, 60, 3);
        mypintable.frame = CGRectMake(0, 460, tablebackview.frame.size.width, 230);
        mypintable2.frame = CGRectMake(0, 480, tablebackview.frame.size.width, 210);
        mypintable3.frame = CGRectMake(0, 550, tablebackview.frame.size.width, 230);
        pinimage.frame = CGRectMake(235, -9, 35, 35);
        pinimage1.frame = CGRectMake(235, -9, 35, 35);
        pinimage2.frame = CGRectMake(235, -9, 35, 35);
        feeditemprice.frame = CGRectMake(170,0,70,60);
    }
    else
    {
        
        UILabel *pintag=[[UILabel alloc]initWithFrame:CGRectMake(10,405,99,40)];
        pintag.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"tagimg3"]];
        pintag.text=@"# food";
        pintag.textColor=[UIColor lightGrayColor];
        pintag.textAlignment=NSTextAlignmentCenter;
        pintag.font=[UIFont fontWithName:@"Helvetica" size:19];
        [tablebackview addSubview:pintag];
        
        UILabel *pintag1=[[UILabel alloc]initWithFrame:CGRectMake(115,405,99,40)];
        pintag1.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"tagimg3"]];
        pintag1.text=@"# restaurant";
        pintag1.textColor=[UIColor lightGrayColor];
        pintag1.textAlignment=NSTextAlignmentCenter;
        pintag1.font=[UIFont fontWithName:@"Helvetica" size:15];
        [tablebackview addSubview:pintag1];
        
        UILabel *pintag4=[[UILabel alloc]initWithFrame:CGRectMake(220,405,99,40)];
        pintag4.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"tagimg3"]];
        pintag4.text=@"# hot";
        pintag4.textColor=[UIColor lightGrayColor];
        pintag4.textAlignment=NSTextAlignmentCenter;
        pintag4.font=[UIFont fontWithName:@"Helvetica" size:19];
        [tablebackview addSubview:pintag4];
        
        weekbutton.frame = CGRectMake(20, 100, 80, 30);
        monthbutton.frame = CGRectMake(140, 100, 80, 30);
        alltimebutton.frame = CGRectMake(250, 100, 80, 30);
        followersselectedline.frame = CGRectMake(25, 132, 70, 3);
        pinimage.frame = CGRectMake(270, -9, 35, 35);
        pinimage1.frame = CGRectMake(270, -9, 35, 35);
        pinimage2.frame = CGRectMake(270, -9, 35, 35);
        mypintable.frame = CGRectMake(0, 470, tablebackview.frame.size.width, 220);
        mypintable2.frame = CGRectMake(0, 480, tablebackview.frame.size.width, 200);
        mypintable3.frame = CGRectMake(0, 550, tablebackview.frame.size.width, 220);
        feeditemprice.frame = CGRectMake(210,0,70,60);
    }

    // Do any additional setup after loading the view.
}
//Backbutton function.....
-(void)Backbutton:(UIButton *)sender{
    
    ViewController *view = [[ViewController alloc]init];
    [self.navigationController pushViewController:view animated:YES];
}


-(void)weekcommon:(UIButton *)sender
{

    if ([[UIScreen mainScreen]bounds].size.width == 320)
    {
        if (sender.tag == 1)
        {
            followersselectedline.frame = CGRectMake(30, 132, 60, 3);
            weekbutton.titleLabel.textColor = [UIColor blackColor];
            monthbutton.titleLabel.textColor = [UIColor lightGrayColor];
            alltimebutton.titleLabel.textColor = [UIColor lightGrayColor];
            
            
        }
        else if (sender.tag == 2)
        {
            followersselectedline.frame = CGRectMake(115, 132, 70, 3);
            weekbutton.titleLabel.textColor = [UIColor lightGrayColor];
            monthbutton.titleLabel.textColor = [UIColor blackColor];
            alltimebutton.titleLabel.textColor = [UIColor lightGrayColor];
            weekbutton.selected = NO;
            monthbutton.selected = YES;
            alltimebutton.selected = NO;
        }
        else
        {
            followersselectedline.frame = CGRectMake(210, 132, 76, 3);
            weekbutton.titleLabel.textColor = [UIColor lightGrayColor];
            monthbutton.titleLabel.textColor = [UIColor lightGrayColor];
            alltimebutton.titleLabel.textColor = [UIColor blackColor];
            weekbutton.selected = NO;
            monthbutton.selected = NO;
            alltimebutton.selected = YES;
            
        }
    }
    else
    {
        if (sender.tag == 1)
        {
            followersselectedline.frame = CGRectMake(25, 132, 70, 3);
            weekbutton.titleLabel.textColor = [UIColor blackColor];
            monthbutton.titleLabel.textColor = [UIColor lightGrayColor];
            alltimebutton.titleLabel.textColor = [UIColor lightGrayColor];
            
            
        }
        else if (sender.tag == 2)
        {
            followersselectedline.frame = CGRectMake(145, 132, 70, 3);
            weekbutton.titleLabel.textColor = [UIColor lightGrayColor];
            monthbutton.titleLabel.textColor = [UIColor blackColor];
            alltimebutton.titleLabel.textColor = [UIColor lightGrayColor];
            weekbutton.selected = NO;
            monthbutton.selected = YES;
            alltimebutton.selected = NO;
        }
        else
        {
            followersselectedline.frame = CGRectMake(250, 132, 76, 3);
            weekbutton.titleLabel.textColor = [UIColor lightGrayColor];
            monthbutton.titleLabel.textColor = [UIColor lightGrayColor];
            alltimebutton.titleLabel.textColor = [UIColor blackColor];
            weekbutton.selected = NO;
            monthbutton.selected = NO;
            alltimebutton.selected = YES;
            
        }
    }
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 5;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    
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
        
        
        
        UIImageView *lineimage = [[UIImageView alloc]initWithFrame:CGRectMake(mypintable.frame.origin.x-7, feeduserdescription.frame.origin.x+100, mypintable.frame.size.width-10, 40)];
        [lineimage setImage:[UIImage imageNamed:@"bottomdividerline"]];
        [cell addSubview:lineimage];
        
        
        
        
        
        UILabel *heartgraycount = [[UILabel alloc]initWithFrame:CGRectMake(mypintable.frame.origin.x+2, feeduserdescription.frame.origin.x+105,30,30)];
        heartgraycount.text=@"30";
        heartgraycount.textColor=[UIColor lightGrayColor];
        heartgraycount.textAlignment=NSTextAlignmentLeft;
        [heartgraycount setBackgroundColor:[UIColor clearColor]];
        heartgraycount.font=[UIFont fontWithName:@"Helvetica" size:18];
        [cell addSubview:heartgraycount];
        
        UIImageView *heartgrayimage = [[UIImageView alloc]initWithFrame:CGRectMake(mypintable.frame.origin.x+26, feeduserdescription.frame.origin.x+110, 32-8, 28-8)];
        [heartgrayimage setImage:[UIImage imageNamed:@"heartgray"]];
        [cell addSubview:heartgrayimage];
        
        
        
        
        
        UILabel *commentgraycount = [[UILabel alloc]initWithFrame:CGRectMake(mypintable.frame.origin.x+66, feeduserdescription.frame.origin.x+105,30,30)];
        commentgraycount.text=@"20";
        commentgraycount.textColor=[UIColor lightGrayColor];
        commentgraycount.textAlignment=NSTextAlignmentLeft;
        [commentgraycount setBackgroundColor:[UIColor clearColor]];
        commentgraycount.font=[UIFont fontWithName:@"Helvetica" size:18];
        [cell addSubview:commentgraycount];
        
        
        
        UIImageView *commentgrayimage = [[UIImageView alloc]initWithFrame:CGRectMake(mypintable.frame.origin.x+95, feeduserdescription.frame.origin.x+110, 29-8, 29-8)];
        [commentgrayimage setImage:[UIImage imageNamed:@"commentgrayimage"]];
        [cell addSubview:commentgrayimage];
        
        
        
        
        
        
        
        UIImageView *heartredimage = [[UIImageView alloc]initWithFrame:CGRectMake(mypintable.frame.origin.x+145, feeduserdescription.frame.origin.x+110, 32-8, 28-8)];
        [heartredimage setImage:[UIImage imageNamed:@"heartred"]];
        [cell addSubview:heartredimage];
        
        
        
        
        
        
        
        UIImageView *commentbuttonblack = [[UIImageView alloc]initWithFrame:CGRectMake(mypintable.frame.origin.x+190, feeduserdescription.frame.origin.x+110, 32-8, 28-8)];
        [commentbuttonblack setImage:[UIImage imageNamed:@"commentbuttonblack"]];
        [cell addSubview:commentbuttonblack];
        
        
        
        
        
        
        
        UIImageView *settingsbutton = [[UIImageView alloc]initWithFrame:CGRectMake(mypintable.frame.origin.x+240, feeduserdescription.frame.origin.x+110, 5, 23)];
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
        
        
           UIImageView *lineimage = [[UIImageView alloc]initWithFrame:CGRectMake(mypintable.frame.origin.x-5, feeduserdescription.frame.origin.x+100, mypintable.frame.size.width-10, 40)];
        
        [lineimage setImage:[UIImage imageNamed:@"bottomdividerline"]];
        
        [cell addSubview:lineimage];
        
        
        
        
        
        UILabel *heartgraycount = [[UILabel alloc]initWithFrame:CGRectMake(mypintable.frame.origin.x+2, feeduserdescription.frame.origin.x+105,30,30)];
        
        heartgraycount.text=@"30";
        
        heartgraycount.textColor=[UIColor lightGrayColor];
        
        heartgraycount.textAlignment=NSTextAlignmentLeft;
        
        [heartgraycount setBackgroundColor:[UIColor clearColor]];
        
        heartgraycount.font=[UIFont fontWithName:@"Helvetica" size:20];
        
        [cell addSubview:heartgraycount];
        
        
        
        UIImageView *heartgrayimage = [[UIImageView alloc]initWithFrame:CGRectMake(mypintable.frame.origin.x+33, feeduserdescription.frame.origin.x+110, 32-6, 28-6)];
        
        [heartgrayimage setImage:[UIImage imageNamed:@"heartgray"]];
        
        [cell addSubview:heartgrayimage];
        
        
        
        UILabel *commentgraycount = [[UILabel alloc]initWithFrame:CGRectMake(mypintable.frame.origin.x+78, feeduserdescription.frame.origin.x+105,30,30)];
        
        commentgraycount.text=@"20";
        
        commentgraycount.textColor=[UIColor lightGrayColor];
        
        commentgraycount.textAlignment=NSTextAlignmentLeft;
        
        [commentgraycount setBackgroundColor:[UIColor clearColor]];
        
        commentgraycount.font=[UIFont fontWithName:@"Helvetica" size:20];
        
        [cell addSubview:commentgraycount];
        
        
        
        UIImageView *commentgrayimage = [[UIImageView alloc]initWithFrame:CGRectMake(mypintable.frame.origin.x+110, feeduserdescription.frame.origin.x+110, 29-6, 29-6)];
        [commentgrayimage setImage:[UIImage imageNamed:@"commentgrayimage"]];
        [cell addSubview:commentgrayimage];
        
        
        
        UIImageView *heartredimage = [[UIImageView alloc]initWithFrame:CGRectMake(mypintable.frame.origin.x+169, feeduserdescription.frame.origin.x+110, 32-6, 28-6)];
        [heartredimage setImage:[UIImage imageNamed:@"heartred"]];
        [cell addSubview:heartredimage];
        
        
        
        UIImageView *commentbuttonblack = [[UIImageView alloc]initWithFrame:CGRectMake(mypintable.frame.origin.x+220, feeduserdescription.frame.origin.x+110, 32-6, 28-6)];
        [commentbuttonblack setImage:[UIImage imageNamed:@"commentbuttonblack"]];
        [cell addSubview:commentbuttonblack];
        
        
        
        UIImageView *settingsbutton = [[UIImageView alloc]initWithFrame:CGRectMake(mypintable.frame.origin.x+270, feeduserdescription.frame.origin.x+110, 5, 23)];
        [settingsbutton setImage:[UIImage imageNamed:@"morebutton"]];
        [cell addSubview:settingsbutton];
    }
    
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 170;
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
