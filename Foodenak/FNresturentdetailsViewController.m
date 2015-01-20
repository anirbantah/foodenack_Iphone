//
//  FNresturentdetailsViewController.m
//  Foodenak
//
//  Created by Soumarsi Kundu on 20/01/15.
//  Copyright (c) 2015 Esolz Tech. All rights reserved.
//

#import "FNresturentdetailsViewController.h"

@interface FNresturentdetailsViewController ()<UIScrollViewDelegate>{
    
    UIScrollView *MainScroll;
    UIImageView *topview;
    UIView *MainView;
    UILabel *EditProfileLbl;
    UIButton *menubutton,*locatorbutton,*camerabutton,*messegebutton,*editbutton,*BackButton;
}

@end

@implementation FNresturentdetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    MainView=[[UIView alloc]initWithFrame:CGRectMake(self.view.frame.origin.x,self.view.frame.origin.y,self.view.frame.size.width,self.view.frame.size.height)];
    MainView.backgroundColor=[UIColor colorWithRed:(222.0f/255.0f) green:(222.0f/255.0f) blue:(222.0f/255.0f) alpha:1];
    MainView.userInteractionEnabled=YES;
    [self.view addSubview:MainView];
    
    topview=[[UIImageView alloc]initWithFrame:CGRectMake(MainView.frame.origin.x,MainView.frame.origin.y-20,MainView.frame.size.width,100)];
    topview.image=[UIImage imageNamed:@"topview"];
    topview.userInteractionEnabled=YES;
    [MainView addSubview:topview];
    
    //back button declare......
    
    BackButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [BackButton setFrame:CGRectMake(self.view.frame.origin.x+40, self.view.frame.origin.y+35, 18, 31)];
    [BackButton setImage:[UIImage imageNamed:@"backarrow"] forState:UIControlStateNormal];
    [BackButton addTarget:self action:@selector(Backbutton:) forControlEvents:UIControlEventTouchUpInside];
    [topview addSubview:BackButton];
    
    
    //edit profile label allocation....
    
    EditProfileLbl = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.origin.x+65, self.view.frame.origin.y+35, 120, 30)];
    [EditProfileLbl setBackgroundColor:[UIColor clearColor]];
    [EditProfileLbl setText:@"KFC"];
    [EditProfileLbl setTextAlignment:NSTextAlignmentLeft];
    [EditProfileLbl setTextColor:[UIColor whiteColor]];
    [EditProfileLbl setFont:[UIFont fontWithName:@"Helvetica Bold" size:20]];
    [topview addSubview:EditProfileLbl];
    
    if ([UIScreen mainScreen].bounds.size.height==568.0f)
    {
        
        /*----------------- iphone 5s ----------------------*/
        
        menubutton=[[UIButton alloc]initWithFrame:CGRectMake(5,58,33-9,24-9)];
        [menubutton setBackgroundImage:[UIImage imageNamed:@"menuicon"] forState:UIControlStateNormal];
        //[menubutton addTarget:self action:@selector(LeftTogglemenu:) forControlEvents:UIControlEventTouchUpInside];
        //[topview addSubview:menubutton];
        
        UIButton *menutap=[[UIButton alloc]initWithFrame:CGRectMake(0,42,50,50)];
        [menutap setBackgroundColor:[UIColor clearColor]];
        //[menutap addTarget:self action:@selector(LeftTogglemenu:) forControlEvents:UIControlEventTouchUpInside];
        //[topview addSubview:menutap];
        
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
//        [menubutton addTarget:self action:@selector(LeftTogglemenu:) forControlEvents:UIControlEventTouchUpInside];
//        [topview addSubview:menubutton];
        
        UIButton *menutap=[[UIButton alloc]initWithFrame:CGRectMake(0,42,50,50)];
        [menutap setBackgroundColor:[UIColor clearColor]];
//        [menutap addTarget:self action:@selector(LeftTogglemenu:) forControlEvents:UIControlEventTouchUpInside];
//        [topview addSubview:menutap];
        
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
    
    MainScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0.0f, 80.0f, self.view.frame.size.width, self.view.frame.size.height-80)];
    MainScroll.userInteractionEnabled=YES;
    MainScroll.scrollEnabled=YES;
    MainScroll.delegate=self;
    MainScroll.bounces=YES;
    MainScroll.showsHorizontalScrollIndicator=NO;
    [MainView addSubview:MainScroll];
    
    MainScroll.contentSize = CGSizeMake(0, 3600);
    
    UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 3600)];
    [image setImage:[UIImage imageNamed:@"detailsimage"]];
    [MainScroll addSubview:image];
    
    
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
