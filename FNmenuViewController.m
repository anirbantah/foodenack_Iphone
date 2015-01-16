//
//  FNmenuViewController.m
//  Foodenak
//
//  Created by RAHUL - ( iMAC ) on 09/01/15.
//  Copyright (c) 2015 Esolz Tech. All rights reserved.
//

#import "FNmenuViewController.h"

@interface FNmenuViewController ()

@end

@implementation FNmenuViewController
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
        header1.text=@"KFC : Menu";
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

        
        
    UIImageView *menutopbar=[[UIImageView alloc]initWithFrame:CGRectMake(Backgroundview.frame.origin.x,topbar.frame.size.height+80,Backgroundview.frame.size.width,65)];
        menutopbar.image=[UIImage imageNamed:@"topbar"];
        menutopbar.userInteractionEnabled=YES;
        [Backgroundview addSubview:menutopbar];
        
        UILabel *shortlbl=[[UILabel alloc]initWithFrame:CGRectMake(0,0, 140, 65)];
        shortlbl.text=@"Menu Book";
        shortlbl.textColor=[UIColor darkGrayColor];
        shortlbl.textAlignment=NSTextAlignmentCenter;
        shortlbl.font=[UIFont fontWithName:@"Helvetica" size:18];
        [menutopbar addSubview:shortlbl];
        
        
        
        UIImageView *addnewicon=[[UIImageView alloc]initWithFrame:CGRectMake(268,60,32-6,32-7)];
        addnewicon.image=[UIImage imageNamed:@"addrestaurant"];
        [topview addSubview:addnewicon];
        
        UIButton *Addnew=[[UIButton alloc]initWithFrame:CGRectMake(238,40,80,58)];
        [Addnew addTarget:self action:@selector(AddMenupage) forControlEvents:UIControlEventTouchUpInside];
        [topview addSubview:Addnew];
        
        //////////////////////////  * Menu list Table * /////////////////////////////
        
        menulistTable=[[UITableView alloc]initWithFrame:CGRectMake(0, topbar.frame.size.height+390, Backgroundview.frame.size.width,179)];
        menulistTable.delegate=self;
        menulistTable.dataSource=self;
        menulistTable.backgroundColor=[UIColor clearColor];
        menulistTable.separatorStyle=NO;
        [Backgroundview addSubview:menulistTable];
        
        //////////------------------------------------------------------------------///////////
        
        UIImageView *menuheader=[[UIImageView alloc]initWithFrame:CGRectMake(Backgroundview.frame.origin.x,topbar.frame.size.height+350,Backgroundview.frame.size.width,60)];
        menuheader.image=[UIImage imageNamed:@"shadowbar"];
        menuheader.userInteractionEnabled=YES;
        [Backgroundview addSubview:menuheader];
        
        UILabel *menutitle=[[UILabel alloc]initWithFrame:CGRectMake(20,0, 100, 50)];
        menutitle.text=@"Menu List";
        menutitle.textColor=[UIColor whiteColor];
        menutitle.textAlignment=NSTextAlignmentCenter;
        menutitle.font=[UIFont fontWithName:@"Helvetica" size:18];
        [menuheader addSubview:menutitle];
        
        
        /* ------------------ Photo Scroll ------------------------- */
        
        photoscroll=[[UIScrollView alloc]initWithFrame:CGRectMake(0,150, Backgroundview.frame.size.width,199)];
        photoscroll.backgroundColor=[UIColor clearColor];
        photoscroll.scrollEnabled=YES;
        photoscroll.pagingEnabled=YES;
        photoscroll.delegate=self;
        photoscroll.showsHorizontalScrollIndicator=NO;
        [photoscroll setContentSize:CGSizeMake(1500,199)];
        [Backgroundview addSubview:photoscroll];
        
        UIImageView *photos=[[UIImageView alloc]initWithFrame:CGRectMake(20, 4,280,180)];
        photos.image=[UIImage imageNamed:@"couponitem1"];
        [photoscroll addSubview:photos];
        
        photos=[[UIImageView alloc]initWithFrame:CGRectMake(340, 4,280,180)];
        photos.image=[UIImage imageNamed:@"couponitem1"];
        [photoscroll addSubview:photos];
        
        photos=[[UIImageView alloc]initWithFrame:CGRectMake(660, 4,280,180)];
        photos.image=[UIImage imageNamed:@"couponitem1"];
        [photoscroll addSubview:photos];
        
        photos=[[UIImageView alloc]initWithFrame:CGRectMake(980, 4,280,180)];
        photos.image=[UIImage imageNamed:@"couponitem1"];
        [photoscroll addSubview:photos];

        
        /* ----------------------- Page indicator -------------------------- */
        
        p1=[[UIImageView alloc]initWithFrame:CGRectMake(115,topbar.frame.origin.y+337,20-9, 19-9)];
        p1.image=[UIImage imageNamed:@"doton"];
        [self.view addSubview:p1];
        
        p2=[[UIImageView alloc]initWithFrame:CGRectMake(145,topbar.frame.origin.y+337,20-9, 19-9)];
        p2.image=[UIImage imageNamed:@"dotoff"];
        [self.view addSubview:p2];
        
        p3=[[UIImageView alloc]initWithFrame:CGRectMake(175,topbar.frame.origin.y+337,20-9, 19-9)];
        p3.image=[UIImage imageNamed:@"dotoff"];
        [self.view addSubview:p3];
        
        p4=[[UIImageView alloc]initWithFrame:CGRectMake(205,topbar.frame.origin.y+337,20-9, 19-9)];
        p4.image=[UIImage imageNamed:@"dotoff"];
        [self.view addSubview:p4];

    
        
        
        
    }
    else
    {
        
        /* ---------------------- iphone 6 ------------------------- */
        
        header1=[[UILabel alloc]initWithFrame:CGRectMake(25,50, 180, 40)];
        header1.text=@"KFC : Menu";
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

        
        
      UIImageView *menutopbar=[[UIImageView alloc]initWithFrame:CGRectMake(Backgroundview.frame.origin.x,topbar.frame.size.height+80,Backgroundview.frame.size.width,65)];
        menutopbar.image=[UIImage imageNamed:@"topbar"];
        menutopbar.userInteractionEnabled=YES;
        [Backgroundview addSubview:menutopbar];
        
        UILabel *shortlbl=[[UILabel alloc]initWithFrame:CGRectMake(0,0, 150, 65)];
        shortlbl.text=@"Menu Book";
        shortlbl.textColor=[UIColor darkGrayColor];
        shortlbl.textAlignment=NSTextAlignmentCenter;
        shortlbl.font=[UIFont fontWithName:@"Helvetica" size:20];
        [menutopbar addSubview:shortlbl];
        
        //--------//
        
        
       UIImageView *addnewicon=[[UIImageView alloc]initWithFrame:CGRectMake(320,60,32-6,32-7)];
        addnewicon.image=[UIImage imageNamed:@"addrestaurant"];
        [topview addSubview:addnewicon];
        
      UIButton *Addnew=[[UIButton alloc]initWithFrame:CGRectMake(290,40,80,58)];
        [Addnew setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [Addnew addTarget:self action:@selector(AddMenupage) forControlEvents:UIControlEventTouchUpInside];
        [topview addSubview:Addnew];
        
    /* ------------------ Photo Scroll ------------------------- */
        
 photoscroll=[[UIScrollView alloc]initWithFrame:CGRectMake(0,150, Backgroundview.frame.size.width, 250)];
 photoscroll.backgroundColor=[UIColor clearColor];
 photoscroll.scrollEnabled=YES;
photoscroll.pagingEnabled=YES;
photoscroll.delegate=self;
photoscroll.showsHorizontalScrollIndicator=NO;
 [photoscroll setContentSize:CGSizeMake(1500,250)];
 [Backgroundview addSubview:photoscroll];
        
        UIImageView *photos=[[UIImageView alloc]initWithFrame:CGRectMake(28, 10,320, 220)];
        photos.image=[UIImage imageNamed:@"couponitem1"];
        [photoscroll addSubview:photos];
        
        photos=[[UIImageView alloc]initWithFrame:CGRectMake(405, 10,320, 220)];
        photos.image=[UIImage imageNamed:@"couponitem1"];
        [photoscroll addSubview:photos];
        
        photos=[[UIImageView alloc]initWithFrame:CGRectMake(780, 10,320, 220)];
        photos.image=[UIImage imageNamed:@"couponitem1"];
        [photoscroll addSubview:photos];
        
        photos=[[UIImageView alloc]initWithFrame:CGRectMake(1150, 10,320, 220)];
        photos.image=[UIImage imageNamed:@"couponitem1"];
        [photoscroll addSubview:photos];
        
        
 /* ----------------------- Page indicator -------------------------- */
        
       p1=[[UIImageView alloc]initWithFrame:CGRectMake(140,topbar.frame.origin.y+384, 20-7, 19-7)];
        p1.image=[UIImage imageNamed:@"doton"];
        [self.view addSubview:p1];
        
        
        p2=[[UIImageView alloc]initWithFrame:CGRectMake(170,topbar.frame.origin.y+384, 20-7, 19-7)];
        p2.image=[UIImage imageNamed:@"dotoff"];
        [self.view addSubview:p2];
        
        p3=[[UIImageView alloc]initWithFrame:CGRectMake(200,topbar.frame.origin.y+384, 20-7, 19-7)];
        p3.image=[UIImage imageNamed:@"dotoff"];
        [self.view addSubview:p3];
        
        p4=[[UIImageView alloc]initWithFrame:CGRectMake(230,topbar.frame.origin.y+384, 20-7, 19-7)];
        p4.image=[UIImage imageNamed:@"dotoff"];
        [self.view addSubview:p4];
        
        
//////////////////////////  * Menu list Table * /////////////////////////////
        

        
    menulistTable=[[UITableView alloc]initWithFrame:CGRectMake(0, topbar.frame.size.height+450, Backgroundview.frame.size.width,220)];
        menulistTable.delegate=self;
        menulistTable.dataSource=self;
        menulistTable.backgroundColor=[UIColor clearColor];
        menulistTable.separatorStyle=NO;
        [Backgroundview addSubview:menulistTable];
        
        
        
//////////------------------------------------------------------------------///////////
        
        UIImageView *menuheader=[[UIImageView alloc]initWithFrame:CGRectMake(Backgroundview.frame.origin.x,topbar.frame.size.height+400,Backgroundview.frame.size.width,60)];
        menuheader.image=[UIImage imageNamed:@"shadowbar"];
        menuheader.userInteractionEnabled=YES;
        [Backgroundview addSubview:menuheader];
        
        UILabel *menutitle=[[UILabel alloc]initWithFrame:CGRectMake(20,0, 100, 50)];
        menutitle.text=@"Menu List";
        menutitle.textColor=[UIColor whiteColor];
        menutitle.textAlignment=NSTextAlignmentCenter;
        menutitle.font=[UIFont fontWithName:@"Helvetica" size:18];
        [menuheader addSubview:menutitle];

    }

    

}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    cell.backgroundColor =[UIColor clearColor];
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    
/////////////////////////////// * Menu list Table view Design * ////////////////////////////////////////
    
    if ([UIScreen mainScreen].bounds.size.width==320.0f)
    {
        UIView *cellview=[[UIView alloc]initWithFrame:CGRectMake(0,0,menulistTable.frame.size.width,160)];
        cellview.backgroundColor=[[UIColor lightGrayColor]colorWithAlphaComponent:.1];
        cellview.userInteractionEnabled=YES;
        [cell addSubview:cellview];
        
        UILabel *itemname=[[UILabel alloc]initWithFrame:CGRectMake(30,20, 180, 50)];
        itemname.text=@"Fried Chicken";
        itemname.textColor=[UIColor darkGrayColor];
        itemname.textAlignment=NSTextAlignmentLeft;
        itemname.font=[UIFont fontWithName:@"Helvetica" size:18];
        [cellview addSubview:itemname];
        
        UILabel *itemprice=[[UILabel alloc]initWithFrame:CGRectMake(30,50, 160, 50)];
        itemprice.text=@"$ 50";
        itemprice.textColor=[UIColor darkGrayColor];
        itemprice.textAlignment=NSTextAlignmentLeft;
        itemprice.font=[UIFont fontWithName:@"Symbol" size:17];
        [cellview addSubview:itemprice];
        
        
        UIImageView *Likeimg=[[UIImageView alloc]initWithFrame:CGRectMake(30,96,165-50,50-20)];
        Likeimg.image=[UIImage imageNamed:@"likeicon"];
        Likeimg.userInteractionEnabled=YES;
        [cellview addSubview:Likeimg];
        
        /* -------------------- like count ----------------------- */
        
        likecount=[[UILabel alloc]initWithFrame:CGRectMake(45,4, 60, 20)];
        likecount.text=@"100 likes";
        likecount.textColor=[UIColor darkGrayColor];
        likecount.textAlignment=NSTextAlignmentLeft;
        likecount.font=[UIFont fontWithName:@"Helvetica" size:14];
        [Likeimg addSubview:likecount];
        
        UIImageView *photoimg=[[UIImageView alloc]initWithFrame:CGRectMake(160,96,165-50,50-20)];
        photoimg.image=[UIImage imageNamed:@"photoicon"];
        photoimg.userInteractionEnabled=YES;
        [cellview addSubview:photoimg];
        
        /* ----------------- photo count ----------------------- */
        
        photocount=[[UILabel alloc]initWithFrame:CGRectMake(45,4, 60, 20)];
        photocount.text=@"5 photos";
        photocount.textColor=[UIColor darkGrayColor];
        photocount.textAlignment=NSTextAlignmentLeft;
        photocount.font=[UIFont fontWithName:@"Helvetica" size:14];
        [photoimg addSubview:photocount];
        
        
        UIImageView *celldevider=[[UIImageView alloc]initWithFrame:CGRectMake(0,150,cellview.frame.size.width,1)];
        celldevider.image=[UIImage imageNamed:@"newdevider"];
        [cellview addSubview:celldevider];
        
        
        
        UIButton *likethis=[[UIButton alloc]initWithFrame:CGRectMake(320, 20,32-5,28-5)];
        [likethis setImage:[UIImage imageNamed:@"heartgray"] forState:UIControlStateNormal];
        [cellview addSubview:likethis];
        

    }
    else
    {
        UIView *cellview=[[UIView alloc]initWithFrame:CGRectMake(0,0,menulistTable.frame.size.width,160)];
        cellview.backgroundColor=[[UIColor lightGrayColor]colorWithAlphaComponent:.1];
        cellview.userInteractionEnabled=YES;
        [cell addSubview:cellview];
        
        UILabel *itemname=[[UILabel alloc]initWithFrame:CGRectMake(50,20, 180, 50)];
        itemname.text=@"Fried Chicken";
        itemname.textColor=[UIColor darkGrayColor];
        itemname.textAlignment=NSTextAlignmentLeft;
        itemname.font=[UIFont fontWithName:@"Helvetica" size:20];
        [cellview addSubview:itemname];
        
        UILabel *itemprice=[[UILabel alloc]initWithFrame:CGRectMake(50,50, 160, 50)];
        itemprice.text=@"$ 50";
        itemprice.textColor=[UIColor darkGrayColor];
        itemprice.textAlignment=NSTextAlignmentLeft;
        itemprice.font=[UIFont fontWithName:@"Symbol" size:19];
        [cellview addSubview:itemprice];
        
        
        UIImageView *Likeimg=[[UIImageView alloc]initWithFrame:CGRectMake(50,96,165-50,50-20)];
        Likeimg.image=[UIImage imageNamed:@"likeicon"];
        Likeimg.userInteractionEnabled=YES;
        [cellview addSubview:Likeimg];
        
        /* -------------------- like count ----------------------- */
        
        likecount=[[UILabel alloc]initWithFrame:CGRectMake(45,4, 60, 20)];
        likecount.text=@"100 likes";
        likecount.textColor=[UIColor darkGrayColor];
        likecount.textAlignment=NSTextAlignmentLeft;
        likecount.font=[UIFont fontWithName:@"Helvetica" size:14];
        [Likeimg addSubview:likecount];
        
        UIImageView *photoimg=[[UIImageView alloc]initWithFrame:CGRectMake(180,96,165-50,50-20)];
        photoimg.image=[UIImage imageNamed:@"photoicon"];
        photoimg.userInteractionEnabled=YES;
        [cellview addSubview:photoimg];
        
        /* ----------------- photo count ----------------------- */
        
        photocount=[[UILabel alloc]initWithFrame:CGRectMake(45,4, 60, 20)];
        photocount.text=@"5 photos";
        photocount.textColor=[UIColor darkGrayColor];
        photocount.textAlignment=NSTextAlignmentLeft;
        photocount.font=[UIFont fontWithName:@"Helvetica" size:14];
        [photoimg addSubview:photocount];
        
        
        UIImageView *celldevider=[[UIImageView alloc]initWithFrame:CGRectMake(0,150,cellview.frame.size.width,1)];
        celldevider.image=[UIImage imageNamed:@"newdevider"];
        [cellview addSubview:celldevider];
        
        
        
        UIButton *likethis=[[UIButton alloc]initWithFrame:CGRectMake(320, 20,32-5,28-5)];
        [likethis setImage:[UIImage imageNamed:@"heartgray"] forState:UIControlStateNormal];
        [cellview addSubview:likethis];
        

    }
    
    //////////////////////////////////////////////////////////////////////////////////////
    
    
    cell.selectionStyle=NO;
    
    return cell;

}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
        return 160;
}
-(void)AddMenupage
{
    FNaddItemViewController *addpage=[[FNaddItemViewController alloc]init];
    [self.navigationController pushViewController:addpage animated:YES];
}

-(void)back:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView  {
    
   

        int pagenumber =photoscroll.contentOffset.x/self.view.frame.size.width;
        
        
        if (pagenumber == 0)
        {
            p1.image=[UIImage imageNamed:@"doton"];
            p2.image=[UIImage imageNamed:@"dotoff"];
            p3.image=[UIImage imageNamed:@"dotoff"];
            p4.image=[UIImage imageNamed:@"dotoff"];
           
            
        }
        else if (pagenumber ==1)
        {
            
            p1.image=[UIImage imageNamed:@"dotoff"];
            p2.image=[UIImage imageNamed:@"doton"];
            p3.image=[UIImage imageNamed:@"dotoff"];
            p4.image=[UIImage imageNamed:@"dotoff"];
            
        }
        else if (pagenumber ==2)
        {
            p1.image=[UIImage imageNamed:@"dotoff"];
            p2.image=[UIImage imageNamed:@"dotoff"];
            p3.image=[UIImage imageNamed:@"doton"];
            p4.image=[UIImage imageNamed:@"dotoff"];
            
            
        }
        else if (pagenumber ==3)
        {
            p1.image=[UIImage imageNamed:@"dotoff"];
            p2.image=[UIImage imageNamed:@"dotoff"];
            p3.image=[UIImage imageNamed:@"dotoff"];
            p4.image=[UIImage imageNamed:@"doton"];
          
            
        }
        else if (pagenumber ==4)
        {
            p1.image=[UIImage imageNamed:@"dotoff"];
            p2.image=[UIImage imageNamed:@"dotoff"];
            p3.image=[UIImage imageNamed:@"dotoff"];
            p4.image=[UIImage imageNamed:@"dotoff"];
         
            
        }
        
        
        
        
    
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
