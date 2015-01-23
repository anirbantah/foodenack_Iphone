//
//  FNFilterViewController.m
//  Foodenak
//
//  Created by Soumarsi Kundu on 22/01/15.
//  Copyright (c) 2015 Esolz Tech. All rights reserved.
//

#import "FNFilterViewController.h"

@interface FNFilterViewController ()<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>{
    
    UIView *Backgroundview;
    UIImageView *topview,*topbar,*shortview,*downarrow;
    UILabel *header1,*popularlistlbl;
    UIScrollView *Backgroundscroll,*slidescrollview;
    UILabel *shortlbl;
    UIImageView *shadwoimg;
    UIImageView *popularbackground;
    UIImageView *popularbase;
    UITableView *facilitiestableview,*categoriestableview;
}

@end

@implementation FNFilterViewController

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
        header1.text=@"Filter";
        header1.textColor=[UIColor whiteColor];
        header1.textAlignment=NSTextAlignmentLeft;
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
        header1.text=@"Filter";
        header1.textColor=[UIColor whiteColor];
        header1.textAlignment=NSTextAlignmentLeft;
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
    
    
    topbar=[[UIImageView alloc]init];
    topbar.image=[UIImage imageNamed:@"topbar"];
    topbar.userInteractionEnabled=YES;
    [Backgroundview addSubview:topbar];
    
    
    shortview=[[UIImageView alloc]init];
    shortview.backgroundColor=[[UIColor lightGrayColor]colorWithAlphaComponent:.4];
    shortview.userInteractionEnabled=YES;
    [Backgroundview addSubview:shortview];
    
    shortlbl=[[UILabel alloc]init];
    shortlbl.text=@"Short by";
    shortlbl.textColor=[UIColor blackColor];
    shortlbl.textAlignment=NSTextAlignmentCenter;
    shortlbl.font=[UIFont fontWithName:@"Helvetica" size:20];
    [shortview addSubview:shortlbl];
    
    
    shadwoimg=[[UIImageView alloc]init];
    shadwoimg.image=[UIImage imageNamed:@"shadow"];
    shadwoimg.userInteractionEnabled=YES;
    [Backgroundview addSubview:shadwoimg];
    
    
    popularlistlbl=[[UILabel alloc]init];
    popularlistlbl.backgroundColor=[UIColor colorWithRed:(237.0f/255.0f) green:(237.0f/255.0f) blue:(237.0f/255.0f) alpha:1];
    popularlistlbl.layer.cornerRadius=5;
    popularlistlbl.text=@"  Popular";
    popularlistlbl.textColor=[UIColor grayColor];
    popularlistlbl.textAlignment=NSTextAlignmentLeft;
    popularlistlbl.font=[UIFont fontWithName:@"Helvetica Light" size:18];
    [shortview addSubview:popularlistlbl];
    
    downarrow=[[UIImageView alloc]init];
    downarrow.image=[UIImage imageNamed:@"downarrow2"];
    [popularlistlbl addSubview:downarrow];
    
    
    Backgroundscroll=[[UIScrollView alloc]init];
    Backgroundscroll.backgroundColor=[UIColor clearColor];
    Backgroundscroll.scrollEnabled=YES;
    [Backgroundscroll setContentSize:CGSizeMake(self.view.frame.origin.x, 680)];
    [Backgroundview addSubview:Backgroundscroll];
    
    

    
    popularbackground=[[UIImageView alloc]init];
    [Backgroundscroll addSubview:popularbackground];
    
    
    popularbase=[[UIImageView alloc]init];
    popularbase.image=[UIImage imageNamed:@"popularbg"];
    [popularbackground addSubview:popularbase];
    
    UILabel *Facilitylbl = [[UILabel alloc]init];
    [Facilitylbl setText:@"Facilities"];
    [Facilitylbl setTextAlignment:NSTextAlignmentLeft];
    [Facilitylbl setTextColor:[UIColor blackColor]];
    [Facilitylbl setBackgroundColor:[UIColor clearColor]];
    [Facilitylbl setFont:[UIFont fontWithName:@"Helvetica" size:20]];
    [popularbase addSubview:Facilitylbl];


    UIView *lineview = [[UIView alloc]init];
    [lineview setBackgroundColor:[UIColor lightGrayColor]];
    [popularbase addSubview:lineview];
    
    
    UIView *lineviewcategories = [[UIView alloc]init];
    [lineviewcategories setBackgroundColor:[UIColor lightGrayColor]];
    [popularbase addSubview:lineviewcategories];
    
    facilitiestableview=[[UITableView alloc]init];
    facilitiestableview.delegate=self;
    facilitiestableview.dataSource=self;
    facilitiestableview.backgroundColor = [UIColor redColor];
    facilitiestableview.tag = 1;
    facilitiestableview.separatorStyle=UITableViewCellSeparatorStyleNone;
    facilitiestableview.showsVerticalScrollIndicator = YES;
    [Backgroundscroll addSubview:facilitiestableview];
    
    
    slidescrollview=[[UIScrollView alloc]init];
    slidescrollview.backgroundColor=[UIColor clearColor];
    slidescrollview.scrollEnabled=YES;
    [slidescrollview setContentSize:CGSizeMake(self.view.frame.origin.x+220, 0)];
    [popularbase addSubview:slidescrollview];
    
    int i = 20;
    
    for (int k = 0; k<8; k++) {
        
        UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(i, 5, 50, 50)];
        [image setImage:[UIImage imageNamed:@"Box"]];
        [slidescrollview addSubview:image];
        
        
        UILabel *dolarlabel = [[UILabel alloc]initWithFrame:CGRectMake(i+8, 3, 40, 30)];
        [dolarlabel setText:@"$"];
        [dolarlabel setTextAlignment:NSTextAlignmentCenter];
        [dolarlabel setTextColor:[UIColor blackColor]];
        [dolarlabel setBackgroundColor:[UIColor clearColor]];
        [dolarlabel setFont:[UIFont fontWithName:@"Helvetica" size:17]];
        [slidescrollview addSubview:dolarlabel];
        
        
        UILabel *datalabel = [[UILabel alloc]initWithFrame:CGRectMake(i+6, 33, 40, 17)];
        [datalabel setText:@"0-10"];
        [datalabel setTextAlignment:NSTextAlignmentCenter];
        [datalabel setTextColor:[UIColor lightGrayColor]];
        [datalabel setBackgroundColor:[UIColor clearColor]];
        [datalabel setFont:[UIFont fontWithName:@"Helvetica" size:17]];
        [slidescrollview addSubview:datalabel];
        
        i = i+65;
    }
    
    
    UIImageView *shadwoimg1=[[UIImageView alloc]init];
    shadwoimg1.image=[UIImage imageNamed:@"shadow"];
    shadwoimg1.userInteractionEnabled=YES;
    [Backgroundscroll addSubview:shadwoimg1];
    
    
    
    UIImageView *shadwoimg2=[[UIImageView alloc]init];
    shadwoimg2.image=[UIImage imageNamed:@"shadow"];
    shadwoimg2.userInteractionEnabled=YES;
    [Backgroundscroll addSubview:shadwoimg2];
    
    
    UILabel *categorieslabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 360, 100, 30)];
    [categorieslabel setText:@"Categories"];
    [categorieslabel setTextAlignment:NSTextAlignmentLeft];
    [categorieslabel setTextColor:[UIColor blackColor]];
    [categorieslabel setBackgroundColor:[UIColor clearColor]];
    [categorieslabel setFont:[UIFont fontWithName:@"Helvetica" size:20]];
    [popularbase addSubview:categorieslabel];

    
    categoriestableview=[[UITableView alloc]init];
    categoriestableview.delegate=self;
    categoriestableview.dataSource=self;
    categoriestableview.backgroundColor = [UIColor clearColor];
    categoriestableview.tag = 2;
    categoriestableview.separatorStyle=UITableViewCellSeparatorStyleNone;
    categoriestableview.showsVerticalScrollIndicator = YES;
    [Backgroundscroll addSubview:categoriestableview];

    
    /*------------------ Top Bar ---------------------*/
    
    if ([UIScreen mainScreen].bounds.size.width==320.0f)
        
    {
        
        /* ----------------------- iphone 5s ------------------------ */
        
        
        topbar.frame =CGRectMake(Backgroundview.frame.origin.x,topview.frame.size.height-20,Backgroundview.frame.size.width,65);
        shortview.frame =CGRectMake(Backgroundview.frame.origin.x,topview.frame.size.height-18,Backgroundview.frame.size.width,65);
        shortlbl.frame =CGRectMake(0,0, 100, 65);
        shadwoimg.frame =CGRectMake(Backgroundview.frame.origin.x,shortview.frame.origin.y+65,shortview.frame.size.width,33);
        popularlistlbl.frame =CGRectMake(180,14, 135, 40);
        downarrow.frame =CGRectMake(100,15,20,11);
        Backgroundscroll.frame =CGRectMake(self.view.frame.origin.x,150,self.view.frame.size.width,self.view.frame.size.height-150);
        popularbackground.frame =CGRectMake(4, 0,514-180,1035);
        popularbase.frame =CGRectMake(10,20,514-220,650);
        Facilitylbl.frame = CGRectMake(20, 15, 100, 30);
        lineview.frame = CGRectMake(5, 50, popularbase.frame.size.width-10, 1);
        facilitiestableview.frame = CGRectMake(30, 75, 260, 200);
        lineviewcategories.frame = CGRectMake(5, 395, popularbase.frame.size.width-10, 1.5);
        categoriestableview.frame = CGRectMake(30, 430,260,200);
        slidescrollview.frame =CGRectMake(self.view.frame.origin.x+10,270,280,55);
        shadwoimg1.frame = CGRectMake(20, 275, 280, 33);
        shadwoimg2.frame = CGRectMake(20, 350, 280, 33);

    }
    else
    {
        /* -------------------- iphone 6 ------------------ */
        
        topbar.frame =CGRectMake(Backgroundview.frame.origin.x,topview.frame.size.height-20,Backgroundview.frame.size.width,65);
        shortview.frame =CGRectMake(Backgroundview.frame.origin.x,topview.frame.size.height-18,Backgroundview.frame.size.width,65);
        shortlbl.frame =CGRectMake(0,0, 100, 65);
        shadwoimg.frame =CGRectMake(Backgroundview.frame.origin.x,shortview.frame.origin.y+65,shortview.frame.size.width,33);
        popularlistlbl.frame =CGRectMake(220,14, 135, 40);
        downarrow.frame =CGRectMake(100,15,20,11);
        Backgroundscroll.frame =CGRectMake(self.view.frame.origin.x,150,self.view.frame.size.width,self.view.frame.size.height-150);
        popularbackground.frame =CGRectMake(4, 0,514-220,1035);
        popularbase.frame =CGRectMake(17,20,514-180,650);
        Facilitylbl.frame = CGRectMake(20, 15, 100, 30);
        lineview.frame = CGRectMake(5, 50, popularbase.frame.size.width-10, 1);
        facilitiestableview.frame = CGRectMake(30, 75, 315, 200);
        lineviewcategories.frame = CGRectMake(5, 395, popularbase.frame.size.width-10, 1.5);
        categoriestableview.frame = CGRectMake(30, 430,315,200);
        slidescrollview.frame =CGRectMake(self.view.frame.origin.x+10,270,315,55);
        shadwoimg1.frame = CGRectMake(30, 275, 315, 33);
        shadwoimg2.frame = CGRectMake(30, 350, 315, 33);
    }
    
    
    // Do any additional setup after loading the view.
}

-(void)back:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];

    cell.selectionStyle = NO;
    
    if (tableView.tag == 1) {

        if ([[UIScreen mainScreen]bounds].size.width == 320)
        {
            UIImageView *smokingimage = [[UIImageView alloc]initWithFrame:CGRectMake(17, 5, 20, 20)];
            [smokingimage setImage:[UIImage imageNamed:@"smoking"]];
            [cell addSubview:smokingimage];
            
            
            UILabel *smokinglabel = [[UILabel alloc]initWithFrame:CGRectMake(62, 5, 70, 30)];
            [smokinglabel setBackgroundColor:[UIColor clearColor]];
            [smokinglabel setText:@"Smoking"];
            [smokinglabel setTextAlignment:NSTextAlignmentLeft];
            [smokinglabel setTextColor:[UIColor lightGrayColor]];
            [smokinglabel setFont:[UIFont fontWithName:@"Helvetica" size:17]];
            [cell addSubview:smokinglabel];
            
            
            UIView *lineview = [[UIView alloc]initWithFrame:CGRectMake(0, 38, 315, 1.0f)];
            [lineview setBackgroundColor:[UIColor lightGrayColor]];
            [cell addSubview:lineview];
            
            UIImageView *wifiimage = [[UIImageView alloc]initWithFrame:CGRectMake(17, 52, 24, 20)];
            [wifiimage setImage:[UIImage imageNamed:@"Wifi"]];
            [cell addSubview:wifiimage];
            
            
            UILabel *wifilabel = [[UILabel alloc]initWithFrame:CGRectMake(62, 48, 60, 30)];
            [wifilabel setBackgroundColor:[UIColor clearColor]];
            [wifilabel setText:@"Wifi"];
            [wifilabel setTextAlignment:NSTextAlignmentLeft];
            [wifilabel setTextColor:[UIColor lightGrayColor]];
            [wifilabel setFont:[UIFont fontWithName:@"Helvetica" size:17]];
            [cell addSubview:wifilabel];
            
            
            UIView *lineview1 = [[UIView alloc]initWithFrame:CGRectMake(0, 83, 315, 1.0f)];
            [lineview1 setBackgroundColor:[UIColor lightGrayColor]];
            [cell addSubview:lineview1];
            
            UIImageView *debitimage = [[UIImageView alloc]initWithFrame:CGRectMake(17, 92, 22, 15)];
            [debitimage setImage:[UIImage imageNamed:@"Debit"]];
            [cell addSubview:debitimage];
            
            
            UILabel *debitlabel = [[UILabel alloc]initWithFrame:CGRectMake(62, 86, 60, 30)];
            [debitlabel setBackgroundColor:[UIColor clearColor]];
            [debitlabel setText:@"Debit"];
            [debitlabel setTextAlignment:NSTextAlignmentLeft];
            [debitlabel setTextColor:[UIColor lightGrayColor]];
            [debitlabel setFont:[UIFont fontWithName:@"Helvetica" size:17]];
            [cell addSubview:debitlabel];
            
            
            UIView *lineview2 = [[UIView alloc]initWithFrame:CGRectMake(0, 122, 315, 1.0f)];
            [lineview2 setBackgroundColor:[UIColor lightGrayColor]];
            [cell addSubview:lineview2];
            
            UIImageView *craditimage = [[UIImageView alloc]initWithFrame:CGRectMake(17, 130, 20, 20)];
            [craditimage setImage:[UIImage imageNamed:@"Cradit"]];
            [cell addSubview:craditimage];
            
            
            UILabel *craditlabel = [[UILabel alloc]initWithFrame:CGRectMake(62, 126, 60, 30)];
            [craditlabel setBackgroundColor:[UIColor clearColor]];
            [craditlabel setText:@"Cradit"];
            [craditlabel setTextAlignment:NSTextAlignmentLeft];
            [craditlabel setTextColor:[UIColor lightGrayColor]];
            [craditlabel setFont:[UIFont fontWithName:@"Helvetica" size:17]];
            [cell addSubview:craditlabel];
            
            
            UIView *lineview3 = [[UIView alloc]initWithFrame:CGRectMake(0, 165, 315, 1.0f)];
            [lineview3 setBackgroundColor:[UIColor lightGrayColor]];
            [cell addSubview:lineview3];
            
            UIImageView *halalimage = [[UIImageView alloc]initWithFrame:CGRectMake(17, 172, 20, 20)];
            [halalimage setImage:[UIImage imageNamed:@"Halal"]];
            [cell addSubview:halalimage];
            
            
            UILabel *halallabel = [[UILabel alloc]initWithFrame:CGRectMake(62, 170, 60, 30)];
            [halallabel setBackgroundColor:[UIColor clearColor]];
            [halallabel setText:@"Halal"];
            [halallabel setTextAlignment:NSTextAlignmentLeft];
            [halallabel setTextColor:[UIColor lightGrayColor]];
            [halallabel setFont:[UIFont fontWithName:@"Helvetica" size:17]];
            [cell addSubview:halallabel];
            
            
            
            UIImageView *deliveryimage = [[UIImageView alloc]initWithFrame:CGRectMake(160, 5, 20, 20)];
            [deliveryimage setImage:[UIImage imageNamed:@"Delivery"]];
            [cell addSubview:deliveryimage];
            
            
            UILabel *deliverylabel = [[UILabel alloc]initWithFrame:CGRectMake(190, 1, 70, 30)];
            [deliverylabel setBackgroundColor:[UIColor clearColor]];
            [deliverylabel setText:@"Delivary"];
            [deliverylabel setTextAlignment:NSTextAlignmentLeft];
            [deliverylabel setTextColor:[UIColor lightGrayColor]];
            [deliverylabel setFont:[UIFont fontWithName:@"Helvetica" size:17]];
            [cell addSubview:deliverylabel];
            
            
            UIImageView *alcoholimage = [[UIImageView alloc]initWithFrame:CGRectMake(160, 52, 24, 20)];
            [alcoholimage setImage:[UIImage imageNamed:@"Alcohol"]];
            [cell addSubview:alcoholimage];
            
            
            UILabel *alcohollabel = [[UILabel alloc]initWithFrame:CGRectMake(190, 48, 60, 30)];
            [alcohollabel setBackgroundColor:[UIColor clearColor]];
            [alcohollabel setText:@"Alcohol"];
            [alcohollabel setTextAlignment:NSTextAlignmentLeft];
            [alcohollabel setTextColor:[UIColor lightGrayColor]];
            [alcohollabel setFont:[UIFont fontWithName:@"Helvetica" size:17]];
            [cell addSubview:alcohollabel];
            
            
            UIImageView *outdoorimage = [[UIImageView alloc]initWithFrame:CGRectMake(160, 89, 22, 25)];
            [outdoorimage setImage:[UIImage imageNamed:@"Out-Door"]];
            [cell addSubview:outdoorimage];
            
            
            UILabel *outdooelabel = [[UILabel alloc]initWithFrame:CGRectMake(190, 86, 80, 30)];
            [outdooelabel setBackgroundColor:[UIColor clearColor]];
            [outdooelabel setText:@"Outdoor"];
            [outdooelabel setTextAlignment:NSTextAlignmentLeft];
            [outdooelabel setTextColor:[UIColor lightGrayColor]];
            [outdooelabel setFont:[UIFont fontWithName:@"Helvetica" size:17]];
            [cell addSubview:outdooelabel];
            
            
            UIImageView *tvimage = [[UIImageView alloc]initWithFrame:CGRectMake(160, 130, 20, 20)];
            [tvimage setImage:[UIImage imageNamed:@"T-v"]];
            [cell addSubview:tvimage];
            
            
            UILabel *tvlabel = [[UILabel alloc]initWithFrame:CGRectMake(190, 126, 60, 30)];
            [tvlabel setBackgroundColor:[UIColor clearColor]];
            [tvlabel setText:@"Tv"];
            [tvlabel setTextAlignment:NSTextAlignmentLeft];
            [tvlabel setTextColor:[UIColor lightGrayColor]];
            [tvlabel setFont:[UIFont fontWithName:@"Helvetica" size:17]];
            [cell addSubview:tvlabel];

        }
    else
    {
        UIImageView *smokingimage = [[UIImageView alloc]initWithFrame:CGRectMake(17, 5, 20, 20)];
        [smokingimage setImage:[UIImage imageNamed:@"smoking"]];
        [cell addSubview:smokingimage];
        
        
        UILabel *smokinglabel = [[UILabel alloc]initWithFrame:CGRectMake(62, 5, 70, 30)];
        [smokinglabel setBackgroundColor:[UIColor clearColor]];
        [smokinglabel setText:@"Smoking"];
        [smokinglabel setTextAlignment:NSTextAlignmentLeft];
        [smokinglabel setTextColor:[UIColor lightGrayColor]];
        [smokinglabel setFont:[UIFont fontWithName:@"Helvetica" size:17]];
        [cell addSubview:smokinglabel];
        
        
        UIView *lineview = [[UIView alloc]initWithFrame:CGRectMake(0, 38, 315, 1.0f)];
        [lineview setBackgroundColor:[UIColor lightGrayColor]];
        [cell addSubview:lineview];
        
        UIImageView *wifiimage = [[UIImageView alloc]initWithFrame:CGRectMake(17, 52, 24, 20)];
        [wifiimage setImage:[UIImage imageNamed:@"Wifi"]];
        [cell addSubview:wifiimage];
        
        
        UILabel *wifilabel = [[UILabel alloc]initWithFrame:CGRectMake(62, 48, 60, 30)];
        [wifilabel setBackgroundColor:[UIColor clearColor]];
        [wifilabel setText:@"Wifi"];
        [wifilabel setTextAlignment:NSTextAlignmentLeft];
        [wifilabel setTextColor:[UIColor lightGrayColor]];
        [wifilabel setFont:[UIFont fontWithName:@"Helvetica" size:17]];
        [cell addSubview:wifilabel];
        
        
        UIView *lineview1 = [[UIView alloc]initWithFrame:CGRectMake(0, 83, 315, 1.0f)];
        [lineview1 setBackgroundColor:[UIColor lightGrayColor]];
        [cell addSubview:lineview1];
        
        UIImageView *debitimage = [[UIImageView alloc]initWithFrame:CGRectMake(17, 92, 22, 15)];
        [debitimage setImage:[UIImage imageNamed:@"Debit"]];
        [cell addSubview:debitimage];
        
        
        UILabel *debitlabel = [[UILabel alloc]initWithFrame:CGRectMake(62, 86, 60, 30)];
        [debitlabel setBackgroundColor:[UIColor clearColor]];
        [debitlabel setText:@"Debit"];
        [debitlabel setTextAlignment:NSTextAlignmentLeft];
        [debitlabel setTextColor:[UIColor lightGrayColor]];
        [debitlabel setFont:[UIFont fontWithName:@"Helvetica" size:17]];
        [cell addSubview:debitlabel];
        
        
        UIView *lineview2 = [[UIView alloc]initWithFrame:CGRectMake(0, 122, 315, 1.0f)];
        [lineview2 setBackgroundColor:[UIColor lightGrayColor]];
        [cell addSubview:lineview2];
        
        UIImageView *craditimage = [[UIImageView alloc]initWithFrame:CGRectMake(17, 130, 20, 20)];
        [craditimage setImage:[UIImage imageNamed:@"Cradit"]];
        [cell addSubview:craditimage];
        
        
        UILabel *craditlabel = [[UILabel alloc]initWithFrame:CGRectMake(62, 126, 60, 30)];
        [craditlabel setBackgroundColor:[UIColor clearColor]];
        [craditlabel setText:@"Cradit"];
        [craditlabel setTextAlignment:NSTextAlignmentLeft];
        [craditlabel setTextColor:[UIColor lightGrayColor]];
        [craditlabel setFont:[UIFont fontWithName:@"Helvetica" size:17]];
        [cell addSubview:craditlabel];
        
        
        UIView *lineview3 = [[UIView alloc]initWithFrame:CGRectMake(0, 165, 315, 1.0f)];
        [lineview3 setBackgroundColor:[UIColor lightGrayColor]];
        [cell addSubview:lineview3];
        
        UIImageView *halalimage = [[UIImageView alloc]initWithFrame:CGRectMake(17, 172, 20, 20)];
        [halalimage setImage:[UIImage imageNamed:@"Halal"]];
        [cell addSubview:halalimage];
        
        
        UILabel *halallabel = [[UILabel alloc]initWithFrame:CGRectMake(62, 170, 60, 30)];
        [halallabel setBackgroundColor:[UIColor clearColor]];
        [halallabel setText:@"Halal"];
        [halallabel setTextAlignment:NSTextAlignmentLeft];
        [halallabel setTextColor:[UIColor lightGrayColor]];
        [halallabel setFont:[UIFont fontWithName:@"Helvetica" size:17]];
        [cell addSubview:halallabel];
        
        
        
        UIImageView *deliveryimage = [[UIImageView alloc]initWithFrame:CGRectMake(190, 5, 20, 20)];
        [deliveryimage setImage:[UIImage imageNamed:@"Delivery"]];
        [cell addSubview:deliveryimage];
        
        
        UILabel *deliverylabel = [[UILabel alloc]initWithFrame:CGRectMake(220, 1, 70, 30)];
        [deliverylabel setBackgroundColor:[UIColor clearColor]];
        [deliverylabel setText:@"Delivary"];
        [deliverylabel setTextAlignment:NSTextAlignmentLeft];
        [deliverylabel setTextColor:[UIColor lightGrayColor]];
        [deliverylabel setFont:[UIFont fontWithName:@"Helvetica" size:17]];
        [cell addSubview:deliverylabel];
        
        
        UIImageView *alcoholimage = [[UIImageView alloc]initWithFrame:CGRectMake(190, 52, 24, 20)];
        [alcoholimage setImage:[UIImage imageNamed:@"Alcohol"]];
        [cell addSubview:alcoholimage];
        
        
        UILabel *alcohollabel = [[UILabel alloc]initWithFrame:CGRectMake(220, 48, 60, 30)];
        [alcohollabel setBackgroundColor:[UIColor clearColor]];
        [alcohollabel setText:@"Alcohol"];
        [alcohollabel setTextAlignment:NSTextAlignmentLeft];
        [alcohollabel setTextColor:[UIColor lightGrayColor]];
        [alcohollabel setFont:[UIFont fontWithName:@"Helvetica" size:17]];
        [cell addSubview:alcohollabel];
        
        
        UIImageView *outdoorimage = [[UIImageView alloc]initWithFrame:CGRectMake(190, 89, 22, 25)];
        [outdoorimage setImage:[UIImage imageNamed:@"Out-Door"]];
        [cell addSubview:outdoorimage];
        
        
        UILabel *outdooelabel = [[UILabel alloc]initWithFrame:CGRectMake(220, 86, 80, 30)];
        [outdooelabel setBackgroundColor:[UIColor clearColor]];
        [outdooelabel setText:@"Outdoor"];
        [outdooelabel setTextAlignment:NSTextAlignmentLeft];
        [outdooelabel setTextColor:[UIColor lightGrayColor]];
        [outdooelabel setFont:[UIFont fontWithName:@"Helvetica" size:17]];
        [cell addSubview:outdooelabel];
        
        
        UIImageView *tvimage = [[UIImageView alloc]initWithFrame:CGRectMake(190, 130, 20, 20)];
        [tvimage setImage:[UIImage imageNamed:@"T-v"]];
        [cell addSubview:tvimage];
        
        
        UILabel *tvlabel = [[UILabel alloc]initWithFrame:CGRectMake(220, 126, 60, 30)];
        [tvlabel setBackgroundColor:[UIColor clearColor]];
        [tvlabel setText:@"Tv"];
        [tvlabel setTextAlignment:NSTextAlignmentLeft];
        [tvlabel setTextColor:[UIColor lightGrayColor]];
        [tvlabel setFont:[UIFont fontWithName:@"Helvetica" size:17]];
        [cell addSubview:tvlabel];

    }
}
    else
    {
        UILabel *Italian = [[UILabel alloc]initWithFrame:CGRectMake(17, 2, 60, 30)];
        [Italian setBackgroundColor:[UIColor clearColor]];
        [Italian setText:@"Italian"];
        [Italian setTextAlignment:NSTextAlignmentLeft];
        [Italian setTextColor:[UIColor lightGrayColor]];
        [Italian setFont:[UIFont fontWithName:@"Helvetica" size:17]];
        [cell addSubview:Italian];
        
        UILabel *Asian = [[UILabel alloc]initWithFrame:CGRectMake(17, 36, 60, 30)];
        [Asian setBackgroundColor:[UIColor clearColor]];
        [Asian setText:@"Asian"];
        [Asian setTextAlignment:NSTextAlignmentLeft];
        [Asian setTextColor:[UIColor lightGrayColor]];
        [Asian setFont:[UIFont fontWithName:@"Helvetica" size:17]];
        [cell addSubview:Asian];
        
        UILabel *Indian = [[UILabel alloc]initWithFrame:CGRectMake(17, 69, 60, 30)];
        [Indian setBackgroundColor:[UIColor clearColor]];
        [Indian setText:@"Indian"];
        [Indian setTextAlignment:NSTextAlignmentLeft];
        [Indian setTextColor:[UIColor lightGrayColor]];
        [Indian setFont:[UIFont fontWithName:@"Helvetica" size:17]];
        [cell addSubview:Indian];
        
        UILabel *Italian1 = [[UILabel alloc]initWithFrame:CGRectMake(17, 102, 60, 30)];
        [Italian1 setBackgroundColor:[UIColor clearColor]];
        [Italian1 setText:@"Italian"];
        [Italian1 setTextAlignment:NSTextAlignmentLeft];
        [Italian1 setTextColor:[UIColor lightGrayColor]];
        [Italian1 setFont:[UIFont fontWithName:@"Helvetica" size:17]];
        [cell addSubview:Italian1];
        
        UILabel *Asian1 = [[UILabel alloc]initWithFrame:CGRectMake(17, 139, 60, 30)];
        [Asian1 setBackgroundColor:[UIColor clearColor]];
        [Asian1 setText:@"Asian"];
        [Asian1 setTextAlignment:NSTextAlignmentLeft];
        [Asian1 setTextColor:[UIColor lightGrayColor]];
        [Asian1 setFont:[UIFont fontWithName:@"Helvetica" size:17]];
        [cell addSubview:Asian1];
        
        UILabel *Indian1 = [[UILabel alloc]initWithFrame:CGRectMake(17, 172, 60, 30)];
        [Indian1 setBackgroundColor:[UIColor clearColor]];
        [Indian1 setText:@"Indian"];
        [Indian1 setTextAlignment:NSTextAlignmentLeft];
        [Indian1 setTextColor:[UIColor lightGrayColor]];
        [Indian1 setFont:[UIFont fontWithName:@"Helvetica" size:17]];
        [cell addSubview:Indian1];
        
        
        if ([[UIScreen mainScreen]bounds].size.width == 320)
        {
            int j = 3;
            
            for (int i = 0; i<6; i++) {
                
                UIImageView *tickimage = [[UIImageView alloc]initWithFrame:CGRectMake(230, j, 30, 25)];
                [tickimage setImage:[UIImage imageNamed:@"Tick"]];
                [cell addSubview:tickimage];
                
                j = j+33;
            }
        }
        else
        {
            int j = 3;
            
            for (int i = 0; i<6; i++) {
                
                UIImageView *tickimage = [[UIImageView alloc]initWithFrame:CGRectMake(260, j, 30, 25)];
                [tickimage setImage:[UIImage imageNamed:@"Tick"]];
                [cell addSubview:tickimage];
                
                j = j+33;
            }

        }
        
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
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
