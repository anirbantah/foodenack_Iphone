//
//  FNaddItemViewController.m
//  Foodenak
//
//  Created by RAHUL - ( iMAC ) on 09/01/15.
//  Copyright (c) 2015 Esolz Tech. All rights reserved.
//

#import "FNaddItemViewController.h"

@interface FNaddItemViewController ()

@end

@implementation FNaddItemViewController
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
        
        /* ----------------------- iphone 5s ------------------------ */
        
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
        
        
        
        UIImageView *menutopbar=[[UIImageView alloc]initWithFrame:CGRectMake(Backgroundview.frame.origin.x,topbar.frame.size.height+80,Backgroundview.frame.size.width,80)];
        menutopbar.image=[UIImage imageNamed:@"shadowbar-1"];
        menutopbar.userInteractionEnabled=YES;
        [Backgroundview addSubview:menutopbar];
        
        UILabel *shortlbl=[[UILabel alloc]initWithFrame:CGRectMake(26,0, 140, 65)];
        shortlbl.text=@"Add a new menu";
        shortlbl.textColor=[UIColor darkGrayColor];
        shortlbl.textAlignment=NSTextAlignmentCenter;
        shortlbl.font=[UIFont fontWithName:@"Helvetica" size:18];
        [menutopbar addSubview:shortlbl];
        
  
        
        UIImageView *menuheader=[[UIImageView alloc]initWithFrame:CGRectMake(Backgroundview.frame.origin.x,topbar.frame.size.height+320,Backgroundview.frame.size.width,80)];
        menuheader.image=[UIImage imageNamed:@"shadowbar-1"];
        menuheader.userInteractionEnabled=YES;
        [Backgroundview addSubview:menuheader];
        
        
        UIView *baseview=[[UIView alloc]initWithFrame:CGRectMake(0,150,Backgroundview.frame.size.width, 250)];
        baseview.backgroundColor=[UIColor whiteColor];
        baseview.userInteractionEnabled=YES;
        [Backgroundview addSubview:baseview];
        
        
        Menuname=[[UITextField alloc]initWithFrame:CGRectMake(20,35,280, 62-22)];
        Menuname.background=[UIImage imageNamed:@"newtextinput"];
        Menuname.leftView=[[UIView alloc]initWithFrame:CGRectMake(0,0,20, 62-22)];
        Menuname.leftViewMode=UITextFieldViewModeAlways;
        Menuname.delegate=self;
        UIColor *color = [UIColor darkGrayColor];
        Menuname.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Type menu name" attributes:@{NSForegroundColorAttributeName: color}];
        [baseview addSubview:Menuname];
        
        
        price=[[UITextField alloc]initWithFrame:CGRectMake(20,85,280, 62-22)];
        price.background=[UIImage imageNamed:@"newtextinput"];
        price.leftView=[[UIView alloc]initWithFrame:CGRectMake(0,0,20, 62-22)];
        price.leftViewMode=UITextFieldViewModeAlways;
        price.delegate=self;
        price.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Menu price" attributes:@{NSForegroundColorAttributeName: color}];
        [baseview addSubview:price];
        
        
        UIButton *addbutton=[[UIButton alloc]initWithFrame:CGRectMake(20,140,280,62-22)];
        [addbutton setImage:[UIImage imageNamed:@"addimage"] forState:UIControlStateNormal];
        [baseview addSubview:addbutton];

        
        
        
    }
    else
    {
        
        /* ---------------------- iphone 6 ------------------------- */
        
        header1=[[UILabel alloc]initWithFrame:CGRectMake(35,50, 180, 40)];
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
        
        
        
        UIImageView *menutopbar=[[UIImageView alloc]initWithFrame:CGRectMake(Backgroundview.frame.origin.x,topbar.frame.size.height+80,Backgroundview.frame.size.width,80)];
        menutopbar.image=[UIImage imageNamed:@"shadowbar-1"];
        menutopbar.userInteractionEnabled=YES;
        [Backgroundview addSubview:menutopbar];
        
        UILabel *menutitle=[[UILabel alloc]initWithFrame:CGRectMake(10,0, 180, 65)];
        menutitle.text=@"Add a new menu";
        menutitle.textColor=[UIColor darkGrayColor];
        menutitle.textAlignment=NSTextAlignmentCenter;
        menutitle.font=[UIFont fontWithName:@"Helvetica" size:20];
        [menutopbar addSubview:menutitle];
        
        
        // -------- //
        
        
        UIView *baseview=[[UIView alloc]initWithFrame:CGRectMake(0,150,Backgroundview.frame.size.width, 250)];
        baseview.backgroundColor=[UIColor whiteColor];
        baseview.userInteractionEnabled=YES;
        [Backgroundview addSubview:baseview];
        
        
        Menuname=[[UITextField alloc]initWithFrame:CGRectMake(32,35,310, 62-22)];
        Menuname.background=[UIImage imageNamed:@"newtextinput"];
        Menuname.leftView=[[UIView alloc]initWithFrame:CGRectMake(0,0,20, 62-22)];
        Menuname.leftViewMode=UITextFieldViewModeAlways;
        Menuname.delegate=self;
        UIColor *color = [UIColor darkGrayColor];
        Menuname.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Type menu name" attributes:@{NSForegroundColorAttributeName: color}];
        [baseview addSubview:Menuname];
        
        
        price=[[UITextField alloc]initWithFrame:CGRectMake(32,85,310, 62-22)];
        price.background=[UIImage imageNamed:@"newtextinput"];
        price.leftView=[[UIView alloc]initWithFrame:CGRectMake(0,0,20, 62-22)];
        price.leftViewMode=UITextFieldViewModeAlways;
        price.delegate=self;
        price.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Menu price" attributes:@{NSForegroundColorAttributeName: color}];
        [baseview addSubview:price];
        
        
        UIButton *addbutton=[[UIButton alloc]initWithFrame:CGRectMake(32,140,310,62-22)];
        [addbutton setImage:[UIImage imageNamed:@"addimage"] forState:UIControlStateNormal];
        [baseview addSubview:addbutton];
        
        
    }

}
-(void)back:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
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
