//
//  FNfollowersViewController.m
//  Foodenak
//
//  Created by Soumarsi Kundu on 20/01/15.
//  Copyright (c) 2015 Esolz Tech. All rights reserved.
//

#import "FNfollowersViewController.h"
#import "ViewController.h"

@interface FNfollowersViewController ()<UITableViewDataSource,UITableViewDelegate>{
    
    UIView *MainView;
    UIImageView *TopView,*topbar;
    UIButton *BackButton,*followerslabel,*followinglbl;
    UILabel *EditProfileLbl;
    UIImageView *followersselectedline,*followingselectedline;
    UIImageView *gradientview;
    UITableView *FollowerstableView;
    
}

@end

@implementation FNfollowersViewController

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
    [EditProfileLbl setText:@"@paulm"];
    [EditProfileLbl setTextAlignment:NSTextAlignmentLeft];
    [EditProfileLbl setTextColor:[UIColor whiteColor]];
    [EditProfileLbl setFont:[UIFont fontWithName:@"Helvetica Bold" size:20]];
    [TopView addSubview:EditProfileLbl];

    //topbar gradient/////
    
    topbar=[[UIImageView alloc]initWithFrame:CGRectMake(MainView.frame.origin.x,TopView.frame.size.height,MainView.frame.size.width,55)];
    topbar.image=[UIImage imageNamed:@"topbar"];
    topbar.userInteractionEnabled=YES;
    [MainView addSubview:topbar];
    
    //follow label...
    
    followerslabel = [[UIButton alloc]init];
    [followerslabel setTitle:@"Followers 20" forState:UIControlStateNormal];
    [followerslabel setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    followerslabel.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:18];
    [followerslabel addTarget:self action:@selector(followers:) forControlEvents:UIControlEventTouchUpInside];
    [MainView addSubview:followerslabel];
    
    
    followersselectedline = [[UIImageView alloc]init];
    [followersselectedline setImage:[UIImage imageNamed:@"textline"]];
    [MainView addSubview:followersselectedline];
    
    //following label....
    followinglbl = [[UIButton alloc]init];
    [followinglbl setTitle:@"Following 20" forState:UIControlStateNormal];
    [followinglbl setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    followinglbl.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:18];
    [followinglbl addTarget:self action:@selector(following:) forControlEvents:UIControlEventTouchUpInside];
    [MainView addSubview:followinglbl];
    
    followingselectedline = [[UIImageView alloc]init];
    [MainView addSubview:followingselectedline];
    
    
    
    
    //////////////////=============================///////////////////////====================
    
    //gradientview.........
    
    gradientview = [[UIImageView alloc]init];
    [gradientview setImage:[UIImage imageNamed:@"gradientview"]];
    [MainView addSubview:gradientview];
    
    [gradientview setFrame:CGRectMake(20, 150, self.view.frame.size.width-40, 30)];
    
    
    //tablebackview.....
    
    UIView *tablebackview = [[UIView alloc]initWithFrame:CGRectMake(20, 180, self.view.frame.size.width-40, 500)];
    [tablebackview setBackgroundColor:[UIColor whiteColor]];
    [MainView addSubview:tablebackview];
    
    
    //followers table view...
    
    FollowerstableView=[[UITableView alloc]init];
    FollowerstableView.backgroundColor=[UIColor clearColor];
    FollowerstableView.dataSource=self;
    FollowerstableView.delegate=self;
    FollowerstableView.separatorStyle=NO;
    FollowerstableView.userInteractionEnabled=YES;
    [MainView addSubview:FollowerstableView];
    
    
    
    if ([[UIScreen mainScreen]bounds].size.width == 320)
    {
        followerslabel.frame = CGRectMake(20, 100, 120, 30);
        followinglbl.frame = CGRectMake(180, 100, 120, 30);
        followersselectedline.frame = CGRectMake(20, 132, 120, 3);
        FollowerstableView.frame = CGRectMake(20, 190, self.view.frame.size.width-40, 380);
        
    }
    else
    {
        followerslabel.frame = CGRectMake(30, 100, 120, 30);
        followinglbl.frame = CGRectMake(230, 100, 120, 30);
        followersselectedline.frame = CGRectMake(25, 132, 130, 3);
        FollowerstableView.frame = CGRectMake(20, 190, self.view.frame.size.width-40, 460);
        
    }
    // Do any additional setup after loading the view.
}
//Backbutton function.....
-(void)Backbutton:(UIButton *)sender{
    
    ViewController *view = [[ViewController alloc]init];
    [self.navigationController pushViewController:view animated:YES];
}


-(void)followers:(UIButton *)sender{
    
    [followerslabel setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [followinglbl setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [followersselectedline setImage:[UIImage imageNamed:@"textline"]];
     if ([[UIScreen mainScreen]bounds].size.width == 320)
     {
         followersselectedline.frame = CGRectMake(20, 132, 120, 3);
         followingselectedline.frame = CGRectMake(0, 0, 0, 0);
     }
    else
    {
        followersselectedline.frame = CGRectMake(25, 132, 130, 3);
         followingselectedline.frame = CGRectMake(0, 0, 0, 0);
    }
    
}

-(void)following:(UIButton *)sender{
    
    [followerslabel setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [followinglbl setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [followingselectedline setImage:[UIImage imageNamed:@"textline"]];
    if ([[UIScreen mainScreen]bounds].size.width == 320)
    {
        followersselectedline.frame = CGRectMake(0, 0, 0, 0);
        followingselectedline.frame = CGRectMake(180, 132, 120, 3);
    }
    else
    {
        followersselectedline.frame = CGRectMake(0, 0, 0, 0);
        followingselectedline.frame = CGRectMake(230, 132, 120, 3);
    }
}
//table view delegate method......

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
 
    UIImageView *cellBackview = [[UIImageView alloc]initWithFrame:CGRectMake(15, 10, FollowerstableView.frame.size.width-30, 135)];
    [cellBackview setImage:[UIImage imageNamed:@"followerscellview"]];
    [cell addSubview:cellBackview];
    
    
    UIImageView *userimage = [[UIImageView alloc]initWithFrame:CGRectMake(14.5, 9.3f, 63, 63)];
    [userimage setImage:[UIImage imageNamed:@"userimage2"]];
    [cell addSubview:userimage];
    
    UILabel *username = [[UILabel alloc]initWithFrame:CGRectMake(90, 25, 100, 30)];
    [username setBackgroundColor:[UIColor clearColor]];
    [username setText:@"Jack Jonson"];
    [username setTextAlignment:NSTextAlignmentLeft];
    [username setTextColor:[UIColor blackColor]];
    [username setFont:[UIFont fontWithName:@"Helvetica" size:16]];
    [cell addSubview:username];
    
    
    UILabel *foodielbl = [[UILabel alloc]init];
    [foodielbl setBackgroundColor:[UIColor clearColor]];
    [foodielbl setText:@"Lv 1 Foodie"];
    [foodielbl setTextAlignment:NSTextAlignmentLeft];
    [foodielbl setTextColor:[UIColor lightGrayColor]];
    [foodielbl setFont:[UIFont fontWithName:@"Helvetica" size:14]];
    [cell addSubview:foodielbl];
    
    UILabel *cardslbl = [[UILabel alloc]init];
    [cardslbl setBackgroundColor:[UIColor clearColor]];
    [cardslbl setText:@"200 Cards"];
    [cardslbl setTextAlignment:NSTextAlignmentCenter];
    [cardslbl setTextColor:[UIColor lightGrayColor]];
    [cardslbl setFont:[UIFont fontWithName:@"Helvetica" size:16]];
    [cell addSubview:cardslbl];
    
    UILabel *followerslbl = [[UILabel alloc]init];
    [followerslbl setBackgroundColor:[UIColor clearColor]];
    [followerslbl setText:@"700\n Followers"];
    followerslbl.numberOfLines = 2;
    [followerslbl setTextAlignment:NSTextAlignmentCenter];
    [followerslbl setTextColor:[UIColor lightGrayColor]];
    [followerslbl setFont:[UIFont fontWithName:@"Helvetica" size:16]];
    [cell addSubview:followerslbl];
    
    UIButton *addbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    [addbutton setBackgroundImage:[UIImage imageNamed:@"addbutton"] forState:UIControlStateNormal];
    //[addbutton addTarget:self action:@selector(add:) forControlEvents:UIControlEventTouchUpInside];
    [cell addSubview:addbutton];
    
    if ([[UIScreen mainScreen]bounds].size.width == 320)
    {
        foodielbl.frame = CGRectMake(20, 100, 80, 30);
        cardslbl.frame = CGRectMake(100, 100, 80, 30);
        followerslbl.frame = CGRectMake(180, 100, 80, 40);
        addbutton.frame = CGRectMake(230, 25, 28, 25);
    }
    else
    {
        foodielbl.frame = CGRectMake(25, 100, 100, 30);
        cardslbl.frame = CGRectMake(110, 100, 120, 30);
        followerslbl.frame = CGRectMake(220, 100, 80, 40);
        addbutton.frame = CGRectMake(265, 25, 28, 25);
    }
    
    return  cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 160;
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
