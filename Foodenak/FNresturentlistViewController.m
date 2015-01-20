//
//  FNresturentlistViewController.m
//  Foodenak
//
//  Created by Soumarsi Kundu on 20/01/15.
//  Copyright (c) 2015 Esolz Tech. All rights reserved.
//

#import "FNresturentlistViewController.h"
#import "ViewController.h"
@interface FNresturentlistViewController ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>{
    
    UIView *MainView;
    UIImageView *TopView,*search,*searchbarimage,*tableviewbackgroundimage;
    UIButton *BackButton,*Filterbutton;
    UITableView *Resturenttableview;
    UIScrollView *MainScroll;
    NSMutableArray *Discountarray,*termsarray,*weakarray;
    UIButton *Mapbutton;
}

@end

@implementation FNresturentlistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //background view...........
    
    Discountarray = [[NSMutableArray alloc]init];
    termsarray = [[NSMutableArray alloc]init];
    weakarray = [[NSMutableArray alloc]init];
    
    
    Discountarray = [[NSMutableArray alloc]initWithObjects:@"Discount 50%",@"Free ice cream",@"Discount", nil];
    termsarray = [[NSMutableArray alloc]initWithObjects:@"terms",@"terms",@"terms", nil];
    weakarray = [[NSMutableArray alloc]initWithObjects:@"Monday-Friday Min $5",@"Monday-Friday Min $5",@"Monday-Friday Min $5", nil];
    
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
    
    //search bar image.....
    
    searchbarimage = [[UIImageView alloc]initWithFrame:CGRectMake(45, 32, self.view.frame.size.width-95, 35)];
    [searchbarimage setImage:[UIImage imageNamed:@"searchbar"]];
    [TopView addSubview:searchbarimage];
    
    //filter button topview......
    
    Filterbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    [Filterbutton setBackgroundImage:[UIImage imageNamed:@"filterbutton"] forState:UIControlStateNormal];
    [Filterbutton addTarget:self action:@selector(filterbutton:) forControlEvents:UIControlEventTouchUpInside];
    [TopView addSubview:Filterbutton];
    
    if (self.view.frame.size.width == 320)
    {
        Filterbutton.frame = CGRectMake(285, 34, 23, 30);
    }
    else
    {
        Filterbutton.frame = CGRectMake(335, 34, 23, 30);
    }
    
    
    //tableview background image...
    
    tableviewbackgroundimage = [[UIImageView alloc]init];
    [tableviewbackgroundimage setImage:[UIImage imageNamed:@"popularbg"]];
    [MainView addSubview:tableviewbackgroundimage];
    
    
    // resturent list tableview///////
    
    Resturenttableview=[[UITableView alloc]init];
    Resturenttableview.backgroundColor=[UIColor clearColor];
    Resturenttableview.dataSource=self;
    Resturenttableview.delegate=self;
    Resturenttableview.separatorStyle=NO;
    Resturenttableview.userInteractionEnabled=YES;
    [MainView addSubview:Resturenttableview];
    
    Mapbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [Mapbutton setBackgroundImage:[UIImage imageNamed:@"mapbutton"] forState:UIControlStateNormal];
    //[Mapbutton addTarget:self action:@selector(map:) forControlEvents:UIControlEventTouchUpInside];
    [MainView addSubview:Mapbutton];
    
    
    
    if ([[UIScreen mainScreen]bounds].size.width == 320)
    {
        tableviewbackgroundimage.frame = CGRectMake(MainView.frame.origin.x+20, 100, MainView.frame.size.width-40, 450);
        Resturenttableview.frame = CGRectMake(MainView.frame.origin.x+28, 110, MainView.frame.size.width-56, 380);
        [Mapbutton setFrame:CGRectMake(MainView.frame.origin.x+28+15, 110+390, MainView.frame.size.width-56-30, 40)];
    }
    else
    {
        tableviewbackgroundimage.frame = CGRectMake(MainView.frame.origin.x+20, 100, MainView.frame.size.width-40, 550);
        Resturenttableview.frame = CGRectMake(MainView.frame.origin.x+28, 110, MainView.frame.size.width-56, 480);
        [Mapbutton setFrame:CGRectMake(MainView.frame.origin.x+28+15, 110+490, MainView.frame.size.width-56-30, 40)];
    }
    
    
    

    
    // Do any additional setup after loading the view.
}

//Backbutton function.....
-(void)Backbutton:(UIButton *)sender{
    
    ViewController *view = [[ViewController alloc]init];
    [self.navigationController pushViewController:view animated:YES];
}

-(void)filterbutton:(UIButton *)sender{
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//table view delegate method......

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
    
    UIImageView *cellBackview = [[UIImageView alloc]initWithFrame:CGRectMake(15, 10, Resturenttableview.frame.size.width-30, 120)];
    [cellBackview setImage:[UIImage imageNamed:@"logobg"]];
    [cell addSubview:cellBackview];
    
    
    UIImageView *logoimage = [[UIImageView alloc]initWithFrame:CGRectMake(8, 6, 70, 60)];
    [logoimage setImage:[UIImage imageNamed:@"dominozzpizzalogo"]];
    [cellBackview addSubview:logoimage];
    
    UILabel *pizzatext = [[UILabel alloc]initWithFrame:CGRectMake(90, 9, 100, 30)];
    [pizzatext setBackgroundColor:[UIColor clearColor]];
    [pizzatext setText:@"Domino's"];
    [pizzatext setTextAlignment:NSTextAlignmentLeft];
    [pizzatext setTextColor:[UIColor blackColor]];
    [pizzatext setFont:[UIFont fontWithName:@"Helvetica Bold" size:18]];
    [cellBackview addSubview:pizzatext];
    
    UILabel *dollarlabel = [[UILabel alloc]init];
    [dollarlabel setBackgroundColor:[UIColor clearColor]];
    [dollarlabel setText:@"90.0$"];
    [dollarlabel setTextAlignment:NSTextAlignmentLeft];
    [dollarlabel setTextColor:[UIColor lightGrayColor]];
    [dollarlabel setFont:[UIFont fontWithName:@"Helvetica Light" size:20]];
    [cellBackview addSubview:dollarlabel];
    
    
    UIImageView *nearbyicon = [[UIImageView alloc]initWithFrame:CGRectMake(92, 69, 14, 20)];
    [nearbyicon setImage:[UIImage imageNamed:@"neariconblack"]];
    [cellBackview addSubview:nearbyicon];
  
    UILabel *nearbylabel = [[UILabel alloc]init];
    [nearbylabel setBackgroundColor:[UIColor clearColor]];
    [nearbylabel setText:@"lorem ipsum"];
    [nearbylabel setTextAlignment:NSTextAlignmentLeft];
    [nearbylabel setTextColor:[UIColor darkGrayColor]];
    [nearbylabel setFont:[UIFont fontWithName:@"Helvetica" size:14]];
    [cellBackview addSubview:nearbylabel];
    
    
    UIImageView *fastfood = [[UIImageView alloc]initWithFrame:CGRectMake(90, 94, 20, 20)];
    [fastfood setImage:[UIImage imageNamed:@"fastfood"]];
    [cellBackview addSubview:fastfood];
    
    UILabel *fastfoodlabel = [[UILabel alloc]init];
    [fastfoodlabel setBackgroundColor:[UIColor clearColor]];
    [fastfoodlabel setText:@"lorem ipsum"];
    [fastfoodlabel setTextAlignment:NSTextAlignmentLeft];
    [fastfoodlabel setTextColor:[UIColor darkGrayColor]];
    [fastfoodlabel setFont:[UIFont fontWithName:@"Helvetica" size:14]];
    [cellBackview addSubview:fastfoodlabel];
    
    
    //callbutton....
    
    UIButton *Callbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    [Callbutton setBackgroundImage:[UIImage imageNamed:@"callbutton"] forState:UIControlStateNormal];
    //[Callbutton addTarget:self action:@selector(callbutton:) forControlEvents:UIControlEventTouchUpInside];
    [cell addSubview:Callbutton];
    
    //card label////////////////////////////////////////============================
    
    UIImageView *cardimage = [[UIImageView alloc]init];
    [cardimage setImage:[UIImage imageNamed:@"cardbackborder"]];
    [cell addSubview:cardimage];
    
    
    UILabel *cardlabel = [[UILabel alloc]init];
    [cardlabel setBackgroundColor:[UIColor clearColor]];
    [cardlabel setText:@"200 Cards"];
    [cardlabel setTextAlignment:NSTextAlignmentCenter];
    [cardlabel setTextColor:[UIColor darkGrayColor]];
    [cardlabel setFont:[UIFont fontWithName:@"Helvetica" size:14]];
    [cell addSubview:cardlabel];
    
    
    
    UIImageView *cardimage1 = [[UIImageView alloc]init];
    [cardimage1 setImage:[UIImage imageNamed:@"cardbackborderred"]];
    [cell addSubview:cardimage1];
    
    
    UILabel *cardlabel1 = [[UILabel alloc]init];
    [cardlabel1 setBackgroundColor:[UIColor clearColor]];
    [cardlabel1 setText:@"3 Deals"];
    [cardlabel1 setTextAlignment:NSTextAlignmentCenter];
    [cardlabel1 setTextColor:[UIColor redColor]];
    [cardlabel1 setFont:[UIFont fontWithName:@"Helvetica" size:14]];
    [cell addSubview:cardlabel1];
    
    UIImageView *cardimage2 = [[UIImageView alloc]init];
    [cardimage2 setImage:[UIImage imageNamed:@"cardbackimage"]];
    [cell addSubview:cardimage2];
    
    
    UILabel *cardlabel2 = [[UILabel alloc]init];
    [cardlabel2 setBackgroundColor:[UIColor clearColor]];
    [cardlabel2 setText:@"100 M"];
    [cardlabel2 setTextAlignment:NSTextAlignmentRight];
    [cardlabel2 setTextColor:[UIColor darkGrayColor]];
    [cardlabel2 setFont:[UIFont fontWithName:@"Helvetica" size:14]];
    [cell addSubview:cardlabel2];
    
    
    UIImageView *cellBackview1 = [[UIImageView alloc]initWithFrame:CGRectMake(15, 195, Resturenttableview.frame.size.width-30, 150)];
    [cellBackview1 setImage:[UIImage imageNamed:@"logobg"]];
    [cell addSubview:cellBackview1];
    
    
    //arrow button........
    
    UIImageView *arrowimage = [[UIImageView alloc]init];
    [arrowimage setImage:[UIImage imageNamed:@"darkarrowbutton"]];
    [cell addSubview:arrowimage];
    
    
    
//    MainScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(15, 0, Resturenttableview.frame.size.width-30, 150)];
//    MainScroll.userInteractionEnabled=YES;
//    MainScroll.scrollEnabled=YES;
//    MainScroll.delegate=self;
//    MainScroll.bounces=YES;
//    MainScroll.showsHorizontalScrollIndicator=NO;
//    [cellBackview1 addSubview:MainScroll];
//    
//    
//    MainScroll.contentSize = CGSizeMake(0, 700);
//    
//    int h = 100;
//    
//    
//    for (int k =0; k<Discountarray.count; k++) {
    
        UIView *backview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Resturenttableview.frame.size.width-30, 100)];
        [backview setBackgroundColor:[UIColor clearColor]];
        [cellBackview1 addSubview:backview];
        
        UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 80, 70)];
        [image setImage:[UIImage imageNamed:@"dominozzpizzalogo"]];
        [backview addSubview:image];
        
        
        UILabel *discountlabel = [[UILabel alloc]init];
        [discountlabel setBackgroundColor:[UIColor clearColor]];
        [discountlabel setText:[NSString stringWithFormat:@"%@",[Discountarray objectAtIndex:0]]];
        [discountlabel setTextAlignment:NSTextAlignmentLeft];
        [discountlabel setTextColor:[UIColor darkGrayColor]];
        discountlabel.numberOfLines =2;
        [discountlabel setFont:[UIFont fontWithName:@"Helvetica" size:14]];
        [backview addSubview:discountlabel];
    
    
    UILabel *termslbl = [[UILabel alloc]init];
    [termslbl setBackgroundColor:[UIColor clearColor]];
    [termslbl setText:[NSString stringWithFormat:@"%@:",[termsarray objectAtIndex:0]]];
    [termslbl setTextAlignment:NSTextAlignmentLeft];
    [termslbl setTextColor:[UIColor redColor]];
    termslbl.numberOfLines =1;
    [termslbl setFont:[UIFont fontWithName:@"Helvetica" size:14]];
    [backview addSubview:termslbl];
    
    
    UILabel *weklabl = [[UILabel alloc]init];
    [weklabl setBackgroundColor:[UIColor clearColor]];
    [weklabl setText:[NSString stringWithFormat:@"%@",[weakarray objectAtIndex:0]]];
    [weklabl setTextAlignment:NSTextAlignmentLeft];
    [weklabl setTextColor:[UIColor lightGrayColor]];
    weklabl.numberOfLines =2;
    [weklabl setFont:[UIFont fontWithName:@"Helvetica" size:12]];
    [backview addSubview:weklabl];
    
    

    
        if ([[UIScreen mainScreen]bounds].size.width ==320)
        {
            discountlabel.frame = CGRectMake(95, 10, 100, 25);
            termslbl.frame = CGRectMake(95, 20, 100, 35);
            weklabl.frame = CGRectMake(95, 35, 100, 50);

        }
        else
        {
            discountlabel.frame = CGRectMake(95, 10, 100, 25);
            termslbl.frame = CGRectMake(95, 20, 100, 35);
            weklabl.frame = CGRectMake(95, 35, 100, 50);
        }
        
//        h = h+105;
//    }
    
    
    
    /////===========================////////////=========================////////////=========
    
    
    if ([[UIScreen mainScreen]bounds].size.width == 320)
    {
        dollarlabel.frame = CGRectMake(180, 9, 60, 30);
        
        //star image....
        
        int j = 90;
        
        for (int u = 0; u<4; u++) {
            
            UIImageView *popularstar1=[[UIImageView alloc]initWithFrame:CGRectMake(j,43,22,18)];
            popularstar1.image=[UIImage imageNamed:@"staron"];
            [cellBackview addSubview:popularstar1];
            
            j = j+30;
        }
        
        
        
        UIImageView *popularstar5=[[UIImageView alloc]initWithFrame:CGRectMake(210,43,22,18)];
        popularstar5.image=[UIImage imageNamed:@"staroff"];
        [cellBackview addSubview:popularstar5];
        
        nearbylabel.frame = CGRectMake(114, 69, 110, 20);
        fastfoodlabel.frame = CGRectMake(114, 94, 110, 20);
        Callbutton.frame = CGRectMake(15, 140, 23, 30);
        cardimage.frame = CGRectMake(45, 140, 65, 30);
        cardlabel.frame = CGRectMake(45, 140, 65, 30);
        cardimage1.frame = CGRectMake(116, 140, 68, 30);
        cardlabel1.frame = CGRectMake(116, 140, 68, 30);
        cardimage2.frame = CGRectMake(188, 140, 60, 30);
        cardlabel2.frame = CGRectMake(188, 140, 60, 30);
        arrowimage.frame = CGRectMake(150, 177, 40, 20);
    }
    else
    {
        dollarlabel.frame = CGRectMake(230, 9, 60, 30);
        //star image....
        
        int j = 90;
        
        for (int u = 0; u<4; u++) {
            
            UIImageView *popularstar1=[[UIImageView alloc]initWithFrame:CGRectMake(j,41,29,24)];
            popularstar1.image=[UIImage imageNamed:@"staron"];
            [cellBackview addSubview:popularstar1];
            
            j = j+36;
        }
        
        
        
        UIImageView *popularstar5=[[UIImageView alloc]initWithFrame:CGRectMake(238,41,29,24)];
        popularstar5.image=[UIImage imageNamed:@"staroff"];
        [cellBackview addSubview:popularstar5];
        
        nearbylabel.frame = CGRectMake(114, 69, 180, 20);
        fastfoodlabel.frame = CGRectMake(114, 94, 180, 20);
        Callbutton.frame = CGRectMake(15, 140, 33, 36);
        cardimage.frame = CGRectMake(55, 140, 80, 36);
        cardlabel.frame = CGRectMake(55, 140, 80, 36);
        cardimage1.frame = CGRectMake(140, 140, 80, 36);
        cardlabel1.frame = CGRectMake(140, 140, 80, 36);
        cardimage2.frame = CGRectMake(225, 140, 80, 36);
        cardlabel2.frame = CGRectMake(225, 140, 70, 36);
        arrowimage.frame = CGRectMake(160, 177, 40, 20);
    }
    
    return  cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 350;
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
