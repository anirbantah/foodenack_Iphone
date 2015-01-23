//
//  FNcarddetailsViewController.m
//  Foodenak
//
//  Created by Soumarsi Kundu on 22/01/15.
//  Copyright (c) 2015 Esolz Tech. All rights reserved.
//

#import "FNcarddetailsViewController.h"
#import "ViewController.h"
@interface FNcarddetailsViewController ()<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>{
    
    UIView *MainView;
    UIImageView *TopView,*gradientview;
    UIButton *BackButton;
    UILabel *EditProfileLbl;
    UIScrollView *MainScroll;
    UITableView *CardTable,*CommentTable;
}

@end

@implementation FNcarddetailsViewController

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
    
    EditProfileLbl = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.origin.x+45, self.view.frame.origin.y+35, 120, 30)];
    [EditProfileLbl setBackgroundColor:[UIColor clearColor]];
    [EditProfileLbl setText:@"Card Details"];
    [EditProfileLbl setTextAlignment:NSTextAlignmentLeft];
    [EditProfileLbl setTextColor:[UIColor whiteColor]];
    [EditProfileLbl setFont:[UIFont fontWithName:@"Helvetica Bold" size:20]];
    [TopView addSubview:EditProfileLbl];
    
    //topbar gradient/////\
    
    MainScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0.0f, 100.0f, self.view.frame.size.width, self.view.frame.size.height-100)];
    MainScroll.userInteractionEnabled=YES;
    MainScroll.scrollEnabled=YES;
    MainScroll.delegate=self;
    MainScroll.bounces=YES;
    MainScroll.showsHorizontalScrollIndicator=NO;
    [MainView addSubview:MainScroll];
    
    MainScroll.contentSize = CGSizeMake(0, 1200);
    
    //////////////////=============================///////////////////////====================
    
    //gradientview.........
    
    gradientview = [[UIImageView alloc]init];
    [gradientview setImage:[UIImage imageNamed:@"gradientview"]];
    [MainScroll addSubview:gradientview];
    
    [gradientview setFrame:CGRectMake(20, 10, self.view.frame.size.width-40, 30)];
    
    
    //scrollbackview.....
    
    UIView *tablebackview3 = [[UIView alloc]initWithFrame:CGRectMake(20, 40, self.view.frame.size.width-40, 1100)];
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
        
        CardTable=[[UITableView alloc]initWithFrame:CGRectMake(35, 600, tablebackview3.frame.size.width-30, 250) style:UITableViewStylePlain];
        CardTable.delegate=self;
        CardTable.dataSource=self;
        CardTable.backgroundColor = [UIColor clearColor];
        CardTable.tag = 1;
        CardTable.separatorStyle=UITableViewCellSeparatorStyleNone;
        CardTable.showsVerticalScrollIndicator = YES;
        [MainScroll addSubview:CardTable];
     
        
        CommentTable=[[UITableView alloc]initWithFrame:CGRectMake(35, 880, tablebackview3.frame.size.width-30, 240) style:UITableViewStylePlain];
        CommentTable.delegate=self;
        CommentTable.dataSource=self;
        CommentTable.backgroundColor = [UIColor clearColor];
        CommentTable.tag = 2;
        CommentTable.separatorStyle=UITableViewCellSeparatorStyleNone;
        CommentTable.showsVerticalScrollIndicator = YES;
        [MainScroll addSubview:CommentTable];
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
     
        CardTable=[[UITableView alloc]initWithFrame:CGRectMake(35, 600, tablebackview3.frame.size.width-30, 250) style:UITableViewStylePlain];
        CardTable.delegate=self;
        CardTable.dataSource=self;
        CardTable.backgroundColor = [UIColor clearColor];
        CardTable.tag = 1;
        CardTable.separatorStyle=UITableViewCellSeparatorStyleNone;
        CardTable.showsVerticalScrollIndicator = YES;
        [MainScroll addSubview:CardTable];
        
        
        CommentTable=[[UITableView alloc]initWithFrame:CGRectMake(35, 880, tablebackview3.frame.size.width-30, 240) style:UITableViewStylePlain];
        CommentTable.delegate=self;
        CommentTable.dataSource=self;
        CommentTable.backgroundColor = [UIColor clearColor];
        CommentTable.tag = 2;
        CommentTable.separatorStyle=UITableViewCellSeparatorStyleNone;
        CommentTable.showsVerticalScrollIndicator = YES;
        [MainScroll addSubview:CommentTable];
    }
    
    if ([[UIScreen mainScreen]bounds].size.width == 320)
    {
        pinimage2.frame = CGRectMake(235, -9, 35, 35);
        feeditemprice.frame = CGRectMake(170,0,70,60);
    }
    else
    {
        pinimage2.frame = CGRectMake(270, -9, 35, 35);
        feeditemprice.frame = CGRectMake(210,0,70,60);
    }


    // Do any additional setup after loading the view.
}

//Backbutton function.....
-(void)Backbutton:(UIButton *)sender{
    
    ViewController *view = [[ViewController alloc]init];
    [self.navigationController pushViewController:view animated:YES];
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
    
    
    if (tableView.tag == 1) {
        
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
        
        UILabel *feedusercommentdate = [[UILabel alloc]initWithFrame:CGRectMake(170, 5,80,50)];
        feedusercommentdate.text=@"12 dec";
        feedusercommentdate.textColor=[UIColor lightGrayColor];
        feedusercommentdate.textAlignment=NSTextAlignmentCenter;
        [feedusercommentdate setBackgroundColor:[UIColor clearColor]];
        feedusercommentdate.font=[UIFont fontWithName:@"Helvetica" size:19];
        [cell addSubview:feedusercommentdate];
        
        UILabel *feedusertitle = [[UILabel alloc]initWithFrame:CGRectMake(62, 30,210,50)];
        feedusertitle.text=@"@mc_arnold | Lv. 1 Foodie";
        feedusertitle.textColor=[UIColor lightGrayColor];
        feedusertitle.textAlignment=NSTextAlignmentLeft;
        [feedusertitle setBackgroundColor:[UIColor clearColor]];
        feedusertitle.font=[UIFont fontWithName:@"Helvetica" size:15];
        [cell addSubview:feedusertitle];
        
        UILabel *feeduserdescription = [[UILabel alloc]initWithFrame:CGRectMake(15, 60,270,40)];
        feeduserdescription.text=@"Fusce imperdiet porta imperdiet";
        feeduserdescription.textColor=[UIColor colorWithRed:(168.0f/255.0f) green:(168.0f/255.0f) blue:(168.0f/255.0f) alpha:1];
        feeduserdescription.textAlignment=NSTextAlignmentLeft;
        [feeduserdescription setBackgroundColor:[UIColor clearColor]];
        feeduserdescription.font=[UIFont fontWithName:@"Helvetica" size:16];
        [cell addSubview:feeduserdescription];
        
        
        UIImageView *lineimage = [[UIImageView alloc]initWithFrame:CGRectMake(CardTable.frame.origin.x-37, feeduserdescription.frame.origin.x+100, CardTable.frame.size.width-10, 40)];
        [lineimage setImage:[UIImage imageNamed:@"bottomdividerline"]];
        [cell addSubview:lineimage];
        
        UILabel *heartgraycount = [[UILabel alloc]initWithFrame:CGRectMake(CardTable.frame.origin.x-33, feeduserdescription.frame.origin.x+105,30,30)];
        heartgraycount.text=@"30";
        heartgraycount.textColor=[UIColor lightGrayColor];
        heartgraycount.textAlignment=NSTextAlignmentLeft;
        [heartgraycount setBackgroundColor:[UIColor clearColor]];
        heartgraycount.font=[UIFont fontWithName:@"Helvetica" size:18];
        [cell addSubview:heartgraycount];
        
        UIImageView *heartgrayimage = [[UIImageView alloc]initWithFrame:CGRectMake(CardTable.frame.origin.x-6, feeduserdescription.frame.origin.x+110, 32-8, 28-8)];
        [heartgrayimage setImage:[UIImage imageNamed:@"heartgray"]];
        [cell addSubview:heartgrayimage];
        
        
        UILabel *commentgraycount = [[UILabel alloc]initWithFrame:CGRectMake(CardTable.frame.origin.x+26, feeduserdescription.frame.origin.x+105,30,30)];
        commentgraycount.text=@"20";
        commentgraycount.textColor=[UIColor lightGrayColor];
        commentgraycount.textAlignment=NSTextAlignmentLeft;
        [commentgraycount setBackgroundColor:[UIColor clearColor]];
        commentgraycount.font=[UIFont fontWithName:@"Helvetica" size:18];
        [cell addSubview:commentgraycount];
        
        UIImageView *commentgrayimage = [[UIImageView alloc]initWithFrame:CGRectMake(CardTable.frame.origin.x+55, feeduserdescription.frame.origin.x+110, 29-8, 29-8)];
        [commentgrayimage setImage:[UIImage imageNamed:@"commentgrayimage"]];
        [cell addSubview:commentgrayimage];
        
        UIImageView *heartredimage = [[UIImageView alloc]initWithFrame:CGRectMake(CardTable.frame.origin.x+90, feeduserdescription.frame.origin.x+110, 32-8, 28-8)];
        [heartredimage setImage:[UIImage imageNamed:@"heartred"]];
        [cell addSubview:heartredimage];
        
        UIImageView *commentbuttonblack = [[UIImageView alloc]initWithFrame:CGRectMake(CardTable.frame.origin.x+140, feeduserdescription.frame.origin.x+110, 32-8, 28-8)];
        [commentbuttonblack setImage:[UIImage imageNamed:@"commentbuttonblack"]];
        [cell addSubview:commentbuttonblack];
        
        
        UIImageView *settingsbutton = [[UIImageView alloc]initWithFrame:CGRectMake(CardTable.frame.origin.x+190, feeduserdescription.frame.origin.x+110, 5, 23)];
        [settingsbutton setImage:[UIImage imageNamed:@"morebutton"]];
        [cell addSubview:settingsbutton];
        
    }
    
    else
    {
        
        cell.backgroundColor = [UIColor colorWithRed:(247.0f/255.0f) green:(247.0f/255.0f) blue:(247.0f/255.0f) alpha:1.0];
        UIImageView *userimage=[[UIImageView alloc]initWithFrame:CGRectMake(2,6,55,55)];
        userimage.image=[UIImage imageNamed:@"userimage2"];
        [cell addSubview:userimage];
        
        UILabel *feedusername=[[UILabel alloc]initWithFrame:CGRectMake(70, 3,120,50)];
        feedusername.text=@"Mc Arnold";
        feedusername.textColor=[UIColor grayColor];
        feedusername.textAlignment=NSTextAlignmentLeft;
        [feedusername setBackgroundColor:[UIColor clearColor]];
        feedusername.font=[UIFont fontWithName:@"Helvetica Bold" size:20];
        [cell addSubview:feedusername];
   
        
        UILabel *feedusercommentdate = [[UILabel alloc]initWithFrame:CGRectMake(205, 3,80,50)];
        feedusercommentdate.text=@"12 dec";
        feedusercommentdate.textColor=[UIColor lightGrayColor];
        feedusercommentdate.textAlignment=NSTextAlignmentCenter;
        [feedusercommentdate setBackgroundColor:[UIColor clearColor]];
        feedusercommentdate.font=[UIFont fontWithName:@"Helvetica" size:20];
        [cell addSubview:feedusercommentdate];
        
        
        UILabel *feedusertitle = [[UILabel alloc]initWithFrame:CGRectMake(70, 30,230,50)];
        feedusertitle.text=@"@mc_arnold | Lv. 1 Foodie";
        feedusertitle.textColor=[UIColor lightGrayColor];
        feedusertitle.textAlignment=NSTextAlignmentLeft;
        [feedusertitle setBackgroundColor:[UIColor clearColor]];
        feedusertitle.font=[UIFont fontWithName:@"Helvetica" size:17];
        [cell addSubview:feedusertitle];
        
        
        UILabel *feeduserdescription = [[UILabel alloc]initWithFrame:CGRectMake(12, 60,280,40)];
        feeduserdescription.text=@"Fusce imperdiet porta imperdiet";
        feeduserdescription.textColor=[UIColor colorWithRed:(168.0f/255.0f) green:(168.0f/255.0f) blue:(168.0f/255.0f) alpha:1];
        feeduserdescription.textAlignment=NSTextAlignmentLeft;
        [feeduserdescription setBackgroundColor:[UIColor clearColor]];
        feeduserdescription.font=[UIFont fontWithName:@"Helvetica" size:18];
        [cell addSubview:feeduserdescription];
        
        
        UIImageView *lineimage = [[UIImageView alloc]initWithFrame:CGRectMake(CardTable.frame.origin.x-25, feeduserdescription.frame.origin.x+100, CardTable.frame.size.width-20, 40)];
        [lineimage setImage:[UIImage imageNamed:@"bottomdividerline"]];
        [cell addSubview:lineimage];
        
        
        UILabel *heartgraycount = [[UILabel alloc]initWithFrame:CGRectMake(CardTable.frame.origin.x-10, feeduserdescription.frame.origin.x+105,30,30)];
        heartgraycount.text=@"30";
        heartgraycount.textColor=[UIColor lightGrayColor];
        heartgraycount.textAlignment=NSTextAlignmentLeft;
        [heartgraycount setBackgroundColor:[UIColor clearColor]];
        heartgraycount.font=[UIFont fontWithName:@"Helvetica" size:20];
        [cell addSubview:heartgraycount];
        
        
        
        UIImageView *heartgrayimage = [[UIImageView alloc]initWithFrame:CGRectMake(CardTable.frame.origin.x+17, feeduserdescription.frame.origin.x+110, 32-6, 28-6)];
        [heartgrayimage setImage:[UIImage imageNamed:@"heartgray"]];
        [cell addSubview:heartgrayimage];
        
        
        
        UILabel *commentgraycount = [[UILabel alloc]initWithFrame:CGRectMake(CardTable.frame.origin.x+48, feeduserdescription.frame.origin.x+105,30,30)];
        commentgraycount.text=@"20";
        commentgraycount.textColor=[UIColor lightGrayColor];
        commentgraycount.textAlignment=NSTextAlignmentLeft;
        [commentgraycount setBackgroundColor:[UIColor clearColor]];
        commentgraycount.font=[UIFont fontWithName:@"Helvetica" size:20];
        [cell addSubview:commentgraycount];
        
        UIImageView *commentgrayimage = [[UIImageView alloc]initWithFrame:CGRectMake(CardTable.frame.origin.x+80, feeduserdescription.frame.origin.x+110, 29-6, 29-6)];
        [commentgrayimage setImage:[UIImage imageNamed:@"commentgrayimage"]];
        [cell addSubview:commentgrayimage];
        
        
        
        UIImageView *heartredimage = [[UIImageView alloc]initWithFrame:CGRectMake(CardTable.frame.origin.x+125, feeduserdescription.frame.origin.x+110, 32-6, 28-6)];
        [heartredimage setImage:[UIImage imageNamed:@"heartred"]];
        [cell addSubview:heartredimage];
        
        UIImageView *commentbuttonblack = [[UIImageView alloc]initWithFrame:CGRectMake(CardTable.frame.origin.x+175, feeduserdescription.frame.origin.x+110, 32-6, 28-6)];
        [commentbuttonblack setImage:[UIImage imageNamed:@"commentbuttonblack"]];
        [cell addSubview:commentbuttonblack];
        
        UIImageView *settingsbutton = [[UIImageView alloc]initWithFrame:CGRectMake(CardTable.frame.origin.x+225, feeduserdescription.frame.origin.x+110, 5, 23)];
        [settingsbutton setImage:[UIImage imageNamed:@"morebutton"]];
        [cell addSubview:settingsbutton];
    }
    
}
    else
    {
        if ([[UIScreen mainScreen]bounds].size.width == 320)
        {
            
            UIView *cellbackview = [[UIView alloc]initWithFrame:CGRectMake(0.0f, 10, CommentTable.frame.size.width, 120)];
            cellbackview.backgroundColor = [UIColor colorWithRed:(247.0f/255.0f) green:(247.0f/255.0f) blue:(247.0f/255.0f) alpha:1.0];
            [cell addSubview:cellbackview];

            UIImageView *userimage=[[UIImageView alloc]initWithFrame:CGRectMake(2,6,55,55)];
            userimage.image=[UIImage imageNamed:@"userimage2"];
            [cellbackview addSubview:userimage];
            
            UILabel *feedusername=[[UILabel alloc]initWithFrame:CGRectMake(70, 3,140,50)];
            feedusername.text=@"Jack Jonson";
            feedusername.textColor=[UIColor grayColor];
            feedusername.textAlignment=NSTextAlignmentLeft;
            [feedusername setBackgroundColor:[UIColor clearColor]];
            feedusername.font=[UIFont fontWithName:@"Helvetica Bold" size:17];
            [cellbackview addSubview:feedusername];
            
            
            UILabel *feedusertitle = [[UILabel alloc]initWithFrame:CGRectMake(70, 22,100,50)];
            feedusertitle.text=@"15 Dec";
            feedusertitle.textColor=[UIColor lightGrayColor];
            feedusertitle.textAlignment=NSTextAlignmentLeft;
            [feedusertitle setBackgroundColor:[UIColor clearColor]];
            feedusertitle.font=[UIFont fontWithName:@"Helvetica" size:15];
            [cellbackview addSubview:feedusertitle];
            
            UILabel *feeduserdescription = [[UILabel alloc]initWithFrame:CGRectMake(12, 60,220,50)];
            feeduserdescription.text=@"Fusce imperdiet porta imperdiet Fusce imperdiet porta imperdiet";
            feeduserdescription.textColor=[UIColor colorWithRed:(168.0f/255.0f) green:(168.0f/255.0f) blue:(168.0f/255.0f) alpha:1];
            feeduserdescription.textAlignment=NSTextAlignmentLeft;
            feeduserdescription.numberOfLines = 2;
            [feeduserdescription setBackgroundColor:[UIColor clearColor]];
            feeduserdescription.font=[UIFont fontWithName:@"Helvetica" size:14];
            [cellbackview addSubview:feeduserdescription];
            
            
            UIImageView *heartgrayimage = [[UIImageView alloc]initWithFrame:CGRectMake(CardTable.frame.origin.x+160, feeduserdescription.frame.origin.x+3, 32-6, 28-6)];
            [heartgrayimage setImage:[UIImage imageNamed:@"heartgray"]];
            [cellbackview addSubview:heartgrayimage];
            
            
            UILabel *heartgraycount = [[UILabel alloc]initWithFrame:CGRectMake(CardTable.frame.origin.x+188, feeduserdescription.frame.origin.x-3,30,30)];
            heartgraycount.text=@"30";
            heartgraycount.textColor=[UIColor lightGrayColor];
            heartgraycount.textAlignment=NSTextAlignmentLeft;
            [heartgraycount setBackgroundColor:[UIColor clearColor]];
            heartgraycount.font=[UIFont fontWithName:@"Helvetica" size:20];
            [cellbackview addSubview:heartgraycount];
            
        }
        else
        {
            
            UIView *cellbackview = [[UIView alloc]initWithFrame:CGRectMake(0.0f, 10, CommentTable.frame.size.width, 120)];
            cellbackview.backgroundColor = [UIColor colorWithRed:(247.0f/255.0f) green:(247.0f/255.0f) blue:(247.0f/255.0f) alpha:1.0];
            [cell addSubview:cellbackview];
            
            UIImageView *userimage=[[UIImageView alloc]initWithFrame:CGRectMake(2,6,55,55)];
            userimage.image=[UIImage imageNamed:@"userimage2"];
            [cellbackview addSubview:userimage];
            
            UILabel *feedusername=[[UILabel alloc]initWithFrame:CGRectMake(70, 3,160,50)];
            feedusername.text=@"Jack Jonson";
            feedusername.textColor=[UIColor grayColor];
            feedusername.textAlignment=NSTextAlignmentLeft;
            [feedusername setBackgroundColor:[UIColor clearColor]];
            feedusername.font=[UIFont fontWithName:@"Helvetica Bold" size:20];
            [cellbackview addSubview:feedusername];
            
            
            UILabel *feedusertitle = [[UILabel alloc]initWithFrame:CGRectMake(70, 30,120,50)];
            feedusertitle.text=@"15 Dec";
            feedusertitle.textColor=[UIColor lightGrayColor];
            feedusertitle.textAlignment=NSTextAlignmentLeft;
            [feedusertitle setBackgroundColor:[UIColor clearColor]];
            feedusertitle.font=[UIFont fontWithName:@"Helvetica" size:17];
            [cellbackview addSubview:feedusertitle];
            
            UILabel *feeduserdescription = [[UILabel alloc]initWithFrame:CGRectMake(12, 60,280,50)];
            feeduserdescription.text=@"Fusce imperdiet porta imperdiet Fusce imperdiet porta imperdiet";
            feeduserdescription.textColor=[UIColor colorWithRed:(168.0f/255.0f) green:(168.0f/255.0f) blue:(168.0f/255.0f) alpha:1];
            feeduserdescription.textAlignment=NSTextAlignmentLeft;
            feeduserdescription.numberOfLines = 2;
            [feeduserdescription setBackgroundColor:[UIColor clearColor]];
            feeduserdescription.font=[UIFont fontWithName:@"Helvetica" size:18];
            [cellbackview addSubview:feeduserdescription];

            
        UIImageView *heartgrayimage = [[UIImageView alloc]initWithFrame:CGRectMake(CardTable.frame.origin.x+202, feeduserdescription.frame.origin.x+3, 32-6, 28-6)];
            [heartgrayimage setImage:[UIImage imageNamed:@"heartgray"]];
            [cellbackview addSubview:heartgrayimage];
            
            
            UILabel *heartgraycount = [[UILabel alloc]initWithFrame:CGRectMake(CardTable.frame.origin.x+240, feeduserdescription.frame.origin.x-3,30,30)];
            heartgraycount.text=@"30";
            heartgraycount.textColor=[UIColor lightGrayColor];
            heartgraycount.textAlignment=NSTextAlignmentLeft;
            [heartgraycount setBackgroundColor:[UIColor clearColor]];
            heartgraycount.font=[UIFont fontWithName:@"Helvetica" size:20];
            [cellbackview addSubview:heartgraycount];
            
        }
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (tableView.tag == 1) {
        return 170;
    }
    else{
    return 140;
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
