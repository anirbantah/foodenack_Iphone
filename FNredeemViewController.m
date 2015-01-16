//
//  FNredeemViewController.m
//  Foodenak
//
//  Created by RAHUL - ( iMAC ) on 08/01/15.
//  Copyright (c) 2015 Esolz Tech. All rights reserved.
//

#import "FNredeemViewController.h"

@interface FNredeemViewController ()

@end

@implementation FNredeemViewController
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
        header1.text=@"Redeem Coupons";
        header1.textColor=[UIColor whiteColor];
        header1.textAlignment=NSTextAlignmentCenter;
        header1.font=[UIFont fontWithName:@"Helvetica Bold" size:18];
        [topview addSubview:header1];
        
        UIButton *back=[[UIButton alloc]initWithFrame:CGRectMake(10, 54,18-3,31-3)];
        [back setImage:[UIImage imageNamed:@"backarrow"] forState:UIControlStateNormal];
        [back addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
        [topview addSubview:back];
        
        UIButton *backtap=[[UIButton alloc]initWithFrame:CGRectMake(1,40,55,60)];
        [backtap setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [backtap addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
        [topview addSubview:backtap];

        
        topbar=[[UIImageView alloc]initWithFrame:CGRectMake(Backgroundview.frame.origin.x,topview.frame.size.height-20,Backgroundview.frame.size.width,65)];
        topbar.image=[UIImage imageNamed:@"topbar"];
        topbar.userInteractionEnabled=YES;
        [Backgroundview addSubview:topbar];
        
        
          //--------//
        
        UILabel *redeemlbl=[[UILabel alloc]initWithFrame:CGRectMake(0,0, topbar.frame.size.width, 65)];
        redeemlbl.text=@"Ask a Waiter to Scan this QR Code";
        redeemlbl.textColor=[UIColor darkGrayColor];
        redeemlbl.textAlignment=NSTextAlignmentCenter;
        redeemlbl.font=[UIFont fontWithName:@"Helvetica" size:17];
        [topbar addSubview:redeemlbl];
        
        
        Backgroundscroll=[[UIScrollView alloc]initWithFrame:CGRectMake(self.view.frame.origin.x,148,self.view.frame.size.width,self.view.frame.size.height-140)];
        Backgroundscroll.backgroundColor=[UIColor clearColor];
        Backgroundscroll.scrollEnabled=YES;
        [Backgroundscroll setContentSize:CGSizeMake(self.view.frame.origin.x, 1350)];
        [self.view addSubview:Backgroundscroll];
        
        
        barcode=[[UIImageView alloc]initWithFrame:CGRectMake(20, 20, 562/2, 590/2)];
        barcode.image=[UIImage imageNamed:@"barcode"];
        [Backgroundscroll addSubview:barcode];
        
        couponcell1=[[UILabel alloc]initWithFrame:CGRectMake(5, 332, 70,35)];
        couponcell1.text=@"24ADF";
        couponcell1.backgroundColor=[UIColor whiteColor];
        couponcell1.textColor=[UIColor grayColor];
        couponcell1.textAlignment=NSTextAlignmentCenter;
        couponcell1.font=[UIFont fontWithName:@"Courier" size:16];
        [Backgroundscroll addSubview:couponcell1];
        
        couponcell2=[[UILabel alloc]initWithFrame:CGRectMake(90-5, 332, 70,35)];
        couponcell2.text=@"6283S";
        couponcell2.backgroundColor=[UIColor whiteColor];
        couponcell2.textColor=[UIColor grayColor];
        couponcell2.textAlignment=NSTextAlignmentCenter;
        couponcell2.font=[UIFont fontWithName:@"Courier" size:16];
        [Backgroundscroll addSubview:couponcell2];
        
        couponcell3=[[UILabel alloc]initWithFrame:CGRectMake(175-10, 332, 70,35)];
        couponcell3.text=@"JVGSLL";
        couponcell3.backgroundColor=[UIColor whiteColor];
        couponcell3.textColor=[UIColor grayColor];
        couponcell3.textAlignment=NSTextAlignmentCenter;
        couponcell3.font=[UIFont fontWithName:@"Courier" size:16];
        couponcell3.layer.cornerRadius=100;
        [Backgroundscroll addSubview:couponcell3];
        
        couponcell4=[[UILabel alloc]initWithFrame:CGRectMake(260-15, 332, 70,35)];
        couponcell4.text=@"65934";
        couponcell4.backgroundColor=[UIColor whiteColor];
        couponcell4.textColor=[UIColor grayColor];
        couponcell4.textAlignment=NSTextAlignmentCenter;
        couponcell4.font=[UIFont fontWithName:@"Courier" size:16];
        couponcell4.layer.cornerRadius=100;
        [Backgroundscroll addSubview:couponcell4];
        
        
        UIImageView *devider=[[UIImageView alloc]initWithFrame:CGRectMake(0, 400,Backgroundscroll.frame.size.width, 2)];
        devider.image=[UIImage imageNamed:@"newdevider"];
        [Backgroundscroll addSubview:devider];
        
        
        UILabel *couponheader=[[UILabel alloc]initWithFrame:CGRectMake(0,420,Backgroundscroll.frame.size.width,35)];
        couponheader.text=@"Coupon Details";
        couponheader.backgroundColor=[UIColor clearColor];
        couponheader.textColor=[UIColor lightGrayColor];
        couponheader.textAlignment=NSTextAlignmentCenter;
        couponheader.font=[UIFont fontWithName:@"Helvetica" size:25];
        [Backgroundscroll addSubview:couponheader];
        
        UILabel *couponsubheader=[[UILabel alloc]initWithFrame:CGRectMake(0,450,Backgroundscroll.frame.size.width,35)];
        couponsubheader.text=@"Lorem Ipsum que se encuentran en Internet";
        couponsubheader.backgroundColor=[UIColor clearColor];
        couponsubheader.textColor=[UIColor grayColor];
        couponsubheader.textAlignment=NSTextAlignmentCenter;
        couponsubheader.font=[UIFont fontWithName:@"Helvetica" size:16];
        [Backgroundscroll addSubview:couponsubheader];
        
        
        /* --------------------- Selected Coupons ------------------------- */
        
        UIView *cellview=[[UIView alloc]initWithFrame:CGRectMake(0,520,Backgroundscroll.frame.size.width,800)];
        cellview.backgroundColor=[UIColor clearColor];
        cellview.userInteractionEnabled=YES;
        [Backgroundscroll addSubview:cellview];
        
        
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
        couponitemprice.text=@"$ 50";
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
        
        
        UILabel *termlable=[[UILabel alloc]initWithFrame:CGRectMake(24,couponinfolbl.frame.origin.y+58, 100, 65)];
        termlable.text=@"Terms";
        termlable.textColor=[UIColor grayColor];
        termlable.textAlignment=NSTextAlignmentCenter;
        termlable.font=[UIFont fontWithName:@"Helvetica" size:20];
        [couponsbase addSubview:termlable];
        
        
        UIView *infoview=[[UIView alloc]initWithFrame:CGRectMake(5,475, couponsbase.frame.size.width-12, 265-5)];
        infoview.backgroundColor=[[UIColor lightGrayColor]colorWithAlphaComponent:.2];
        [couponsbase addSubview:infoview];
        
        
        UIButton *expiredate=[[UIButton alloc]initWithFrame:CGRectMake(15, 185, 504-240,72-20)];
        [expiredate setImage:[UIImage imageNamed:@"expirebtn2"] forState:UIControlStateNormal];
        [infoview addSubview:expiredate];
        
        
        UILabel *buttontitle1=[[UILabel alloc]initWithFrame:CGRectMake(0,0, 504-240, 72-20)];
        buttontitle1.text=@"Expiry 10 dec, 2014";
        buttontitle1.textColor=[UIColor whiteColor];
        buttontitle1.textAlignment=NSTextAlignmentCenter;
        buttontitle1.font=[UIFont fontWithName:@"Helvetica Bold" size:17];
        [expiredate addSubview:buttontitle1];
        
        
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
        
        /* ---------------------- iphone 6 ------------------------- */
        
        header1=[[UILabel alloc]initWithFrame:CGRectMake(30,50, 200, 40)];
        header1.text=@"Redeem Coupons";
        header1.textColor=[UIColor whiteColor];
        header1.textAlignment=NSTextAlignmentCenter;
        header1.font=[UIFont fontWithName:@"Helvetica Bold" size:20];
        [topview addSubview:header1];
        
        
        UIButton *back=[[UIButton alloc]initWithFrame:CGRectMake(10, 54,18,31)];
        [back setImage:[UIImage imageNamed:@"backarrow"] forState:UIControlStateNormal];
        [back addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
        [topview addSubview:back];
        
        UIButton *backtap=[[UIButton alloc]initWithFrame:CGRectMake(1,40,55,60)];
        [backtap setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [backtap addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
        [topview addSubview:backtap];
        
        
        topbar=[[UIImageView alloc]initWithFrame:CGRectMake(Backgroundview.frame.origin.x,topview.frame.size.height-20,Backgroundview.frame.size.width,65)];
        topbar.image=[UIImage imageNamed:@"topbar"];
        topbar.userInteractionEnabled=YES;
        [Backgroundview addSubview:topbar];
        
      
        
        UILabel *redeemlbl=[[UILabel alloc]initWithFrame:CGRectMake(0,0, topbar.frame.size.width, 65)];
        redeemlbl.text=@"Ask a Waiter to Scan this QR Code";
        redeemlbl.textColor=[UIColor darkGrayColor];
        redeemlbl.textAlignment=NSTextAlignmentCenter;
        redeemlbl.font=[UIFont fontWithName:@"Helvetica" size:20];
        [topbar addSubview:redeemlbl];
        
        
        Backgroundscroll=[[UIScrollView alloc]initWithFrame:CGRectMake(self.view.frame.origin.x,148,self.view.frame.size.width,self.view.frame.size.height-140)];
        Backgroundscroll.backgroundColor=[UIColor clearColor];
        Backgroundscroll.scrollEnabled=YES;
        [Backgroundscroll setContentSize:CGSizeMake(self.view.frame.origin.x, 1350)];
        [self.view addSubview:Backgroundscroll];
        
        
        barcode=[[UIImageView alloc]initWithFrame:CGRectMake(45, 20, 562/2, 590/2)];
        barcode.image=[UIImage imageNamed:@"barcode"];
        [Backgroundscroll addSubview:barcode];
        
       couponcell1=[[UILabel alloc]initWithFrame:CGRectMake(25, 332, 70,35)];
        couponcell1.text=@"24ADF";
        couponcell1.backgroundColor=[UIColor whiteColor];
        couponcell1.textColor=[UIColor grayColor];
        couponcell1.textAlignment=NSTextAlignmentCenter;
        couponcell1.font=[UIFont fontWithName:@"Courier" size:16];
        [Backgroundscroll addSubview:couponcell1];
        
        couponcell2=[[UILabel alloc]initWithFrame:CGRectMake(110, 332, 70,35)];
        couponcell2.text=@"6283S";
        couponcell2.backgroundColor=[UIColor whiteColor];
        couponcell2.textColor=[UIColor grayColor];
        couponcell2.textAlignment=NSTextAlignmentCenter;
        couponcell2.font=[UIFont fontWithName:@"Courier" size:16];
        [Backgroundscroll addSubview:couponcell2];
        
        couponcell3=[[UILabel alloc]initWithFrame:CGRectMake(195, 332, 70,35)];
        couponcell3.text=@"JVGSLL";
        couponcell3.backgroundColor=[UIColor whiteColor];
        couponcell3.textColor=[UIColor grayColor];
        couponcell3.textAlignment=NSTextAlignmentCenter;
        couponcell3.font=[UIFont fontWithName:@"Courier" size:16];
        couponcell3.layer.cornerRadius=100;
        [Backgroundscroll addSubview:couponcell3];
        
      couponcell4=[[UILabel alloc]initWithFrame:CGRectMake(280, 332, 70,35)];
        couponcell4.text=@"65934";
        couponcell4.backgroundColor=[UIColor whiteColor];
        couponcell4.textColor=[UIColor grayColor];
        couponcell4.textAlignment=NSTextAlignmentCenter;
        couponcell4.font=[UIFont fontWithName:@"Courier" size:16];
        couponcell4.layer.cornerRadius=100;
        [Backgroundscroll addSubview:couponcell4];
        
        
     UIImageView *devider=[[UIImageView alloc]initWithFrame:CGRectMake(0, 400,Backgroundscroll.frame.size.width, 2)];
        devider.image=[UIImage imageNamed:@"newdevider"];
        [Backgroundscroll addSubview:devider];
        
        
     UILabel *couponheader=[[UILabel alloc]initWithFrame:CGRectMake(0,420,Backgroundscroll.frame.size.width,35)];
        couponheader.text=@"Coupon Details";
        couponheader.backgroundColor=[UIColor clearColor];
        couponheader.textColor=[UIColor lightGrayColor];
        couponheader.textAlignment=NSTextAlignmentCenter;
        couponheader.font=[UIFont fontWithName:@"Helvetica" size:25];
        [Backgroundscroll addSubview:couponheader];
        
    UILabel *couponsubheader=[[UILabel alloc]initWithFrame:CGRectMake(0,450,Backgroundscroll.frame.size.width,35)];
        couponsubheader.text=@"Lorem Ipsum que se encuentran en Internet";
        couponsubheader.backgroundColor=[UIColor clearColor];
        couponsubheader.textColor=[UIColor grayColor];
        couponsubheader.textAlignment=NSTextAlignmentCenter;
        couponsubheader.font=[UIFont fontWithName:@"Helvetica" size:16];
        [Backgroundscroll addSubview:couponsubheader];

        
 /* --------------------- Selected Coupons ------------------------- */
        
        UIView *cellview=[[UIView alloc]initWithFrame:CGRectMake(0,520,Backgroundscroll.frame.size.width,800)];
        cellview.backgroundColor=[UIColor clearColor];
        cellview.userInteractionEnabled=YES;
        [Backgroundscroll addSubview:cellview];
        
        
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
        couponitemprice.text=@"$ 50";
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
        [expiredate setImage:[UIImage imageNamed:@"expirebtn2"] forState:UIControlStateNormal];
        [infoview addSubview:expiredate];
        
        
        UILabel *buttontitle1=[[UILabel alloc]initWithFrame:CGRectMake(65,0, 180, 72-20)];
        buttontitle1.text=@"Expiry 10 dec, 2014";
        buttontitle1.textColor=[UIColor whiteColor];
        buttontitle1.textAlignment=NSTextAlignmentCenter;
        buttontitle1.font=[UIFont fontWithName:@"Helvetica Bold" size:17];
        [expiredate addSubview:buttontitle1];
        
        

        UILabel *redeemdetails=[[UILabel alloc]initWithFrame:CGRectMake(15,0,300,150)];
        redeemdetails.text=@"There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there ";
        redeemdetails.numberOfLines=5;
        redeemdetails.textColor=[UIColor grayColor];
        redeemdetails.textAlignment=NSTextAlignmentLeft;
        redeemdetails.font=[UIFont fontWithName:@"Helvetica Light" size:18];
        [infoview addSubview:redeemdetails];
        
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
