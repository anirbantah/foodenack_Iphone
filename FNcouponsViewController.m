//
//  FNcouponsViewController.m
//  Foodenak
//
//  Created by RAHUL - ( iMAC ) on 07/01/15.
//  Copyright (c) 2015 Esolz Tech. All rights reserved.
//

#import "FNcouponsViewController.h"

@interface FNcouponsViewController ()

@end

@implementation FNcouponsViewController
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
        header1.text=@"My Coupons";
        header1.textColor=[UIColor whiteColor];
        header1.textAlignment=NSTextAlignmentCenter;
        header1.font=[UIFont fontWithName:@"Helvetica Bold" size:18];
        [topview addSubview:header1];
        
        UIButton *back=[[UIButton alloc]initWithFrame:CGRectMake(10, 54,18-3,31-3)];
        [back setImage:[UIImage imageNamed:@"backarrow"] forState:UIControlStateNormal];
        [back addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
        [topview addSubview:back];
        
        UIButton *backtap=[[UIButton alloc]initWithFrame:CGRectMake(1,40,60,60)];
        [backtap setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [topview addSubview:backtap];

        
        shortview=[[UIImageView alloc]initWithFrame:CGRectMake(Backgroundview.frame.origin.x,topbar.frame.size.height+80,Backgroundview.frame.size.width,65)];
        shortview.backgroundColor=[UIColor whiteColor];
        shortview.userInteractionEnabled=YES;
        [Backgroundview addSubview:shortview];
        
        UILabel *shortlbl=[[UILabel alloc]initWithFrame:CGRectMake(0,0, 100, 65)];
        shortlbl.text=@"Short by";
        shortlbl.textColor=[UIColor darkGrayColor];
        shortlbl.textAlignment=NSTextAlignmentCenter;
        shortlbl.font=[UIFont fontWithName:@"Helvetica" size:18];
        [shortview addSubview:shortlbl];
        
        popularlistlbl=[[UILabel alloc]initWithFrame:CGRectMake(170,14, 131, 40)];
        popularlistlbl.backgroundColor=[UIColor colorWithRed:(237.0f/255.0f) green:(237.0f/255.0f) blue:(237.0f/255.0f) alpha:1];
        popularlistlbl.layer.cornerRadius=5;
        popularlistlbl.text=@"  expiry";
        popularlistlbl.textColor=[UIColor grayColor];
        popularlistlbl.textAlignment=NSTextAlignmentLeft;
        popularlistlbl.font=[UIFont fontWithName:@"Helvetica Light" size:16];
        [shortview addSubview:popularlistlbl];
        
        downarrow=[[UIImageView alloc]initWithFrame:CGRectMake(100,15,20,11)];
        downarrow.image=[UIImage imageNamed:@"downarrow2"];
        [popularlistlbl addSubview:downarrow];
        
        
        
        
        
        mycouponstable=[[UITableView alloc]initWithFrame:CGRectMake(0,146,Backgroundview.frame.size.width,Backgroundview.frame.size.height-146)];
        mycouponstable.dataSource=self;
        mycouponstable.delegate=self;
        mycouponstable.separatorStyle=NO;
        mycouponstable.backgroundColor=[UIColor colorWithRed:(222.0f/255.0f) green:(222.0f/255.0f) blue:(222.0f/255.0f) alpha:1];
        [Backgroundview addSubview:mycouponstable];

        
        
    }
    else
    {
        
    /* ---------------------- iphone 6 ------------------------- */
        
        header1=[[UILabel alloc]initWithFrame:CGRectMake(30,50, 200, 40)];
        header1.text=@"My Coupons";
        header1.textColor=[UIColor whiteColor];
        header1.textAlignment=NSTextAlignmentCenter;
        header1.font=[UIFont fontWithName:@"Helvetica Bold" size:20];
        [topview addSubview:header1];
        
        
        UIButton *back=[[UIButton alloc]initWithFrame:CGRectMake(10, 54,18,31)];
        [back setImage:[UIImage imageNamed:@"backarrow"] forState:UIControlStateNormal];
        [back addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
        [topview addSubview:back];
        
        UIButton *backtap=[[UIButton alloc]initWithFrame:CGRectMake(1,40,60,60)];
        [backtap setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [backtap addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
        [topview addSubview:backtap];

        
        
        shortview=[[UIImageView alloc]initWithFrame:CGRectMake(Backgroundview.frame.origin.x,topbar.frame.size.height+80,Backgroundview.frame.size.width,65)];
        shortview.backgroundColor=[UIColor whiteColor];
        shortview.userInteractionEnabled=YES;
        [Backgroundview addSubview:shortview];
        
        UILabel *shortlbl=[[UILabel alloc]initWithFrame:CGRectMake(0,0, 100, 65)];
        shortlbl.text=@"Short by";
        shortlbl.textColor=[UIColor blackColor];
        shortlbl.textAlignment=NSTextAlignmentCenter;
        shortlbl.font=[UIFont fontWithName:@"Helvetica" size:20];
        [shortview addSubview:shortlbl];
        
        
        popularlistlbl=[[UILabel alloc]initWithFrame:CGRectMake(220,14, 135, 40)];
        popularlistlbl.backgroundColor=[UIColor colorWithRed:(237.0f/255.0f) green:(237.0f/255.0f) blue:(237.0f/255.0f) alpha:1];
        popularlistlbl.layer.cornerRadius=5;
        popularlistlbl.text=@"  expiry";
        popularlistlbl.textColor=[UIColor grayColor];
        popularlistlbl.textAlignment=NSTextAlignmentLeft;
        popularlistlbl.font=[UIFont fontWithName:@"Helvetica Light" size:18];
        [shortview addSubview:popularlistlbl];
        
        downarrow=[[UIImageView alloc]initWithFrame:CGRectMake(100,15,20,11)];
        downarrow.image=[UIImage imageNamed:@"downarrow2"];
        [popularlistlbl addSubview:downarrow];

        
        mycouponstable=[[UITableView alloc]initWithFrame:CGRectMake(0,146,Backgroundview.frame.size.width,Backgroundview.frame.size.height-146)];
        mycouponstable.dataSource=self;
        mycouponstable.delegate=self;
        mycouponstable.separatorStyle=NO;
        mycouponstable.backgroundColor=[UIColor colorWithRed:(222.0f/255.0f) green:(222.0f/255.0f) blue:(222.0f/255.0f) alpha:1];
        [Backgroundview addSubview:mycouponstable];

        
    }


}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    cell.backgroundColor =[UIColor clearColor];
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    
     if ([UIScreen mainScreen].bounds.size.width==320.0f)
     {
         UIView *cellview=[[UIView alloc]initWithFrame:CGRectMake(0,0,cell.frame.size.width,800)];
         cellview.backgroundColor=[UIColor clearColor];
         cellview.userInteractionEnabled=YES;
         [cell addSubview:cellview];
         
         
         UIImageView *couponsbase=[[UIImageView alloc]initWithFrame:CGRectMake(10,10,514-210,740)];
         couponsbase.image=[UIImage imageNamed:@"popularbg"];
         couponsbase.userInteractionEnabled=YES;
         [cellview addSubview:couponsbase];
         
         UIImageView *logo=[[UIImageView alloc]initWithFrame:CGRectMake(15,20,107-15,99-15)];
         logo.image=[UIImage imageNamed:@"myfeedlogo"];
         [couponsbase addSubview:logo];
         
         UILabel *coupontitle=[[UILabel alloc]initWithFrame:CGRectMake(90, 5,190,60)];
         coupontitle.text=@"KFC restaurtent";
         coupontitle.textColor=[UIColor colorWithRed:(230.0f/255.0f) green:(64.0f/255.0f) blue:(73.0f/255.0f) alpha:1];
         coupontitle.textAlignment=NSTextAlignmentCenter;
         coupontitle.font=[UIFont fontWithName:@"Helvetica" size:18];
         [couponsbase addSubview:coupontitle];
        
         
         UIImageView *couponlocator=[[UIImageView alloc]initWithFrame:CGRectMake(122-6,56,25-7, 31-7)];
         couponlocator.image=[UIImage imageNamed:@"nearicon"];
         [couponsbase addSubview:couponlocator];
         
         
         UILabel *couponlocation=[[UILabel alloc]initWithFrame:CGRectMake(110-10,52, 180,30)];
         couponlocation.text=@"kolkata , india";
         couponlocation.textColor=[UIColor grayColor];
         couponlocation.textAlignment=NSTextAlignmentCenter;
         couponlocation.font=[UIFont fontWithName:@"Helvetica" size:16];
         [couponsbase addSubview:couponlocation];
         
         
         UILabel *couponitemprice=[[UILabel alloc]initWithFrame:CGRectMake(224,30,100,60)];
         if (indexPath.row%2)
         {
             couponitemprice.text=@"$ 50";
         }
         else
         {
             couponitemprice.text=@"$ 40";
         }
         
         couponitemprice.textColor=[UIColor darkGrayColor];
         couponitemprice.textAlignment=NSTextAlignmentCenter;
         couponitemprice.font=[UIFont fontWithName:@"Symbol" size:22];
         [couponsbase addSubview:couponitemprice];

         
         
         UIImageView *coupondisplayimage=[[UIImageView alloc]initWithFrame:CGRectMake(8,120,496-210,330-108)];
         coupondisplayimage.image=[UIImage imageNamed:@"couponitem1"];
         [couponsbase addSubview:coupondisplayimage];
         
         UIImageView *couponinfolbl=[[UIImageView alloc]initWithFrame:CGRectMake(8,350-7,496-210,60)];
         couponinfolbl.image=[UIImage imageNamed:@"couponpricetag"];
         [couponsbase addSubview:couponinfolbl];
         
         UILabel *couponitemname=[[UILabel alloc]initWithFrame:CGRectMake(10,0,200,60)];
         couponitemname.text=@"Free iceCream !!";
         couponitemname.textColor=[UIColor whiteColor];
         couponitemname.textAlignment=NSTextAlignmentCenter;
         couponitemname.font=[UIFont fontWithName:@"Helvetica Bold" size:18];
         [couponinfolbl addSubview:couponitemname];
         
         
         UILabel *termlable=[[UILabel alloc]initWithFrame:CGRectMake(24,couponinfolbl.frame.origin.y+62, 100, 65)];
         termlable.text=@"Terms";
         termlable.textColor=[UIColor grayColor];
         termlable.textAlignment=NSTextAlignmentCenter;
         termlable.font=[UIFont fontWithName:@"Helvetica" size:19];
         [couponsbase addSubview:termlable];
         
         
         UIView *infoview=[[UIView alloc]initWithFrame:CGRectMake(5,475, couponsbase.frame.size.width-12, 265-5)];
         infoview.backgroundColor=[[UIColor lightGrayColor]colorWithAlphaComponent:.2];
         [couponsbase addSubview:infoview];
         
         
         UIButton *expiredate=[[UIButton alloc]initWithFrame:CGRectMake(5, 180, 504-220,72-20)];
         [expiredate setImage:[UIImage imageNamed:@"redeem"] forState:UIControlStateNormal];
         [expiredate addTarget:self action:@selector(redeemCouponsPage:) forControlEvents:UIControlEventTouchUpInside];
         expiredate.tag=indexPath.row;

         [infoview addSubview:expiredate];
         
         
         UILabel *buttontitle1=[[UILabel alloc]initWithFrame:CGRectMake(0,0, 160, 72-20)];
         buttontitle1.text=@"Expiry 10 dec, 2014";
         buttontitle1.textColor=[UIColor whiteColor];
         buttontitle1.textAlignment=NSTextAlignmentCenter;
         buttontitle1.font=[UIFont fontWithName:@"Helvetica Bold" size:14];
         [expiredate addSubview:buttontitle1];
         
         UILabel *buttontitle2=[[UILabel alloc]initWithFrame:CGRectMake(150,0, 150, 72-20)];
         buttontitle2.text=@"REDEEM";
         buttontitle2.textColor=[UIColor whiteColor];
         buttontitle2.textAlignment=NSTextAlignmentCenter;
         buttontitle2.font=[UIFont fontWithName:@"Helvetica Bold" size:16];
         [expiredate addSubview:buttontitle2];
         
         
         UILabel *redeemdetails=[[UILabel alloc]initWithFrame:CGRectMake(15,0,260,150)];
         redeemdetails.text=@"There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there ";
         redeemdetails.numberOfLines=5;
         redeemdetails.textColor=[UIColor grayColor];
         redeemdetails.textAlignment=NSTextAlignmentLeft;
         redeemdetails.font=[UIFont fontWithName:@"Helvetica Light" size:18];
         [infoview addSubview:redeemdetails];
     }
    else
    {
        
    UIView *cellview=[[UIView alloc]initWithFrame:CGRectMake(0,0,cell.frame.size.width,800)];
    cellview.backgroundColor=[UIColor clearColor];
    cellview.userInteractionEnabled=YES;
    [cell addSubview:cellview];
    
    
    UIImageView *couponsbase=[[UIImageView alloc]initWithFrame:CGRectMake(11,10,514-160,740)];
    couponsbase.image=[UIImage imageNamed:@"popularbg"];
    couponsbase.userInteractionEnabled=YES;
    [cellview addSubview:couponsbase];
    
    UIImageView *logo=[[UIImageView alloc]initWithFrame:CGRectMake(15,20,107-15,99-15)];
    logo.image=[UIImage imageNamed:@"myfeedlogo"];
    [couponsbase addSubview:logo];
    
    UILabel *coupontitle=[[UILabel alloc]initWithFrame:CGRectMake(100, 5,190,60)];
    coupontitle.text=@"KFC restaurtent";
    coupontitle.textColor=[UIColor colorWithRed:(230.0f/255.0f) green:(64.0f/255.0f) blue:(73.0f/255.0f) alpha:1];
    coupontitle.textAlignment=NSTextAlignmentCenter;
    coupontitle.font=[UIFont fontWithName:@"Helvetica" size:19];
    [couponsbase addSubview:coupontitle];
    
      
    UIImageView *couponlocator=[[UIImageView alloc]initWithFrame:CGRectMake(122,56,25-7, 31-7)];
    couponlocator.image=[UIImage imageNamed:@"nearicon"];
    [couponsbase addSubview:couponlocator];
    
    
    UILabel *couponlocation=[[UILabel alloc]initWithFrame:CGRectMake(110,52, 190,30)];
    couponlocation.text=@"kolkata , india";
    couponlocation.textColor=[UIColor grayColor];
    couponlocation.textAlignment=NSTextAlignmentCenter;
    couponlocation.font=[UIFont fontWithName:@"Helvetica" size:17];
    [couponsbase addSubview:couponlocation];
        
        
    UILabel *couponitemprice=[[UILabel alloc]initWithFrame:CGRectMake(257,27,100,60)];
        if (indexPath.row%2)
        {
            couponitemprice.text=@"$ 50";
        }
        else
        {
            couponitemprice.text=@"$ 40";
        }
        
        couponitemprice.textColor=[UIColor darkGrayColor];
        couponitemprice.textAlignment=NSTextAlignmentCenter;
        couponitemprice.font=[UIFont fontWithName:@"Symbol" size:30];
        [couponsbase addSubview:couponitemprice];
    
    
    UIImageView *coupondisplayimage=[[UIImageView alloc]initWithFrame:CGRectMake(8,120,couponsbase.frame.size.width-15,330-109)];
    coupondisplayimage.image=[UIImage imageNamed:@"couponitem1"];
    [couponsbase addSubview:coupondisplayimage];
    
    UIImageView *couponinfolbl=[[UIImageView alloc]initWithFrame:CGRectMake(8,350-8,couponsbase.frame.size.width-15,60)];
    couponinfolbl.image=[UIImage imageNamed:@"couponpricetag"];
    [couponsbase addSubview:couponinfolbl];
    
    UILabel *couponitemname=[[UILabel alloc]initWithFrame:CGRectMake(10,0,200,60)];
    couponitemname.text=@"Free iceCream !!";
    couponitemname.textColor=[UIColor whiteColor];
    couponitemname.textAlignment=NSTextAlignmentCenter;
    couponitemname.font=[UIFont fontWithName:@"Helvetica Bold" size:18];
    [couponinfolbl addSubview:couponitemname];
    
    
    UILabel *termlable=[[UILabel alloc]initWithFrame:CGRectMake(24,couponinfolbl.frame.origin.y+58, 100, 65)];
    termlable.text=@"Terms";
    termlable.textColor=[UIColor grayColor];
    termlable.textAlignment=NSTextAlignmentCenter;
    termlable.font=[UIFont fontWithName:@"Helvetica" size:20];
    [couponsbase addSubview:termlable];
    
    
    UIView *infoview=[[UIView alloc]initWithFrame:CGRectMake(5,475, couponsbase.frame.size.width-10, 265-5)];
    infoview.backgroundColor=[[UIColor lightGrayColor]colorWithAlphaComponent:.2];
    [couponsbase addSubview:infoview];
    
    
    UIButton *expiredate=[[UIButton alloc]initWithFrame:CGRectMake(20, 180, 504-200,72-20)];
    [expiredate setImage:[UIImage imageNamed:@"redeem"] forState:UIControlStateNormal];
    [expiredate addTarget:self action:@selector(redeemCouponsPage:) forControlEvents:UIControlEventTouchUpInside];
        expiredate.tag=indexPath.row;
    [infoview addSubview:expiredate];
    
    
    UILabel *buttontitle1=[[UILabel alloc]initWithFrame:CGRectMake(0,0, 180, 72-20)];
    buttontitle1.text=@"Expiry 10 dec, 2014";
    buttontitle1.textColor=[UIColor whiteColor];
    buttontitle1.textAlignment=NSTextAlignmentCenter;
    buttontitle1.font=[UIFont fontWithName:@"Helvetica Bold" size:16];
    [expiredate addSubview:buttontitle1];
    
    UILabel *buttontitle2=[[UILabel alloc]initWithFrame:CGRectMake(165,0, 150, 72-20)];
    buttontitle2.text=@"REDEEM";
    buttontitle2.textColor=[UIColor whiteColor];
    buttontitle2.textAlignment=NSTextAlignmentCenter;
    buttontitle2.font=[UIFont fontWithName:@"Helvetica Bold" size:18];
    [expiredate addSubview:buttontitle2];
    
    
    UILabel *redeemdetails=[[UILabel alloc]initWithFrame:CGRectMake(15,0,300,150)];
    redeemdetails.text=@"There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there ";
    redeemdetails.numberOfLines=5;
    redeemdetails.textColor=[UIColor grayColor];
    redeemdetails.textAlignment=NSTextAlignmentLeft;
    redeemdetails.font=[UIFont fontWithName:@"Helvetica Light" size:18];
    [infoview addSubview:redeemdetails];
    

    }
    
    cell.selectionStyle=NO;
    cell.backgroundColor=[UIColor clearColor];
    
    return cell;
    
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 800;
}

-(void)redeemCouponsPage:(UIButton *)sender
{
    FNredeemViewController *go=[[FNredeemViewController alloc]init];
    [self.navigationController pushViewController:go animated:YES];
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
