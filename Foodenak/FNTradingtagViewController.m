//
//  FNTradingtagViewController.m
//  Foodenak
//
//  Created by Soumarsi Kundu on 20/01/15.
//  Copyright (c) 2015 Esolz Tech. All rights reserved.
//

#import "FNTradingtagViewController.h"
#import "ViewController.h"
#import "FNtagViewController.h"
@interface FNTradingtagViewController ()<UITableViewDataSource,UITableViewDelegate>{
    
    UIView *MainView;
    UIImageView *TopView,*topbar,*followersselectedline,*followingselectedline,*tablebackview;
    UIButton *BackButton,*followerslabel,*followinglbl;
    UILabel *EditProfileLbl;
    UITableView *FollowerstableView;
    
    NSMutableArray *steakarray,*cardsarray;
}

@end

@implementation FNTradingtagViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    steakarray = [[NSMutableArray alloc]init];
    cardsarray = [[NSMutableArray alloc]init];
    
    
    steakarray = [[NSMutableArray alloc]initWithObjects:@"# Steak",@"# Potato",@"# Steak",@"# Potato",@"# Steak",@"# Potato", nil];
    
    cardsarray = [[NSMutableArray alloc]initWithObjects:@"3000 Cards",@"200 Cards",@"100 Cards",@"2000 Cards",@"108 Cards",@"2300 Cards", nil];
    
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
    [followerslabel setTitle:@"Followers" forState:UIControlStateNormal];
    [followerslabel setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    followerslabel.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:18];
    [followerslabel addTarget:self action:@selector(followers:) forControlEvents:UIControlEventTouchUpInside];
    [MainView addSubview:followerslabel];
    
    
    followersselectedline = [[UIImageView alloc]init];
    [followersselectedline setImage:[UIImage imageNamed:@"textline"]];
    [MainView addSubview:followersselectedline];
    
    //following label....
    followinglbl = [[UIButton alloc]init];
    [followinglbl setTitle:@"Following" forState:UIControlStateNormal];
    [followinglbl setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    followinglbl.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:18];
    [followinglbl addTarget:self action:@selector(following:) forControlEvents:UIControlEventTouchUpInside];
    [MainView addSubview:followinglbl];
    
    followingselectedline = [[UIImageView alloc]init];
    [MainView addSubview:followingselectedline];

    //==========================tableview back view......===============
    
    tablebackview = [[UIImageView alloc]initWithFrame:CGRectMake(20, 160, self.view.frame.size.width-40, 400)];
    [tablebackview setImage:[UIImage imageNamed:@"popularbg"]];
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
        followerslabel.frame = CGRectMake(20, 100, 100, 30);
        followinglbl.frame = CGRectMake(130, 100, 100, 30);
        followersselectedline.frame = CGRectMake(40, 131, 60, 4);
        FollowerstableView.frame = CGRectMake(30,168,self.view.frame.size.width-60,380);
        
    }
    else
    {
        followerslabel.frame = CGRectMake(50, 100, 100, 30);
        followinglbl.frame = CGRectMake(170, 100, 100, 30);
        followersselectedline.frame = CGRectMake(70, 131, 60, 4);
        FollowerstableView.frame = CGRectMake(30,168,self.view.frame.size.width-60,380);
        
    }
    
    // Do any additional setup after loading the view.
}
//Backbutton function.....
-(void)Backbutton:(UIButton *)sender{
    
    [self.navigationController popViewControllerAnimated:NO];
}


-(void)followers:(UIButton *)sender{
    
    [followerslabel setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [followinglbl setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [followersselectedline setImage:[UIImage imageNamed:@"textline"]];
    if ([[UIScreen mainScreen]bounds].size.width == 320)
    {
        followersselectedline.frame = CGRectMake(40, 131, 60, 4);
        followingselectedline.frame = CGRectMake(0, 0, 0, 0);
    }
    else
    {
        followersselectedline.frame = CGRectMake(70, 131, 60, 4);
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
        followingselectedline.frame = CGRectMake(150, 131, 60, 4);
    }
    else
    {
        followersselectedline.frame = CGRectMake(0, 0, 0, 0);
        followingselectedline.frame = CGRectMake(190, 131, 60, 4);
    }
}
//table view delegate method......

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return steakarray.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    
    UIImageView *steakimage = [[UIImageView alloc]init];
    [steakimage setImage:[UIImage imageNamed:@"tagimg2"]];
    [cell addSubview:steakimage];
    
    UILabel *steaklbl = [[UILabel alloc]init];
    [steaklbl setBackgroundColor:[UIColor clearColor]];
    [steaklbl setText:[NSString stringWithFormat:@"%@",[steakarray objectAtIndex:indexPath.row]]];
    [steaklbl setTextAlignment:NSTextAlignmentLeft];
    [steaklbl setTextColor:[UIColor lightGrayColor]];
    [steaklbl setFont:[UIFont fontWithName:@"Helvetica" size:16]];
    [steakimage addSubview:steaklbl];
    
    UILabel *cardlabl = [[UILabel alloc]init];
    [cardlabl setBackgroundColor:[UIColor clearColor]];
    [cardlabl setText:[NSString stringWithFormat:@"%@",[cardsarray objectAtIndex:indexPath.row]]];
    [cardlabl setTextAlignment:NSTextAlignmentLeft];
    [cardlabl setTextColor:[UIColor lightGrayColor]];
    [cardlabl setFont:[UIFont fontWithName:@"Helvetica" size:16]];
    [steakimage addSubview:cardlabl];
    
    
    if ([[UIScreen mainScreen]bounds].size.width == 320) {
        
        steakimage.frame = CGRectMake(10, 10, 120, 40);
        steaklbl.frame = CGRectMake(10, 5, 100, 30);
        cardlabl.frame = CGRectMake(165, 5, 100, 30);
    }
    else
    {
        steakimage.frame = CGRectMake(10, 10, 140, 40);
        steaklbl.frame = CGRectMake(10, 5, 100, 30);
        cardlabl.frame = CGRectMake(190, 5, 100, 30);
    }
    
    return  cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    FNtagViewController *list = [[FNtagViewController alloc]init];
    [self.navigationController pushViewController:list animated:NO];
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
