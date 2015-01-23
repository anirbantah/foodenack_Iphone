//
//  FNresturentdetailsViewController.m
//  Foodenak
//
//  Created by Soumarsi Kundu on 20/01/15.
//  Copyright (c) 2015 Esolz Tech. All rights reserved.
//

#import "FNresturentdetailsViewController.h"
#define RGBCOLOR(x,y,z,f) [UIColor colorWithRed:(x/255.0f) green:(y/255.0f) blue:(z/255.0f) alpha:f]

#define  MainScreenHeight [[UIScreen mainScreen]bounds].size.height

#define  MainScreenWidth  [[UIScreen mainScreen]bounds].size.width
#define HALVELTICA(x)  [UIFont fontWithName:@"Helvetica Bold" size:x]

#define HALVELTICA_LIGHT(x)  [UIFont fontWithName:@"Helvetica Light" size:x]
@interface FNresturentdetailsViewController ()<UIScrollViewDelegate,UIGestureRecognizerDelegate,UITableViewDataSource,UITableViewDelegate>
{
    
    float TopViewHeight;
    
    UIScrollView *MainScroll;
    UIImageView *topview;
    UIView *MainView;
   
    UIButton *menubutton,*locatorbutton,*camerabutton,*messegebutton,*editbutton,*BackButton;
}


// cme code
@property(nonatomic,readwrite) UILabel *KfcBACKLabel;


//top shaow section

@property(nonatomic,readwrite)UIView *TopContainerView,*StartContainerView,*ButtonContainerView,*LocationMap,*RatingTopViewView,*RatingDropDownView;
@property(nonatomic,readwrite) UIImageView *TopInfoView;
@property(nonatomic,readwrite) UILabel *KFCLabel,*DolarLabel;

@property(nonatomic,readwrite) UIView *TopMapView,*TopFastView,*TopClockView;
@property(nonatomic,readwrite) UIImageView *TopMapImgView,*TopFastImgView,*TopClockImgView;
@property(nonatomic,readwrite) UILabel *TopMapLabel,*TopFastLabel,*TopClockLabel;
@property (nonatomic,readwrite) UIButton *TopOpenBtn;
@property(nonatomic,readwrite) UITableView *MoreTableView;
// end


@property(nonatomic,readwrite) UIButton *LocationBtn;
@property(nonatomic,readwrite)    NSArray *FoodArray;
// end 

@end

@implementation FNresturentdetailsViewController

@synthesize KfcBACKLabel;

// top infoview
@synthesize TopInfoView,TopContainerView,StartContainerView;
@synthesize KFCLabel,DolarLabel;
@synthesize TopClockImgView,TopFastImgView,TopMapImgView,TopClockLabel,TopFastLabel,TopMapLabel,TopClockView,TopFastView,TopMapView,TopOpenBtn,ButtonContainerView,LocationBtn,LocationMap,RatingTopViewView,RatingDropDownView,MoreTableView,FoodArray;
//end

- (void)viewDidLoad

{
    
    TopViewHeight=117/2;
    
    [super viewDidLoad];
    
   FoodArray=[[NSArray alloc]initWithObjects:@"Fried Chicken",@"Fries",@"Potato",@"Pepsi", nil];
    
    

    MainView=[[UIView alloc]initWithFrame:CGRectMake(0,0,MainScreenWidth,MainScreenHeight)];
    MainView.backgroundColor=RGBCOLOR(222, 222, 222, 1);
    MainView.userInteractionEnabled=YES;
    [self.view addSubview:MainView];
    
    topview=[[UIImageView alloc]initWithFrame:CGRectMake(MainView.frame.origin.x,MainView.frame.origin.y-20,MainView.frame.size.width,100)];
    topview.image=[UIImage imageNamed:@"topview"];
    topview.userInteractionEnabled=YES;
    [MainView addSubview:topview];
    
    //back button declare......
    UIImage *backImage=[UIImage imageNamed:@"backarrow"];
    BackButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [BackButton setFrame:CGRectMake(20,55, backImage.size.width/2, backImage.size.height/2)];
    [BackButton setImage:backImage forState:UIControlStateNormal];
    [BackButton setImage:backImage forState:UIControlStateHighlighted];
    [BackButton setImage:backImage forState:UIControlStateSelected];
    [BackButton addTarget:self action:@selector(Backbutton:) forControlEvents:UIControlEventTouchUpInside];
    [topview addSubview:BackButton];
    
    
    //edit profile label allocation....
    
    KfcBACKLabel = [[UILabel alloc]initWithFrame:CGRectMake(BackButton.frame.origin.x+BackButton.frame.size.width+4,47, 120, backImage.size.height)];
    [KfcBACKLabel setBackgroundColor:[UIColor clearColor]];
    [KfcBACKLabel setText:@"KFC:"];
    [KfcBACKLabel setTextAlignment:NSTextAlignmentLeft];
    [KfcBACKLabel setTextColor:[UIColor whiteColor]];
    [KfcBACKLabel setFont:HALVELTICA(15)];
    [topview addSubview:KfcBACKLabel];
    
    
    
    menubutton=[[UIButton alloc]initWithFrame:CGRectMake(5,58,33/2,24/2)];
    [menubutton setBackgroundImage:[UIImage imageNamed:@"menuicon"] forState:UIControlStateNormal];
    [menubutton setBackgroundImage:[UIImage imageNamed:@"menuicon"] forState:UIControlStateSelected];
    [menubutton setBackgroundImage:[UIImage imageNamed:@"menuicon"] forState:UIControlStateHighlighted];
    //[menubutton addTarget:self action:@selector(LeftTogglemenu:) forControlEvents:UIControlEventTouchUpInside];
    //[topview addSubview:menubutton];
    
    UIButton *menutap=[[UIButton alloc]initWithFrame:CGRectMake(0,42,50,50)];
    [menutap setBackgroundColor:[UIColor clearColor]];
    //[menutap addTarget:self action:@selector(LeftTogglemenu:) forControlEvents:UIControlEventTouchUpInside];
    //[topview addSubview:menutap];
    
    UIImage *EditIconImg=[UIImage imageNamed:@"editicon"];
    editbutton=[[UIButton alloc]initWithFrame:CGRectMake(260,56,EditIconImg.size.width/2,EditIconImg.size.height/2)];
    [editbutton setBackgroundImage:EditIconImg forState:UIControlStateNormal];
     [editbutton setBackgroundImage:EditIconImg forState:UIControlStateSelected];
     [editbutton setBackgroundImage:EditIconImg forState:UIControlStateHighlighted];
    [topview addSubview:editbutton];
    
    
    UIImage *CameraImg=[UIImage imageNamed:@"cameraicon"];
    camerabutton=[[UIButton alloc]initWithFrame:CGRectMake(editbutton.frame.origin.x+editbutton.frame.size.width+28,56,CameraImg.size.width/2,CameraImg.size.height/2)];
    
    [camerabutton setBackgroundImage:CameraImg forState:UIControlStateNormal];
    [camerabutton setBackgroundImage:CameraImg forState:UIControlStateSelected];
    [camerabutton setBackgroundImage:CameraImg forState:UIControlStateHighlighted];
    
    [topview addSubview:camerabutton];
    
    UIImage *MessageImg=[UIImage imageNamed:@"messegeicon"];
    
    messegebutton=[[UIButton alloc]initWithFrame:CGRectMake(camerabutton.frame.origin.x+camerabutton.frame.size.width+28,56,MessageImg.size.width/2,MessageImg.size.height/2)];
    
    [messegebutton setBackgroundImage:MessageImg forState:UIControlStateNormal];
    [messegebutton setBackgroundImage:MessageImg forState:UIControlStateSelected];
    [messegebutton setBackgroundImage:MessageImg forState:UIControlStateHighlighted];
    
    [topview addSubview:messegebutton];
    
    UIView *HeaderNarrowBar=[[UIView alloc]initWithFrame:CGRectMake(0, topview.frame.origin.y+topview.frame.size.height, MainScreenWidth, 2)];
    [HeaderNarrowBar setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"shadowbar-1"]]];
    [MainView addSubview:HeaderNarrowBar];
    
    
    
    MainScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0.0f,HeaderNarrowBar.frame.origin.y+HeaderNarrowBar.frame.size.height, self.view.frame.size.width, self.view.frame.size.height-80)];
    MainScroll.userInteractionEnabled=YES;
    MainScroll.scrollEnabled=YES;
    MainScroll.delegate=self;
    MainScroll.bounces=YES;
    MainScroll.showsHorizontalScrollIndicator=NO;
    [MainView addSubview:MainScroll];
    
    MainScroll.contentSize = CGSizeMake(0, 3600);
    
    
    //start of top container view
    
    TopContainerView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, MainScroll.frame.size.width, 454/2-5)];
    
    [TopContainerView setBackgroundColor:[UIColor clearColor]];
    
    [MainScroll addSubview:TopContainerView];
    
    //start of top info view
    
    TopInfoView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, TopContainerView.frame.size.width, 367/2)];
    [TopInfoView setImage:[UIImage imageNamed:@"logobackground"]];
    [TopContainerView addSubview:TopInfoView];
    
    //START OF KFC LABEL
    
    KFCLabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 10, 100, 30)];
    [KFCLabel setFont:HALVELTICA(22)];
    [KFCLabel setTextColor:[UIColor whiteColor]];
    [KFCLabel setTextAlignment:NSTextAlignmentLeft];
    [KFCLabel setText:@"KFC"];
    [TopInfoView addSubview:KFCLabel];
    
    //END OF KFC LABEL
    
    
    //START OF DOLAR LABEL
    DolarLabel=[[UILabel alloc]initWithFrame:CGRectMake(KFCLabel.frame.origin.x+KFCLabel.frame.size.width+180, 10, 100, 30)];
    [DolarLabel setFont:HALVELTICA(17)];
    
    [DolarLabel setTextColor:[UIColor whiteColor]];
    [DolarLabel setTextAlignment:NSTextAlignmentLeft];
    [DolarLabel setText:@"90.0$"];
    [TopInfoView addSubview:DolarLabel];
    
    //END OF DOLAR LABEL
    
    // STARS START
    StartContainerView=[[UIView alloc]initWithFrame:CGRectMake(KFCLabel.frame.origin.x+3 , KFCLabel.frame.size.height+KFCLabel.frame.origin.y+18, 200, 30)];
    
    StartContainerView.backgroundColor=[UIColor clearColor];
    
    [TopInfoView addSubview:StartContainerView];
    
    CGRect PreFrame=CGRectMake(0, 0, 49/2, 44/2);
    
    int j=2;
    
    for (int i=0; i<5; i++) {
        
   UIButton * StarBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        
        [StarBtn setFrame:PreFrame];
        
        NSString *ImageName=nil;
        
        if (j>i) {
            
            ImageName=@"staron";
            
        } else {
            ImageName=@"staroff";
            
        }
        
        [StarBtn setBackgroundImage:[UIImage imageNamed:ImageName] forState:UIControlStateNormal];
        
        [StarBtn setBackgroundImage:[UIImage imageNamed:ImageName] forState:UIControlStateSelected];
        
        [StarBtn setBackgroundImage:[UIImage imageNamed:ImageName] forState:UIControlStateHighlighted];
        
        [StartContainerView addSubview:StarBtn];
        
        PreFrame.origin.x=PreFrame.origin.x+PreFrame.size.width+5;
        
        
        
    }
    [TopInfoView addSubview:StartContainerView];
    
    // END OF STARTS
    
    
    //START OF MAP LABEL
    TopMapView=[[UIView alloc]initWithFrame:CGRectMake(StartContainerView.frame.origin.x, StartContainerView.frame.origin.y+StartContainerView.frame.size.height, 240, 23)];
    [TopMapView setBackgroundColor:[UIColor clearColor]];
    [TopInfoView addSubview:TopMapView];
    
    TopMapImgView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 19/2, 26/2)];
    [TopMapImgView setImage:[UIImage imageNamed:@"TopMap"]];
    [TopMapView addSubview:TopMapImgView];
    
    TopMapLabel=[[UILabel alloc]initWithFrame:CGRectMake(TopMapImgView.frame.size.width+12, 0, 180, 15)];
    [TopMapLabel setFont:HALVELTICA(12)];
    [TopMapLabel setTextColor:[UIColor whiteColor]];
    [TopMapLabel setTextAlignment:NSTextAlignmentLeft];
    [TopMapLabel setText:@"Lorem ipsum dolar sit amet"];
    [TopMapView addSubview:TopMapLabel];
    //END OF MAP LABEL
    
    
    //START OF FAST LABEL
    TopFastView=[[UIView alloc]initWithFrame:CGRectMake(StartContainerView.frame.origin.x, TopMapView.frame.origin.y+TopMapView.frame.size.height, 240, 23)];
    [TopFastView setBackgroundColor:[UIColor clearColor]];
    [TopInfoView addSubview:TopFastView];
    
    TopFastImgView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 27/2, 23/2)];
    [TopFastImgView setImage:[UIImage imageNamed:@"TopFastFood"]];
    [TopFastView addSubview:TopFastImgView];
    
    TopFastLabel=[[UILabel alloc]initWithFrame:CGRectMake(TopMapImgView.frame.size.width+12, 0, 180, 15)];
    [TopFastLabel setFont:HALVELTICA(12)];
    [TopFastLabel setTextColor:[UIColor whiteColor]];
    [TopFastLabel setTextAlignment:NSTextAlignmentLeft];
    [TopFastLabel setText:@"Fast food"];
    [TopFastView addSubview:TopFastLabel];
    //END OF FAST LABEL
    
    
    //START OF clock LABEL
    TopClockView=[[UIView alloc]initWithFrame:CGRectMake(StartContainerView.frame.origin.x, TopFastView.frame.origin.y+TopFastView.frame.size.height, 240, 23)];
    [TopClockView setBackgroundColor:[UIColor clearColor]];
    [TopInfoView addSubview:TopClockView];
    
    TopClockImgView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 24/2, 26/2)];
    [TopClockImgView setImage:[UIImage imageNamed:@"TopClock"]];
    [TopClockView addSubview:TopClockImgView];
    
    TopClockLabel=[[UILabel alloc]initWithFrame:CGRectMake(TopMapImgView.frame.size.width+12, 0, 180, 15)];
    [TopClockLabel setFont:HALVELTICA(12)];
    [TopClockLabel setTextColor:[UIColor whiteColor]];
    [TopClockLabel setTextAlignment:NSTextAlignmentLeft];
    [TopClockLabel setText:@"Today: 10am - 10pm"];
    [TopClockView addSubview:TopClockLabel];
    //END OF clock LABEL
    
    //START OF OPEN BUTTON
    
    TopOpenBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    [TopOpenBtn setFrame:CGRectMake(250, TopFastView.frame.origin.y+9, 177/2, 52/2)];
    [TopOpenBtn setBackgroundImage:[UIImage imageNamed:@"TopOpenBtn"] forState:UIControlStateNormal];
    [TopOpenBtn setBackgroundImage:[UIImage imageNamed:@"TopOpenBtn"] forState:UIControlStateSelected];
    [TopOpenBtn setBackgroundImage:[UIImage imageNamed:@"TopOpenBtn"] forState:UIControlStateHighlighted];
    [TopInfoView addSubview:TopOpenBtn];
    
    
    
    
    //END OF OPEN BUTTON
    
    
    //START OF BUTTON SECTION
    
    ButtonContainerView=[[UIView alloc]initWithFrame:CGRectMake(0, TopInfoView.frame.size.height, TopContainerView.frame.size.width, 454/2-376/2)];
    [ButtonContainerView setBackgroundColor:RGBCOLOR(255, 255, 255, 1)];
    [TopContainerView addSubview:ButtonContainerView];
    
NSArray *ButtonImageArray=[[NSArray alloc]initWithObjects:@"TopTele",@"TopCheckBtn",@"TopShare",@"TopBag", nil];
    
   
    CGRect PreFrame12=CGRectMake(0, 0, (MainScreenWidth-3)/4, ButtonContainerView.frame.size.height);
    for (int i=0; i<[ButtonImageArray count]; i++) {
        NSLog(@"the iiiiiii----%d",i);
        UIView *BtnView=[[UIView alloc]initWithFrame:CGRectMake(PreFrame12.origin.x, 0,PreFrame12.size.width ,PreFrame12.size.height)];
        UIImage *Img=[UIImage imageNamed:[ButtonImageArray objectAtIndex:i]];
      
        UIImageView *ImagVew=[[UIImageView alloc] initWithFrame:CGRectMake(BtnView.frame.size.width/2-Img.size.width/4, BtnView.frame.size.height/2-Img.size.height/4, Img.size.width/2, Img.size.height/2)];
        [ImagVew setImage:Img];
        [BtnView addSubview:ImagVew];
        [ButtonContainerView addSubview:BtnView];
        
        UIImageView *VSeperator=[[UIImageView alloc]initWithFrame:CGRectMake(BtnView.frame.origin.x+BtnView.frame.size.width, 4, 1, ButtonContainerView.frame.size.height-8)];
        [VSeperator setBackgroundColor:RGBCOLOR(90, 90, 90, 1)];
        [ButtonContainerView addSubview:VSeperator];
        
        PreFrame12=BtnView.frame;
        PreFrame12.origin.x=PreFrame12.origin.x+PreFrame12.size.width+1;
        NSLog(@"---->>%f",PreFrame12.origin.x);
        
        
    }
    
    
    // END OF BUTTON SECTION
    
    
    
    
    
    
    
    // end of top info view
    
    
    // end of the top container view
    
    
    
    //START OF LOCATION
    
    UIImage *LocationImage=[UIImage imageNamed:@"loaction-iocn"];
    
    LocationBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [LocationBtn setFrame:CGRectMake(MainScreenWidth/2-(178+385)/4, TopContainerView.frame.origin.y+TopContainerView.frame.size.height+20,178/2 , 159/2)];
    
    [LocationBtn setBackgroundImage:LocationImage forState:UIControlStateNormal];
    [LocationBtn setBackgroundImage:LocationImage forState:UIControlStateSelected];
    [LocationBtn setBackgroundImage:LocationImage forState:UIControlStateHighlighted];
    
    [MainScroll addSubview:LocationBtn];
    
    
    // END OF LOCATION
    
    // START OF MAP
    
    LocationMap=[[UIView alloc] initWithFrame:CGRectMake(LocationBtn.frame.origin.x+LocationBtn.frame.size.width, LocationBtn.frame.origin.y, 385/2, 159/2)];
    [LocationMap setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"map"]]];
    [MainScroll addSubview:LocationMap];
    
    
    
    
    //END OF MAP
    
    
    
    // START OF LOCATION IMAGE VIEW
    UIImageView *LocationImgView=[[UIImageView alloc] initWithFrame:CGRectMake(MainScreenWidth/2-581/4, LocationMap.frame.origin.y+LocationMap.frame.size.height+3, 581/2, 78/2)];
    [LocationImgView setImage:[UIImage imageNamed:@"bg-with-location"]];
    [MainScroll addSubview:LocationImgView];
    [LocationImgView setUserInteractionEnabled:YES];
    
    UILabel *LocationLbl=[[UILabel alloc]initWithFrame:CGRectMake(32, 13, 180, 15)];
    [LocationLbl setFont:HALVELTICA(12)];
    [LocationLbl setTextColor:RGBCOLOR(90, 90, 90, 1)];
    [LocationLbl setTextAlignment:NSTextAlignmentLeft];
    [LocationLbl setText:@"Lorem ipsum dolar sit amet"];
    [LocationImgView addSubview:LocationLbl];
    
     // END OF LOCATION IMAGE VIEW
    
    
    //START OF RATING
    
    
    RatingTopViewView=[[UIView alloc]initWithFrame:CGRectMake(LocationImgView.frame.origin.x,LocationImgView.frame.origin.y+LocationImgView.frame.size.height+12, LocationImgView.frame.size.width, 40)];
    [RatingTopViewView setBackgroundColor:[UIColor whiteColor]];
    RatingTopViewView.layer.cornerRadius=6.0;
    [MainScroll addSubview:RatingTopViewView];
    
    
    UIImage *StarImg=[UIImage imageNamed:@"star"];
    UIImageView *StarImgView=[[UIImageView alloc] initWithFrame:CGRectMake(10, RatingTopViewView.frame.size.height/2-31/4-2, 33/2, 31/2)];
    [RatingTopViewView addSubview:StarImgView];
    [StarImgView setImage:StarImg];
    
    
    UILabel *RatingTxtLbl=[[UILabel alloc]initWithFrame:CGRectMake(35, 11, 180, 18)];
    [RatingTxtLbl setFont:HALVELTICA_LIGHT(15)];
    [RatingTxtLbl setTextColor:RGBCOLOR(190, 8, 35, 1)];
    [RatingTxtLbl setTextAlignment:NSTextAlignmentLeft];
    [RatingTxtLbl setText:@"Ratings"];
    [RatingTopViewView addSubview:RatingTxtLbl];
    
    UIButton *TapBtnForRating=[UIButton buttonWithType:UIButtonTypeCustom];
    [TapBtnForRating setBackgroundImage:[UIImage imageNamed:@"heartred"] forState:UIControlStateNormal];
    [TapBtnForRating setBackgroundImage:[UIImage imageNamed:@"heartgray"] forState:UIControlStateNormal];
    [TapBtnForRating setBackgroundImage:[UIImage imageNamed:@"heartgray"] forState:UIControlStateNormal];
   // [TapBtnForRating addTarget:self action:@selector(DropRatingsView:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    //SATRT OF MORE
    
    UIView *MoreTopView=[[UIView alloc]initWithFrame:CGRectMake(LocationImgView.frame.origin.x,RatingTopViewView.frame.origin.y+RatingTopViewView.frame.size.height+240, LocationImgView.frame.size.width, 40)];
    [MoreTopView setBackgroundColor:[UIColor whiteColor]];
    MoreTopView.layer.cornerRadius=6.0;
    [MainScroll addSubview:MoreTopView];
    
    
    UIImage *MoreImg=[UIImage imageNamed:@"MoreImage"];
    UIImageView *MoreImgView=[[UIImageView alloc] initWithFrame:CGRectMake(10, RatingTopViewView.frame.size.height/2-34/4-2, 27/2, 34/2)];
    [MoreTopView addSubview:MoreImgView];
    [MoreImgView setImage:MoreImg];
    
    
    UILabel *MoreTxtLbl=[[UILabel alloc]initWithFrame:CGRectMake(35, 11, 180, 18)];
    [MoreTxtLbl setFont:HALVELTICA_LIGHT(15)];
    [MoreTxtLbl setTextColor:RGBCOLOR(190, 8, 35, 1)];
    [MoreTxtLbl setTextAlignment:NSTextAlignmentLeft];
    [MoreTxtLbl setText:@"Menus"];
    [MoreTopView addSubview:MoreTxtLbl];
    
    
    
    UIView *MenuTableContainerView=[[UIView alloc]initWithFrame:CGRectMake(RatingTopViewView.frame.origin.x, MoreTopView.frame.origin.y+MoreTopView.frame.size.height, RatingTopViewView.frame.size.width, 580)];
    [MainScroll addSubview:MenuTableContainerView];
    MenuTableContainerView.layer.cornerRadius=4.0;
    MenuTableContainerView.backgroundColor=RGBCOLOR(255, 255, 255, 1);
    
    MoreTableView=[[UITableView alloc]initWithFrame:CGRectMake(0,0, RatingTopViewView.frame.size.width, 500)];
    
    [MoreTableView setDelegate:self];
    [MoreTableView setDataSource:self];
    [MenuTableContainerView addSubview:MoreTableView];
    [MoreTableView setBackgroundColor:[UIColor clearColor]];
    
    [MoreTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [MoreTableView reloadData];
    
    
    UIButton *SeeMoreBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [SeeMoreBtn setFrame:CGRectMake(MenuTableContainerView.frame.size.width/2-497/4, MoreTableView.frame.size.height+20, 497/2, 64/2)];
    [SeeMoreBtn setBackgroundImage:[UIImage imageNamed:@"see-more"] forState:UIControlStateNormal];
    [SeeMoreBtn setBackgroundImage:[UIImage imageNamed:@"see-more"] forState:UIControlStateSelected];
    [SeeMoreBtn setBackgroundImage:[UIImage imageNamed:@"see-more"] forState:UIControlStateHighlighted];
    [MenuTableContainerView addSubview:SeeMoreBtn];
    
    
    
    
    
    

    
    
    
    
    
    // END OF menus
    
    
    
    // start of deals
    
    UIView *DealsContainerView=[[UIView alloc]initWithFrame:CGRectMake(MenuTableContainerView.frame.origin.x, MenuTableContainerView.frame.origin.y+MenuTableContainerView.frame.size.height+20, MenuTableContainerView.frame.size.width, 675/2)];
  //  DealsContainerView.layer.cornerRadius=6.0;
    
    [DealsContainerView setBackgroundColor:[UIColor clearColor]];
    [MainScroll addSubview:DealsContainerView];
    
    
    UIImageView *DealsTopView=[[UIImageView alloc]initWithFrame:CGRectMake(0,0, DealsContainerView.frame.size.width, TopViewHeight)];
    [DealsTopView setImage:[UIImage imageNamed:@"TopViewBg"]];
   
    
    [DealsContainerView addSubview:DealsTopView];
    
    
    UIImage *DealImg=[UIImage imageNamed:@"tag"];
    UIImageView *DealImgView=[[UIImageView alloc] initWithFrame:CGRectMake(20, DealsTopView.frame.size.height/2-TopViewHeight/2+22, 33/2, 33/2)];
    [DealsTopView addSubview:DealImgView];
    [DealImgView setImage:DealImg];
    
    
    UILabel *DealTxtLbl=[[UILabel alloc]initWithFrame:CGRectMake(40, DealImgView.frame.origin.y-2.5, 180, 18)];
    [DealTxtLbl setFont:HALVELTICA_LIGHT(15)];
    [DealTxtLbl setTextColor:RGBCOLOR(190, 8, 35, 1)];
    [DealTxtLbl setTextAlignment:NSTextAlignmentLeft];
    [DealTxtLbl setText:@"Deals"];
    [DealsTopView addSubview:DealTxtLbl];
    
    
    UIButton *DealsDropDownBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [DealsDropDownBtn setFrame:CGRectMake(250, DealImgView.frame.origin.y-2.5, 44/2, 22)];
    [DealsDropDownBtn setBackgroundImage:[UIImage imageNamed:@"up-arrow"] forState:UIControlStateNormal];
    [DealsDropDownBtn setBackgroundImage:[UIImage imageNamed:@"down-arrow"] forState:UIControlStateSelected];
    [DealsDropDownBtn setBackgroundImage:[UIImage imageNamed:@"down-arrow"] forState:UIControlStateHighlighted];
    [DealsTopView addSubview:DealsDropDownBtn];
    
    UIView *DealsScrollcontainerView=[[UIView alloc]initWithFrame:CGRectMake(0, DealsTopView.frame.origin.y+DealsTopView.frame.size.height, DealsContainerView.frame.size.width, 270)];
    [DealsContainerView addSubview:DealsScrollcontainerView];
    [DealsScrollcontainerView setBackgroundColor:[UIColor whiteColor]];
    
    UIImageView *ScrollTop=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, DealsScrollcontainerView.frame.size.width, 89/2)];
    [ScrollTop setImage:[UIImage imageNamed:@"ShadeImg"]];
    [DealsScrollcontainerView addSubview:ScrollTop];
    
    
    UIScrollView *DealsScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, DealsScrollcontainerView.frame.size.width, DealsScrollcontainerView.frame.size.height)];
    [DealsScrollView setBackgroundColor:[UIColor clearColor]];
    [DealsScrollcontainerView addSubview:DealsScrollView];
    
    CGRect P=CGRectMake(DealsScrollView.frame.size.width/2-501/4, 28, 501/2, 222/2);
    for (int i=0; i<2; i++) {
        UIImageView *ElementImgView=[[UIImageView alloc] initWithFrame:P];
        [ElementImgView setImage:[UIImage imageNamed:@"pic-bg"]];
        [DealsScrollView addSubview:ElementImgView];
        
        UIImageView *Pic=[[UIImageView alloc]initWithFrame:CGRectMake(ElementImgView.frame.size.height/2-162/4, ElementImgView.frame.size.height/2-162/4, 192/2, 162/2)];
        [Pic setImage:[UIImage imageNamed:@"logo"]];
        [ElementImgView addSubview:Pic];
        
        
        UILabel *DiccountLbl=[[UILabel alloc]initWithFrame:CGRectMake(Pic.frame.origin.x+Pic.frame.size.width+5, Pic.frame.origin.y, 70, 27)];
        [DiccountLbl setText:@"Discount"];
        [DiccountLbl setTextColor:RGBCOLOR(90, 90, 90, 1)];
        [DiccountLbl setFont:HALVELTICA(15)];
        [ElementImgView addSubview:DiccountLbl];
        
        
        UILabel *PercentLbl=[[UILabel alloc]initWithFrame:CGRectMake(DiccountLbl.frame.origin.x+DiccountLbl.frame.size.width, DiccountLbl.frame.origin.y, 70, 27)];
       [PercentLbl setText:@"50%"];
        
        [PercentLbl setTextColor:RGBCOLOR(218, 22,45, 1)];
        [PercentLbl setFont:HALVELTICA(15)];
        [ElementImgView addSubview:PercentLbl];
        
        
        
        
        UILabel *TermsLbl=[[UILabel alloc]initWithFrame:CGRectMake(DiccountLbl.frame.origin.x, DiccountLbl.frame.origin.y+DiccountLbl.frame.size.height, 70, 16)];
        [TermsLbl setText:@"Terms:"];
        
        [TermsLbl setTextColor:RGBCOLOR(218, 22,45, 1)];
        [TermsLbl setFont:HALVELTICA(13)];
        [ElementImgView addSubview:TermsLbl];
        
        UILabel *DayLbl=[[UILabel alloc]initWithFrame:CGRectMake(DiccountLbl.frame.origin.x, TermsLbl.frame.origin.y+TermsLbl.frame.size.height, 170, 16)];
        [DayLbl setText:@"Monday-Friday"];
        
        [DayLbl setTextColor:RGBCOLOR(110, 110,110, 1)];
        [DayLbl setFont:HALVELTICA(10)];
        [ElementImgView addSubview:DayLbl];
        
        UILabel *MinLbl=[[UILabel alloc]initWithFrame:CGRectMake(DiccountLbl.frame.origin.x, DayLbl.frame.origin.y+DayLbl.frame.size.height, 70, 16)];
        [MinLbl setText:@"Min$5"];
        
        [MinLbl setTextColor:RGBCOLOR(110, 110,110, 1)];
        [MinLbl setFont:HALVELTICA(10)];
        [ElementImgView addSubview:MinLbl];
        
        
        
        
        
        P=ElementImgView.frame;
        P.origin.y+=P.size.height+12;
        
    }
    
    
    
    
    UIImageView *BottomDealsCurve=[[UIImageView alloc]initWithFrame:CGRectMake(DealsScrollView.frame.origin.x-5, DealsScrollcontainerView.frame.origin.y+DealsScrollcontainerView.frame.size.height, DealsContainerView.frame.size.width+10, 27/2)];
    [BottomDealsCurve setImage:[UIImage imageNamed:@"BottomCurve"]];
    [DealsContainerView addSubview:BottomDealsCurve];
    
    
    
    
    

    
    //end of deals
    
    
    
    //START OF CARDS
    UIView *CardsContainerView=[[UIView alloc]initWithFrame:CGRectMake(MenuTableContainerView.frame.origin.x, DealsContainerView.frame.origin.y+DealsContainerView.frame.size.height+20, MenuTableContainerView.frame.size.width, 1316/2+37)];
    //  DealsContainerView.layer.cornerRadius=6.0;
    
    [CardsContainerView setBackgroundColor:[UIColor clearColor]];
    [MainScroll addSubview:CardsContainerView];
    
    
    UIImageView *CardsTopView=[[UIImageView alloc]initWithFrame:CGRectMake(0,0, CardsContainerView.frame.size.width, TopViewHeight)];
    [CardsTopView setImage:[UIImage imageNamed:@"TopViewBg"]];
    
    
    [CardsContainerView addSubview:CardsTopView];
    
    
    UIImage *CardImg=[UIImage imageNamed:@"CardImg"];
    UIImageView *CardImgView=[[UIImageView alloc] initWithFrame:CGRectMake(20, DealsTopView.frame.size.height/2-TopViewHeight/2+22, 31/2, 23/2)];
    [CardsTopView addSubview:CardImgView];
    [CardImgView setImage:CardImg];
    
    
    UILabel *CardTxtLbl=[[UILabel alloc]initWithFrame:CGRectMake(40, CardImgView.frame.origin.y-2.5, 180, 18)];
    [CardTxtLbl setFont:HALVELTICA_LIGHT(15)];
    [CardTxtLbl setTextColor:RGBCOLOR(190, 8, 35, 1)];
    [CardTxtLbl setTextAlignment:NSTextAlignmentLeft];
    [CardTxtLbl setText:@"Cards"];
    [CardsTopView addSubview:CardTxtLbl];
    
    
    UIButton *CardsDropDownBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [CardsDropDownBtn setFrame:CGRectMake(250, CardImgView.frame.origin.y-2.5, 44/2, 22)];
    [CardsDropDownBtn setBackgroundImage:[UIImage imageNamed:@"up-arrow"] forState:UIControlStateNormal];
    [CardsDropDownBtn setBackgroundImage:[UIImage imageNamed:@"down-arrow"] forState:UIControlStateSelected];
    [CardsDropDownBtn setBackgroundImage:[UIImage imageNamed:@"down-arrow"] forState:UIControlStateHighlighted];
    [CardsTopView addSubview:CardsDropDownBtn];
    
    
    
    UIView *CardsScrollcontainerView=[[UIView alloc]initWithFrame:CGRectMake(0, DealsTopView.frame.origin.y+DealsTopView.frame.size.height, DealsContainerView.frame.size.width, 1316/2-30)];
    [CardsContainerView addSubview:CardsScrollcontainerView];
    [CardsScrollcontainerView setBackgroundColor:[UIColor whiteColor]];
    
    UIImageView *CardsScrollTop=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, CardsScrollcontainerView.frame.size.width, 89/2)];
    [CardsScrollTop setImage:[UIImage imageNamed:@"ShadeImg"]];
    [CardsScrollcontainerView addSubview:CardsScrollTop];
    
    
    UIScrollView *CardsScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, CardsScrollcontainerView.frame.size.width, CardsScrollcontainerView.frame.size.height)];
    [CardsScrollView setBackgroundColor:[UIColor clearColor]];
    [CardsScrollcontainerView addSubview:CardsScrollView];
    
    
    UIImageView *CardsMapAnnotation=[[UIImageView alloc]initWithFrame:CGRectMake(20, 10, 12, 33/2)];
    [CardsMapAnnotation setImage:[UIImage imageNamed:@"locationredicon"]];
    [CardsScrollView addSubview:CardsMapAnnotation];
    
    UILabel *CardRestaurantNameLbl=[[UILabel alloc]initWithFrame:CGRectMake(40, CardsMapAnnotation.frame.origin.y-2.5, 180, 20)];
    [CardRestaurantNameLbl setBackgroundColor:[UIColor clearColor]];
    [CardRestaurantNameLbl setFont:HALVELTICA_LIGHT(15)];
    [CardRestaurantNameLbl setTextColor:RGBCOLOR(50, 50, 50, 1)];
    [CardRestaurantNameLbl setTextAlignment:NSTextAlignmentLeft];
    [CardRestaurantNameLbl setText:@"KFC"];
    [CardsScrollView addSubview:CardRestaurantNameLbl];
    
    
    
    UILabel *CardRestaurantAddressLbl=[[UILabel alloc]initWithFrame:CGRectMake(40, CardRestaurantNameLbl.frame.origin.y+CardRestaurantNameLbl.frame.size.height+.5, 280,18)];
    [CardRestaurantAddressLbl setFont:HALVELTICA_LIGHT(13)];
    [CardRestaurantAddressLbl setTextColor:RGBCOLOR(50, 50, 50, 1)];
    [CardRestaurantAddressLbl setTextAlignment:NSTextAlignmentLeft];
    [CardRestaurantAddressLbl setText:@"Lorem ipsum dolor sit amet"];
    [CardsScrollView addSubview:CardRestaurantAddressLbl];
    
    UIImageView *CardsMapPin=[[UIImageView alloc]initWithFrame:CGRectMake(252, 10, 35/2, 35/2)];
    [CardsMapPin setImage:[UIImage imageNamed:@"pin"]];
    [CardsScrollView addSubview:CardsMapPin];
    
    
    
    
    
    
    UIImageView *BottomCardsCurve=[[UIImageView alloc]initWithFrame:CGRectMake(CardsScrollView.frame.origin.x-5, CardsScrollcontainerView.frame.origin.y+CardsScrollcontainerView.frame.size.height, CardsContainerView.frame.size.width+10, 27/2)];
    [BottomCardsCurve setImage:[UIImage imageNamed:@"BottomCurve"]];
    [CardsContainerView addSubview:BottomCardsCurve];
    
    
    UIView *Hs1=[[UIView alloc]initWithFrame:CGRectMake(0, 56, CardsScrollView.frame.size.width, .5)];
    [Hs1 setBackgroundColor:RGBCOLOR(230, 230, 230, 1)];
    [CardsScrollView addSubview:Hs1];
    
    
    UIView *TopRatingSubView=[[UIView alloc]initWithFrame:CGRectMake(0, Hs1.frame.origin.y+1, CardsScrollView.frame.size.width,42)];
    [TopRatingSubView setBackgroundColor:[UIColor clearColor]];
    [CardsScrollView addSubview:TopRatingSubView];
    int CardstopRate=4;
    UIView *  TopStartContainerView=[[UIView alloc]initWithFrame:CGRectMake(50 ,0, 200, 35)];
    
    TopStartContainerView.backgroundColor=[UIColor clearColor];
    
    [TopRatingSubView addSubview:TopStartContainerView];
    
    CGRect PreFrame2=CGRectMake(0, 5, 49/2, 44/2);
    
    
    
    for (int i=0; i<5; i++) {
        
        UIButton * StarBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        
        [StarBtn setFrame:PreFrame2];
        
        NSString *ImageName=nil;
        
        if (CardstopRate>i) {
            
            ImageName=@"BigStar";
            
        } else {
            ImageName=@"SmallFadeStar";
            
        }
        
        [StarBtn setBackgroundImage:[UIImage imageNamed:ImageName] forState:UIControlStateNormal];
        
        [StarBtn setBackgroundImage:[UIImage imageNamed:ImageName] forState:UIControlStateSelected];
        
        [StarBtn setBackgroundImage:[UIImage imageNamed:ImageName] forState:UIControlStateHighlighted];
        
        [TopStartContainerView addSubview:StarBtn];
        
        PreFrame2.origin.x=PreFrame2.origin.x+PreFrame2.size.width+18;
        
        
        
    }
    UIView *Hs2=[[UIView alloc]initWithFrame:CGRectMake(0, 41, CardsScrollView.frame.size.width, 1.3)];
    [Hs2 setBackgroundColor:RGBCOLOR(230, 230, 230, 1)];
    [TopRatingSubView addSubview:Hs2];
    
    
    
    
    
    //START OF TEST LABEL
    
    int Cradstest=4;
    UIView *TestRatingSubView=[[UIView alloc]initWithFrame:CGRectMake(0,TopRatingSubView.frame.size.height+TopRatingSubView.frame.origin.y, CardsScrollView.frame.size.width,35)];
    
    [TestRatingSubView setBackgroundColor:RGBCOLOR(255, 255, 255, 1)];
    [CardsScrollView addSubview:TestRatingSubView];
    
    UILabel *TitleLbl=[[UILabel alloc] initWithFrame:CGRectMake(20, 4, 50, 23)];
    [TitleLbl setText:@"Test"];
    [TitleLbl setTextColor:RGBCOLOR(100, 100, 100, 1)];
    [TitleLbl setFont:HALVELTICA_LIGHT(14)];
    [TestRatingSubView addSubview:TitleLbl];
    
    
    // STARS START
    UIView * TestStartContainerView=[[UIView alloc]initWithFrame:CGRectMake(170 ,5,103, 26)];
    
    TestStartContainerView.backgroundColor=[UIColor clearColor];
    
    [TestRatingSubView addSubview:TestStartContainerView];
    
    CGRect PreFrame3=CGRectMake(0, 2, 33/2, 30/2);
    
    
    
    for (int i=0; i<5; i++) {
        
        UIButton * StarBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        
        [StarBtn setFrame:PreFrame3];
        
        NSString *ImageName=nil;
        
        if (Cradstest>i) {
            
            ImageName=@"SmallStar";
            
        } else {
            ImageName=@"SmallFadeStar";
            
        }
        
        [StarBtn setBackgroundImage:[UIImage imageNamed:ImageName] forState:UIControlStateNormal];
        
        [StarBtn setBackgroundImage:[UIImage imageNamed:ImageName] forState:UIControlStateSelected];
        
        [StarBtn setBackgroundImage:[UIImage imageNamed:ImageName] forState:UIControlStateHighlighted];
        
        [TestStartContainerView addSubview:StarBtn];
        
        PreFrame3.origin.x=PreFrame3.origin.x+PreFrame3.size.width+5;
        
        
        
    }
    
   
    
    UIView *HS3=[[UIView alloc]initWithFrame:CGRectMake(0, 34, TestRatingSubView.frame.size.width, 1)];
    [HS3 setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"line2"]]];
    [TestRatingSubView addSubview:HS3];
    
    
    // END OF TEST LABEL
    
    
    //
    
    //START OF SERVICE LABEL
    
    int CradSERVICE=4;
    UIView *ServiceRatingSubView=[[UIView alloc]initWithFrame:CGRectMake(0,TestRatingSubView.frame.size.height+TestRatingSubView.frame.origin.y, CardsScrollView.frame.size.width,35)];
    
    [ServiceRatingSubView setBackgroundColor:RGBCOLOR(255, 255, 255, 1)];
    [CardsScrollView addSubview:ServiceRatingSubView];
    
    UILabel *ServiceTitleLbl=[[UILabel alloc] initWithFrame:CGRectMake(20, 4, 50, 23)];
    [ServiceTitleLbl setText:@"Service"];
    [ServiceTitleLbl setTextColor:RGBCOLOR(100, 100, 100, 1)];
    [ServiceTitleLbl setFont:HALVELTICA_LIGHT(14)];
    [ServiceRatingSubView addSubview:ServiceTitleLbl];
    
    
    // STARS START
    UIView *ServiceStartContainerView=[[UIView alloc]initWithFrame:CGRectMake(170 ,5,103, 26)];
    
    ServiceStartContainerView.backgroundColor=[UIColor clearColor];
    
    [ServiceRatingSubView addSubview:ServiceStartContainerView];
    
    CGRect PreFrame4=CGRectMake(0, 2, 33/2, 30/2);
    
    
    
    for (int i=0; i<5; i++) {
        
        UIButton * StarBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        
        [StarBtn setFrame:PreFrame4];
        
        NSString *ImageName=nil;
        
        if (CradSERVICE>i) {
            
            ImageName=@"SmallStar";
            
        } else {
            ImageName=@"SmallFadeStar";
            
        }
        
        [StarBtn setBackgroundImage:[UIImage imageNamed:ImageName] forState:UIControlStateNormal];
        
        [StarBtn setBackgroundImage:[UIImage imageNamed:ImageName] forState:UIControlStateSelected];
        
        [StarBtn setBackgroundImage:[UIImage imageNamed:ImageName] forState:UIControlStateHighlighted];
        
        [ServiceStartContainerView addSubview:StarBtn];
        
        PreFrame4.origin.x=PreFrame4.origin.x+PreFrame4.size.width+5;
        
        
        
    }
    
    
    
    UIView *HS4=[[UIView alloc]initWithFrame:CGRectMake(0, 34, ServiceRatingSubView.frame.size.width, 1)];
    [HS4 setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"line2"]]];
    [ServiceRatingSubView addSubview:HS4];
    
    
    // END OF SERVICE LABEL

    //***
    
    
    //START OF presentation LABEL
    
    int CradPresentation=5;
    UIView *PresentationRatingSubView=[[UIView alloc]initWithFrame:CGRectMake(0,ServiceRatingSubView.frame.size.height+ServiceRatingSubView.frame.origin.y, CardsScrollView.frame.size.width,35)];
    
    [PresentationRatingSubView setBackgroundColor:RGBCOLOR(255, 255, 255, 1)];
    [CardsScrollView addSubview:PresentationRatingSubView];
    
    UILabel *PresentationTitleLbl=[[UILabel alloc] initWithFrame:CGRectMake(20, 4, 100, 23)];
    [PresentationTitleLbl setText:@"Presentation"];
    [PresentationTitleLbl setTextColor:RGBCOLOR(100, 100, 100, 1)];
    [PresentationTitleLbl setFont:HALVELTICA_LIGHT(14)];
    [PresentationRatingSubView addSubview:PresentationTitleLbl];
    
    
    // STARS START
    UIView *PresentationStartContainerView=[[UIView alloc]initWithFrame:CGRectMake(170 ,5,103, 26)];
    
    PresentationStartContainerView.backgroundColor=[UIColor clearColor];
    
    [PresentationRatingSubView addSubview:PresentationStartContainerView];
    
    CGRect PreFrame5=CGRectMake(0, 2, 33/2, 30/2);
    
    
    
    for (int i=0; i<5; i++) {
        
        UIButton * StarBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        
        [StarBtn setFrame:PreFrame5];
        
        NSString *ImageName=nil;
        
        if (CradPresentation>i) {
            
            ImageName=@"SmallStar";
            
        } else {
            ImageName=@"SmallFadeStar";
            
        }
        
        [StarBtn setBackgroundImage:[UIImage imageNamed:ImageName] forState:UIControlStateNormal];
        
        [StarBtn setBackgroundImage:[UIImage imageNamed:ImageName] forState:UIControlStateSelected];
        
        [StarBtn setBackgroundImage:[UIImage imageNamed:ImageName] forState:UIControlStateHighlighted];
        
        [PresentationStartContainerView addSubview:StarBtn];
        
        PreFrame5.origin.x=PreFrame5.origin.x+PreFrame5.size.width+5;
        
        
        
    }
    
    
    
    UIView *HS5=[[UIView alloc]initWithFrame:CGRectMake(0, 34, ServiceRatingSubView.frame.size.width, 1)];
    [HS5 setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"line2"]]];
    [PresentationRatingSubView addSubview:HS5];
    
    
    // END OF PEresentation LABEL
    

    
    //Start of atmosphere
    
    
    int CradAtmosphere=5;
    UIView *AtmosphereRatingSubView=[[UIView alloc]initWithFrame:CGRectMake(0,PresentationRatingSubView.frame.size.height+PresentationRatingSubView.frame.origin.y, CardsScrollView.frame.size.width,35)];
    
    [AtmosphereRatingSubView setBackgroundColor:RGBCOLOR(255, 255, 255, 1)];
    [CardsScrollView addSubview:AtmosphereRatingSubView];
    
    UILabel *AtmosphereTitleLbl=[[UILabel alloc] initWithFrame:CGRectMake(20, 4, 100, 23)];
    [AtmosphereTitleLbl setText:@"Atmosphere"];
    [AtmosphereTitleLbl setTextColor:RGBCOLOR(100, 100, 100, 1)];
    [AtmosphereTitleLbl setFont:HALVELTICA_LIGHT(14)];
    [AtmosphereRatingSubView addSubview:AtmosphereTitleLbl];
    
    
    // STARS START
    UIView *AtmosphereStartContainerView=[[UIView alloc]initWithFrame:CGRectMake(170 ,5,103, 26)];
    
    AtmosphereStartContainerView.backgroundColor=[UIColor clearColor];
    
    [AtmosphereRatingSubView addSubview:AtmosphereStartContainerView];
    
    CGRect PreFrame6=CGRectMake(0, 2, 33/2, 30/2);
    
    
    
    for (int i=0; i<5; i++) {
        
        UIButton * StarBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        
        [StarBtn setFrame:PreFrame6];
        
        NSString *ImageName=nil;
        
        if (CradAtmosphere>i) {
            
            ImageName=@"SmallStar";
            
        } else {
            ImageName=@"SmallFadeStar";
            
        }
        
        [StarBtn setBackgroundImage:[UIImage imageNamed:ImageName] forState:UIControlStateNormal];
        
        [StarBtn setBackgroundImage:[UIImage imageNamed:ImageName] forState:UIControlStateSelected];
        
        [StarBtn setBackgroundImage:[UIImage imageNamed:ImageName] forState:UIControlStateHighlighted];
        
        [AtmosphereStartContainerView addSubview:StarBtn];
        
        PreFrame6.origin.x=PreFrame6.origin.x+PreFrame6.size.width+5;
        
        
        
    }
    // end of atmosphere
    
    UITextView *CardTxtView=[[UITextView alloc]initWithFrame:CGRectMake(0, AtmosphereRatingSubView.frame.origin.y+AtmosphereRatingSubView.frame.size.height, CardsContainerView.frame.size.width, 124/2)];
    [CardTxtView setBackgroundColor:RGBCOLOR(239, 239, 239, 1)];
    [CardsScrollView addSubview:CardTxtView];
    [CardTxtView setText:@"This is the text here........"];
    [CardTxtView setFont:HALVELTICA_LIGHT(13)];
    [CardTxtView setTextColor:RGBCOLOR(100, 100, 100, 1)];
   
    UIView *CardTagContainerView=[[UIView alloc]initWithFrame:CGRectMake(0, CardTxtView.frame.origin.y+CardTxtView.frame.size.height, CardsScrollView.frame.size.width, 100)];
    [CardsScrollView addSubview:CardTagContainerView];
    
    
    UIImageView *SmallCardTag=[[UIImageView alloc]initWithFrame:CGRectMake(15, 7, 124/2, 50/2)];
    [SmallCardTag setImage:[UIImage imageNamed:@"SmallTag"]];
    
    
    [CardTagContainerView addSubview:SmallCardTag];
    UILabel *TLbl=[[UILabel alloc]initWithFrame:CGRectMake(2, 1, 50, 20)];
    
    [TLbl setTextColor:RGBCOLOR(100, 100, 100, 1)];
    [TLbl setText:@"#food"];
    [TLbl setFont:HALVELTICA_LIGHT(13)];
    [SmallCardTag addSubview:TLbl];
    
    UIImageView *BigCardTag=[[UIImageView alloc]initWithFrame:CGRectMake(SmallCardTag.frame.origin.x+SmallCardTag.frame.size.width+10, 7, 177/2, 50/2)];
    [BigCardTag setImage:[UIImage imageNamed:@"BigTag"]];
    
    
    [CardTagContainerView addSubview:BigCardTag];
    UILabel *TLbl1=[[UILabel alloc]initWithFrame:CGRectMake(2, 1, 90, 20)];
    [TLbl1 setTextColor:RGBCOLOR(90, 90, 90, 1)];
    [TLbl1 setText:@"#restaurant"];
    [TLbl1 setFont:HALVELTICA_LIGHT(13)];
    [BigCardTag addSubview:TLbl1];
    
    
    UIImageView *SmallCardTag1=[[UIImageView alloc]initWithFrame:CGRectMake(BigCardTag.frame.origin.x+BigCardTag.frame.size.width+10, 7, 124/2, 50/2)];
    [SmallCardTag1 setImage:[UIImage imageNamed:@"SmallTag"]];
    
    
    [CardTagContainerView addSubview:SmallCardTag1];
    UILabel *TLbl2=[[UILabel alloc]initWithFrame:CGRectMake(2, 1, 50, 20)];
    [TLbl2 setTextColor:RGBCOLOR(90, 90, 90, 1)];
    [TLbl2 setText:@"#hot"];
    [TLbl2 setFont:HALVELTICA_LIGHT(13)];
    [SmallCardTag1 addSubview:TLbl2];


    UIImageView *MidCardTag=[[UIImageView alloc]initWithFrame:CGRectMake(SmallCardTag.frame.origin.x, SmallCardTag.frame.origin.y+SmallCardTag.frame.size.height+7, 139/2, 50/2)];
    [MidCardTag setImage:[UIImage imageNamed:@"MidTag"]];
    
    
    [CardTagContainerView addSubview:MidCardTag];
    UILabel *TLbl3=[[UILabel alloc]initWithFrame:CGRectMake(2, 1, 70, 20)];
    [TLbl3 setTextColor:RGBCOLOR(90, 90, 90, 1)];
    [TLbl3 setText:@"#chicken"];
    [TLbl3 setFont:HALVELTICA_LIGHT(13)];
    [MidCardTag addSubview:TLbl3];
    
    
    UIImageView *MidCardTag1=[[UIImageView alloc]initWithFrame:CGRectMake(MidCardTag.frame.origin.x+MidCardTag.frame.size.width+10, SmallCardTag.frame.origin.y+SmallCardTag.frame.size.height+7, 139/2, 50/2)];
    [MidCardTag1 setImage:[UIImage imageNamed:@"MidTag"]];
    
    
    [CardTagContainerView addSubview:MidCardTag1];
    UILabel *TLbl4=[[UILabel alloc]initWithFrame:CGRectMake(2, 1, 70, 20)];
    [TLbl4 setTextColor:RGBCOLOR(90, 90, 90, 1)];
    [TLbl4 setText:@"#hangout"];
    [TLbl4 setFont:HALVELTICA_LIGHT(13)];
    [MidCardTag1 addSubview:TLbl4];
    
    //SATAR OF BOTTOM CARD PROFOILE
    UIView *BottomCardView=[[UIView alloc]initWithFrame:CGRectMake(SmallCardTag.frame.origin.x,CardTagContainerView.frame.origin.y+CardTagContainerView.frame.size.height, CardsScrollView.frame.size.width-30,312/2)];
    [BottomCardView setBackgroundColor:RGBCOLOR(246, 246, 246, 1)];
    [CardsScrollView addSubview:BottomCardView];
    BottomCardView.layer.cornerRadius=4.0;
    
    UIImageView *ProfilePic=[[UIImageView alloc]initWithFrame:CGRectMake(10, 7, 40, 40)];
    [ProfilePic setImage:[UIImage imageNamed:@"userimage2"]];
    ProfilePic.layer.cornerRadius=ProfilePic.frame.size.height/2;
    ProfilePic.layer.borderColor=[UIColor lightGrayColor].CGColor;
    ProfilePic.layer.borderWidth=2.0;
    [BottomCardView addSubview:ProfilePic];
    
    
    UILabel *ProfileNameLbl=[[UILabel alloc]initWithFrame:CGRectMake(ProfilePic.frame.origin.x+ProfilePic.frame.size.width+10, ProfilePic.frame.origin.y, 100, 20)];
    [ProfileNameLbl setText:@"jack jonson"];
    [ProfileNameLbl setBackgroundColor:[UIColor clearColor]];
    [ProfileNameLbl setTextColor:RGBCOLOR(70, 70, 70, 1)];
    [ProfileNameLbl setFont:HALVELTICA(13)];
    [BottomCardView addSubview:ProfileNameLbl];
    
    
    UILabel *DateLbl=[[UILabel alloc]initWithFrame:CGRectMake(ProfileNameLbl.frame.origin.x+ProfileNameLbl.frame.size.width+42, ProfileNameLbl.frame.origin.y, 60, 20)];
    [DateLbl setTextColor:RGBCOLOR(110, 110, 110, 1)];
    [DateLbl setText:@"15 dec"];
    [DateLbl setFont:HALVELTICA_LIGHT(13)];
    [BottomCardView addSubview:DateLbl];
    
    UILabel *DateLbl1=[[UILabel alloc]initWithFrame:CGRectMake(ProfileNameLbl.frame.origin.x, ProfileNameLbl.frame.size.height+ProfileNameLbl.frame.origin.y, 260, 20)];
    [DateLbl1 setTextColor:RGBCOLOR(110, 110, 110, 1)];
    [DateLbl1 setText:@"@mc_arnold | Lv.1 Foodie"];
    [DateLbl1 setFont:HALVELTICA_LIGHT(13)];
    [BottomCardView addSubview:DateLbl1];
    
    
    
    UITextView *ProfTxtView=[[UITextView alloc]initWithFrame:CGRectMake(0, DateLbl1.frame.origin.y+DateLbl1.frame.size.height, BottomCardView.frame.size.width, 124/2)];
    [ProfTxtView setBackgroundColor:[UIColor clearColor]];
    [BottomCardView addSubview:ProfTxtView];
    [ProfTxtView setText:@"Porta scelericerte fata yehebej kje \n teveb bgfdg"];
    [ProfTxtView setFont:HALVELTICA_LIGHT(13)];
    [ProfTxtView setTextColor:RGBCOLOR(100, 100, 100, 1)];
    

    
    
    UIView *Hs7=[[UIView alloc]initWithFrame:CGRectMake(0,ProfTxtView.frame.origin.y+ProfTxtView.frame.size.height+5, BottomCardView.frame.size.width, .5)];
    [Hs7 setBackgroundColor:RGBCOLOR(200, 200, 200, 1)];
    [BottomCardView addSubview:Hs7];
    
    UILabel *Lbl1=[[UILabel alloc]initWithFrame:CGRectMake(14, Hs7.frame.size.height+Hs7.frame.origin.y+1, 20, 20)];
    [Lbl1 setTextColor:RGBCOLOR(110, 110, 110, 1)];
    [Lbl1 setText:@"30"];
    [Lbl1 setBackgroundColor:[UIColor clearColor]];
    [Lbl1 setFont:HALVELTICA_LIGHT(13)];
    [BottomCardView addSubview:Lbl1];
    
    
    UIImageView *HeartPic=[[UIImageView alloc]initWithFrame:CGRectMake(Lbl1.frame.origin.x+Lbl1.frame.size.width+3, Lbl1.frame.origin.y+5, 16, 14)];
    [HeartPic setImage:[UIImage imageNamed:@"heartgray"]];
    [BottomCardView addSubview:HeartPic];
    
    
    
    UILabel *Lbl2=[[UILabel alloc]initWithFrame:CGRectMake(HeartPic.frame.origin.x+HeartPic.frame.size.width+18, Hs7.frame.size.height+Hs7.frame.origin.y+1, 20, 20)];
    [Lbl2 setTextColor:RGBCOLOR(110, 110, 110, 1)];
    [Lbl2 setText:@"30"];
    [Lbl2 setBackgroundColor:[UIColor clearColor]];
    [Lbl2 setFont:HALVELTICA_LIGHT(13)];
    [BottomCardView addSubview:Lbl2];
    
    
    UIImageView *CommentPic=[[UIImageView alloc]initWithFrame:CGRectMake(Lbl2.frame.origin.x+Lbl2.frame.size.width+3, Lbl1.frame.origin.y+5, 29/2,29/2)];
    [CommentPic setImage:[UIImage imageNamed:@"commentgrayimage"]];
    [BottomCardView addSubview:CommentPic];

    
    
    
    UIView *Vs7=[[UIView alloc]initWithFrame:CGRectMake(CommentPic.frame.origin.x+CommentPic.frame.size.width+20,Hs7.frame.origin.y+Hs7.frame.size.height, 1,25)];
    [Vs7 setBackgroundColor:RGBCOLOR(200, 200, 200, 1)];
    [BottomCardView addSubview:Vs7];
    
    
    
    UIImageView *HeartPicRed=[[UIImageView alloc]initWithFrame:CGRectMake(Vs7.frame.origin.x+Vs7.frame.size.width+20, Lbl1.frame.origin.y+5, 16, 14)];
    [HeartPicRed setImage:[UIImage imageNamed:@"popularicon"]];
    [BottomCardView addSubview:HeartPicRed];
    
    
    UIImageView *CommentDouble=[[UIImageView alloc]initWithFrame:CGRectMake(HeartPicRed.frame.origin.x+HeartPicRed.frame.size.width+20, Lbl1.frame.origin.y+5, 16, 15)];
    [CommentDouble setImage:[UIImage imageNamed:@"CommentDouble"]];
    [BottomCardView addSubview:CommentDouble];
    
    UIImageView *MorePic=[[UIImageView alloc]initWithFrame:CGRectMake(CommentDouble.frame.origin.x+CommentDouble.frame.size.width+20, Lbl1.frame.origin.y+5, 2.5, 23/2)];
    [MorePic setImage:[UIImage imageNamed:@"more"]];
    [BottomCardView addSubview:MorePic];
    
    UIView *VF=[[UIView alloc]initWithFrame:CGRectMake(0, BottomCardView.frame.size.height+BottomCardView.frame.origin.y, CardsContainerView.frame.size.width, 80)];
    [VF setBackgroundColor:[UIColor clearColor]];
    [CardsScrollView addSubview:VF];
    
    UIButton *CardSeeMoreBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [CardSeeMoreBtn setFrame:CGRectMake(25, 20, 497/2, 64/2)];
    [CardSeeMoreBtn setBackgroundImage:[UIImage imageNamed:@"see-more"] forState:UIControlStateNormal];
    [CardSeeMoreBtn setBackgroundImage:[UIImage imageNamed:@"see-more"] forState:UIControlStateSelected];
    [CardSeeMoreBtn setBackgroundImage:[UIImage imageNamed:@"see-more"] forState:UIControlStateHighlighted];
   [VF addSubview:CardSeeMoreBtn];
    
    
     //END OF BOTTOM CARD PROFOILE
    
    

    
    
    
    
    
    // END OF CARDS
    
    
    
    //start of last
    
    UIView *LastContainerView=[[UIView alloc]initWithFrame:CGRectMake(MenuTableContainerView.frame.origin.x, CardsContainerView.frame.origin.y+CardsContainerView.frame.size.height+20, MenuTableContainerView.frame.size.width, 1316/2+37)];
    //  DealsContainerView.layer.cornerRadius=6.0;
    
    NSLog(@">>>>>>>>>>>>>>--%f",LastContainerView.frame.size.width);
    
    [LastContainerView setBackgroundColor:[UIColor clearColor]];
    [MainScroll addSubview:LastContainerView];
    
    
    UIImageView *LastTopView=[[UIImageView alloc]initWithFrame:CGRectMake(0,0, LastContainerView.frame.size.width, TopViewHeight)];
    [LastTopView setImage:[UIImage imageNamed:@"TopViewBg"]];
    
    
    [LastContainerView addSubview:LastTopView];
    
    
    UIImage *LastImg=[UIImage imageNamed:@"CardImg"];
    UIImageView *LastImgView=[[UIImageView alloc] initWithFrame:CGRectMake(20, DealsTopView.frame.size.height/2-TopViewHeight/2+22, 31/2, 23/2)];
    [LastTopView addSubview:LastImgView];
    [LastImgView setImage:LastImg];
    
    
    UILabel *LastTxtLbl=[[UILabel alloc]initWithFrame:CGRectMake(40, CardImgView.frame.origin.y-2.5, 180, 18)];
    [LastTxtLbl setFont:HALVELTICA_LIGHT(15)];
    [LastTxtLbl setTextColor:RGBCOLOR(190, 8, 35, 1)];
    [LastTxtLbl setTextAlignment:NSTextAlignmentLeft];
    [LastTxtLbl setText:@"Cards"];
    [LastTopView addSubview:LastTxtLbl];
    
    
    UIButton *LastDropDownBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [LastDropDownBtn setFrame:CGRectMake(250, CardImgView.frame.origin.y-2.5, 44/2, 22)];
    [LastDropDownBtn setBackgroundImage:[UIImage imageNamed:@"up-arrow"] forState:UIControlStateNormal];
    [LastDropDownBtn setBackgroundImage:[UIImage imageNamed:@"down-arrow"] forState:UIControlStateSelected];
    [LastDropDownBtn setBackgroundImage:[UIImage imageNamed:@"down-arrow"] forState:UIControlStateHighlighted];
    [LastTopView addSubview:LastDropDownBtn];
    
    
    
    UIView *LastScrollcontainerView=[[UIView alloc]initWithFrame:CGRectMake(0, LastTopView.frame.origin.y+LastTopView.frame.size.height, LastContainerView.frame.size.width, 1316/2)];
    [LastContainerView addSubview:LastScrollcontainerView];
    [LastScrollcontainerView setBackgroundColor:[UIColor whiteColor]];
    
    UIImageView *LastScrollTop=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, LastScrollcontainerView.frame.size.width, 89/2)];
    [LastScrollTop setImage:[UIImage imageNamed:@"ShadeImg"]];
    [LastScrollcontainerView addSubview:LastScrollTop];
    
    
    UIScrollView *LastScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, LastScrollcontainerView.frame.size.width, LastScrollcontainerView.frame.size.height-100)];
    [LastScrollView setBackgroundColor:[UIColor clearColor]];
    [LastScrollcontainerView addSubview:LastScrollView];
    
    UIImageView *DolarPic=[[UIImageView alloc]initWithFrame:CGRectMake(20, 10, 16, 32/2)];
    [DolarPic setImage:[UIImage imageNamed:@"dollar"]];
    [LastScrollView addSubview:DolarPic];
    
    UILabel *CostLbl=[[UILabel alloc]initWithFrame:CGRectMake(40, DolarPic.frame.origin.y-2.5, 180, 20)];
    [CostLbl setBackgroundColor:[UIColor clearColor]];
    [CostLbl setFont:HALVELTICA_LIGHT(15)];
    [CostLbl setTextColor:RGBCOLOR(50, 50, 50, 1)];
    [CostLbl setTextAlignment:NSTextAlignmentLeft];
    [CostLbl setText:@"Cost"];
    [LastScrollView addSubview:CostLbl];
    
    UILabel *DolarPerson=[[UILabel alloc]initWithFrame:CGRectMake(200,CostLbl.frame.origin.y-2.5, 280,18)];
    [DolarPerson setFont:HALVELTICA_LIGHT(13)];
    [DolarPerson setTextColor:RGBCOLOR(50, 50, 50, 1)];
    [DolarPerson setTextAlignment:NSTextAlignmentLeft];
    [DolarPerson setText:@"$10/person"];
    [LastScrollView addSubview:DolarPerson];
    
    
    UIView *Hs11=[[UIView alloc]initWithFrame:CGRectMake(0, 46, CardsScrollView.frame.size.width, .5)];
    [Hs11 setBackgroundColor:RGBCOLOR(230, 230, 230, 1)];
    [LastScrollView addSubview:Hs11];
    
    
    
    UILabel *HurLbl=[[UILabel alloc]initWithFrame:CGRectMake(10, Hs11.frame.origin.y+2, 180, 20)];
    [HurLbl setBackgroundColor:[UIColor clearColor]];
    [HurLbl setFont:HALVELTICA(14)];
    [HurLbl setTextColor:RGBCOLOR(50, 50, 50, 1)];
    [HurLbl setTextAlignment:NSTextAlignmentLeft];
    [HurLbl setText:@"Hours"];
    [LastScrollView addSubview:HurLbl];
    
    UIView *Hs12=[[UIView alloc]initWithFrame:CGRectMake(0, HurLbl.frame.size.height+HurLbl.frame.origin.y+9, CardsScrollView.frame.size.width, .5)];
    [Hs12 setBackgroundColor:RGBCOLOR(230, 230, 230, 1)];
    [LastScrollView addSubview:Hs12];
    
    NSArray *DayArray=[[NSArray alloc]initWithObjects:@"Mon",@"Tue",@"Wed",@"Thurs",@"Fri",@"Sat",@"Sun", nil];
    
    CGRect DayPreFrame=CGRectMake(0, Hs11.frame.origin.y+32, LastScrollView.frame.size.width, 36);
    for (int i=0; i<7; i++) {
        UIView *DaySubview=[[UIView alloc]initWithFrame:DayPreFrame];
        [DaySubview setBackgroundColor:[UIColor clearColor]];
        [LastScrollView addSubview:DaySubview];
        
        UIImageView *ClockImgView=[[UIImageView alloc]initWithFrame:CGRectMake(8, 10, 17/2+2, 19/2+2)];
        [ClockImgView setImage:[UIImage imageNamed:@"Clock"]];
        [DaySubview addSubview:ClockImgView];
        
        
        
        UILabel *DayLbl=[[UILabel alloc]initWithFrame:CGRectMake(ClockImgView.frame.origin.x+ClockImgView.frame.size.width+9, 6, 80, 20)];
        [DayLbl setBackgroundColor:[UIColor clearColor]];
        [DayLbl setFont:HALVELTICA_LIGHT(13)];
        [DayLbl setTextColor:RGBCOLOR(50, 50, 50, 1)];
        [DayLbl setTextAlignment:NSTextAlignmentLeft];
        [DayLbl setText:[DayArray objectAtIndex:i]];
        [DaySubview addSubview:DayLbl];
        
        UILabel *DayLbl2=[[UILabel alloc]initWithFrame:CGRectMake(DayLbl.frame.origin.x+DayLbl.frame.size.width+59, 6, 100, 20)];
        [DayLbl2 setBackgroundColor:[UIColor clearColor]];
        [DayLbl2 setFont:HALVELTICA_LIGHT(13)];
        [DayLbl2 setTextColor:RGBCOLOR(50, 50, 50, 1)];
        [DayLbl2 setTextAlignment:NSTextAlignmentRight];
        [DayLbl2 setText:@"10am-10pm"];
        [DaySubview addSubview:DayLbl2];
        
        if (i!=6) {
            UIView *HSeperetor=[[UIView alloc]initWithFrame:CGRectMake(0,35, MoreTableView.frame.size.width, .5)];
            [HSeperetor setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"line2"]]];
            [DaySubview addSubview:HSeperetor];
        }
       
        
        
        DayPreFrame=DaySubview.frame;
        DayPreFrame.origin.y+=DayPreFrame.size.height;
    }

    
    UIView *Hs13=[[UIView alloc]initWithFrame:CGRectMake(0, DayPreFrame.origin.y, CardsScrollView.frame.size.width, 1)];
    [Hs13 setBackgroundColor:RGBCOLOR(230, 230, 230, 1)];
    [LastScrollView addSubview:Hs13];
    
    
    
    
    
    
    
    
    
    UILabel *FacilitiesLbl=[[UILabel alloc]initWithFrame:CGRectMake(10, Hs13.frame.origin.y+5, 180, 20)];
    [HurLbl setBackgroundColor:[UIColor clearColor]];
    [HurLbl setFont:HALVELTICA(14)];
    [HurLbl setTextColor:RGBCOLOR(50, 50, 50, 1)];
    [HurLbl setTextAlignment:NSTextAlignmentLeft];
    [FacilitiesLbl setText:@"Facilities"];
    [LastScrollView addSubview:FacilitiesLbl];
    
    NSArray *ImgLeft=[[NSArray alloc]initWithObjects:@"L1",@"L2",@"L3",@"L4",@"L5", nil];
    NSArray *TitleLeft=[[NSArray alloc]initWithObjects:@"Smoking",@"Wifi",@"Debit",@"Credit",@"Halal", nil];
    
    NSArray *ImgRight=[[NSArray alloc]initWithObjects:@"R1",@"R2",@"R3",@"R4", nil];
    NSArray *TitleRight=[[NSArray alloc]initWithObjects:@"Delivary",@"Alcohol",@"Outdoor",@"Tv", nil];
    
    
    
    UIView *Hs14=[[UIView alloc]initWithFrame:CGRectMake(0,FacilitiesLbl.frame.origin.y+FacilitiesLbl.frame.size.height+6, CardsScrollView.frame.size.width, 1)];
    [Hs14 setBackgroundColor:RGBCOLOR(230, 230, 230, 1)];
    [LastScrollView addSubview:Hs14];
    
     CGRect DayPreFrame1=CGRectMake(0, Hs14.frame.origin.y, LastScrollView.frame.size.width, 36);
    for (int i=0; i<5; i++) {
        UIView *DaySubview=[[UIView alloc]initWithFrame:DayPreFrame1];
        [DaySubview setBackgroundColor:[UIColor clearColor]];
        [LastScrollView addSubview:DaySubview];
        
        UIView *SubView1=[[UIView alloc]initWithFrame:CGRectMake(0, 0, DaySubview.frame.size.width/2, DaySubview.frame.size.height)];
        [DaySubview addSubview:SubView1];
        [SubView1 setBackgroundColor:[UIColor clearColor]];
        CGRect RRR=CGRectMake(0, 0, 0, 0);
        switch (i) {
            case 0:
                 RRR=CGRectMake(4, SubView1.frame.size.height/2-39/4, 18, 39/2);
                break;
                
            case 1:
                RRR=CGRectMake(4, SubView1.frame.size.height/2-24/4, 31/2, 24/2);
                break;
            case 2:
                RRR=CGRectMake(4, SubView1.frame.size.height/2-26/4, 18, 26/2);
                break;
            case 3:
                RRR=CGRectMake(4, SubView1.frame.size.height/2-26/4, 17, 26/2);
                break;
            case 4:
                RRR=CGRectMake(4, SubView1.frame.size.height/2-32/4, 16, 16);
                break;
        }
        
        
        UIImageView *ImgL=[[UIImageView alloc]initWithFrame:RRR];
        [ImgL setImage:[UIImage imageNamed:[ImgLeft objectAtIndex:i]]];
         [SubView1 addSubview:ImgL];
        
        UILabel *LblL=[[UILabel alloc]initWithFrame:CGRectMake(34,11, 280,18)];
        [LblL setFont:HALVELTICA_LIGHT(13)];
        [LblL setTextColor:RGBCOLOR(50, 50, 50, 1)];
        [LblL setTextAlignment:NSTextAlignmentLeft];
        [LblL setText:[TitleLeft objectAtIndex:i]];
        [SubView1 addSubview:LblL];
        
        
        if (i!=4) {
            UIView *SubView2=[[UIView alloc]initWithFrame:CGRectMake(SubView1.frame.size.width, 0, DaySubview.frame.size.width/2, DaySubview.frame.size.height)];
            [DaySubview addSubview:SubView2];
            [SubView2 setBackgroundColor:[UIColor clearColor]];
            
            CGRect LLL=CGRectMake(0, 0, 0, 0);
            switch (i) {
                case 0:
                    LLL=CGRectMake(4, SubView2.frame.size.height/2-39/4, 33/2, 33/2);
                    break;
                    
                case 1:
                    LLL=CGRectMake(4, SubView2.frame.size.height/2-24/4, 32/2, 35/2);
                    break;
                case 2:
                    LLL=CGRectMake(4, SubView2.frame.size.height/2-26/4, 30/2, 32/2);
                    break;
                case 3:
                    LLL=CGRectMake(4, SubView2.frame.size.height/2-26/4, 32/2, 32/2);
                    break;
                
            }
            

            
            UIImageView *ImgR=[[UIImageView alloc]initWithFrame:LLL];
            [ImgR setImage:[UIImage imageNamed:[ImgRight objectAtIndex:i]]];
            [SubView2 addSubview:ImgR];
            
            UILabel *LblR=[[UILabel alloc]initWithFrame:CGRectMake(34,11, 280,18)];
            [LblR setFont:HALVELTICA_LIGHT(13)];
            [LblR setTextColor:RGBCOLOR(50, 50, 50, 1)];
            [LblR setTextAlignment:NSTextAlignmentLeft];
            [LblR setText:[TitleRight objectAtIndex:i]];
            [SubView2 addSubview:LblR];
        }
        
        
        UIView *Hhh=[[UIView alloc]initWithFrame:CGRectMake(0,35, MoreTableView.frame.size.width, 1)];
        [Hhh setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"line2"]]];
        [DaySubview addSubview:Hhh];
        
        
        DayPreFrame1=DaySubview.frame;
        DayPreFrame1.origin.y+=DayPreFrame1.size.height;
    }
    
    
    /////////
    
    
    
    UIView *FF=[[UIView alloc]initWithFrame:CGRectMake(0, LastScrollView.frame.size.height+LastScrollView.frame.origin.y, LastScrollView.frame.size.width, 100)];
    [FF setBackgroundColor:[UIColor clearColor]];
    [LastScrollcontainerView addSubview:FF];
    
    
    UIButton *SeeMoreBtn1=[UIButton buttonWithType:UIButtonTypeCustom];
    [SeeMoreBtn1 setFrame:CGRectMake(25, 20, 497/2, 64/2)];
    [SeeMoreBtn1 setBackgroundImage:[UIImage imageNamed:@"EditThisBusiness"] forState:UIControlStateNormal];
    [SeeMoreBtn1 setBackgroundImage:[UIImage imageNamed:@"EditThisBusiness"] forState:UIControlStateSelected];
    [SeeMoreBtn1 setBackgroundImage:[UIImage imageNamed:@"EditThisBusiness"] forState:UIControlStateHighlighted];
    [FF addSubview:SeeMoreBtn1];

    
    UIButton *SeeMoreBtn2=[UIButton buttonWithType:UIButtonTypeCustom];
    [SeeMoreBtn2 setFrame:CGRectMake(25, SeeMoreBtn1.frame.size.height+SeeMoreBtn1.frame.origin.y+10, 497/2, 64/2)];
    [SeeMoreBtn2 setBackgroundImage:[UIImage imageNamed:@"Report"] forState:UIControlStateNormal];
    [SeeMoreBtn2 setBackgroundImage:[UIImage imageNamed:@"Report"] forState:UIControlStateSelected];
    [SeeMoreBtn2 setBackgroundImage:[UIImage imageNamed:@"Report"] forState:UIControlStateHighlighted];
    [FF addSubview:SeeMoreBtn2];
    
    UIImageView *BottomDealsCurve22=[[UIImageView alloc]initWithFrame:CGRectMake(DealsScrollView.frame.origin.x-5, LastScrollcontainerView.frame.origin.y+LastScrollcontainerView.frame.size.height, DealsContainerView.frame.size.width+10, 27/2)];
    [BottomDealsCurve22 setImage:[UIImage imageNamed:@"BottomCurve"]];
    [LastContainerView addSubview:BottomDealsCurve22];
    
    
    // end of last
    
    
    // Do any additional setup after loading the view.
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *Mycell;
    
    static NSString *CellIdentifier = @"Cell1";
    
    Mycell = nil;
    if (Mycell == nil) {
        Mycell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
    }
    
    
    UILabel *FoodTxtLbl=[[UILabel alloc]initWithFrame:CGRectMake(25, 11, 180, 18)];
    [FoodTxtLbl setFont:HALVELTICA_LIGHT(15)];
    [FoodTxtLbl setTextColor:RGBCOLOR(70, 70, 70, 1)];
    [FoodTxtLbl setTextAlignment:NSTextAlignmentLeft];
    [FoodTxtLbl setText:[FoodArray objectAtIndex:indexPath.row]];
    [Mycell addSubview:FoodTxtLbl];
    
    
    
    UIImageView *HeartImgView=[[UIImageView alloc]initWithFrame:CGRectMake(245, FoodTxtLbl.frame.origin.y+2, 32/2, 28/2)];
    [HeartImgView setImage:[UIImage imageNamed:@"heart"]];
    [Mycell addSubview:HeartImgView];
    
    
    UILabel *DolarLbl=[[UILabel alloc]initWithFrame:CGRectMake(25,FoodTxtLbl.frame.origin.y+FoodTxtLbl.frame.size.height+9, 180, 18)];
    [DolarLbl setFont:HALVELTICA(20)];
    [DolarLbl setTextColor:RGBCOLOR(110, 110, 110, 1)];
    [DolarLbl setTextAlignment:NSTextAlignmentLeft];
    [DolarLbl setText:@"$ 50"];
    [Mycell addSubview:DolarLbl];
    
    
    UIImageView *LikeImgView=[[UIImageView alloc]initWithFrame:CGRectMake(DolarLbl.frame.origin.x, DolarLbl.frame.origin.y+DolarLbl.frame.size.height+6, 165/2, 50/2)];
    [LikeImgView setImage:[UIImage imageNamed:@"HeartBtnImage"]];
    [Mycell addSubview:LikeImgView];
  
    
    UILabel *LikeLbl=[[UILabel alloc]initWithFrame:CGRectMake(25,3,55, 18)];
    [LikeLbl setFont:HALVELTICA_LIGHT(12)];
    [LikeLbl setBackgroundColor:[UIColor clearColor]];
    [LikeLbl setTextColor:RGBCOLOR(110, 110, 110, 1)];
    [LikeLbl setTextAlignment:NSTextAlignmentLeft];
    [LikeLbl setText:@"100 likes"];
    [LikeImgView addSubview:LikeLbl];
    
    UIImageView *PhotoImgView=[[UIImageView alloc]initWithFrame:CGRectMake(LikeImgView.frame.origin.x+LikeImgView.frame.size.width+4, DolarLbl.frame.origin.y+DolarLbl.frame.size.height+6, 165/2, 50/2)];
    [PhotoImgView setImage:[UIImage imageNamed:@"EmptyBorder"]];
    [Mycell addSubview:PhotoImgView];
    
    
    UIImageView *Photo=[[UIImageView alloc]initWithFrame:CGRectMake(5, 4.5, 32/2, 32/2)];
    [Photo setImage:[UIImage imageNamed:@"PhotoImage"]];
    [PhotoImgView addSubview:Photo];
    
    
    UILabel *PhotoLbl=[[UILabel alloc]initWithFrame:CGRectMake(25,3,55, 18)];
    [PhotoLbl setFont:HALVELTICA_LIGHT(12)];
    [PhotoLbl setBackgroundColor:[UIColor clearColor]];
    [PhotoLbl setTextColor:RGBCOLOR(110, 110, 110, 1)];
    [PhotoLbl setTextAlignment:NSTextAlignmentLeft];
    [PhotoLbl setText:@"5 photo"];
    [PhotoImgView addSubview:PhotoLbl];
    
    
    
    UIView *HSeperetor=[[UIView alloc]initWithFrame:CGRectMake(0,119, MoreTableView.frame.size.width, 1)];
    [HSeperetor setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"line2"]]];
    [Mycell addSubview:HSeperetor];
    
    return Mycell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120.0f;
}

-(void)DropRatingsView
{
    [UIView animateWithDuration:0.4 animations:^{
        [RatingDropDownView setFrame:CGRectMake(RatingDropDownView.frame.origin.x, RatingDropDownView.frame.origin.y, RatingDropDownView.frame.size.width, 210)];
        
    }];
}
-(void)viewDidAppear:(BOOL)animated
{
    [self PlacingRatingSection];
    
    [self PlacingMenusView];
}

-(void)PlacingMenusView
{
    
}
-(void)PlacingRatingSection
{
    int topRate=4;
    int test=4;
    int service =3;
    int presentation=5;
    int atmosphere=4;
    
    
    RatingDropDownView=[[UIView alloc]initWithFrame:CGRectMake(RatingTopViewView.frame.origin.x, RatingTopViewView.frame.origin.y+RatingTopViewView.frame.size.height, RatingTopViewView.frame.size.width, 210)];
    [RatingDropDownView setBackgroundColor:RGBCOLOR(244, 244, 244, 1)];
    [MainScroll addSubview:RatingDropDownView];
    
    
    UIView *TopRatingSubView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, RatingTopViewView.frame.size.width,42)];
    [RatingDropDownView addSubview:TopRatingSubView];
    
    // STARS START
  UIView *  TopStartContainerView=[[UIView alloc]initWithFrame:CGRectMake(50 ,5, 200, 35)];
    
    TopStartContainerView.backgroundColor=[UIColor clearColor];
    
    [TopRatingSubView addSubview:TopStartContainerView];
    
    CGRect PreFrame2=CGRectMake(0, 5, 49/2, 44/2);
    
  
    
    for (int i=0; i<5; i++) {
        
        UIButton * StarBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        
        [StarBtn setFrame:PreFrame2];
        
        NSString *ImageName=nil;
        
        if (topRate>i) {
            
            ImageName=@"BigStar";
            
        } else {
            ImageName=@"SmallFadeStar";
            
        }
        
        [StarBtn setBackgroundImage:[UIImage imageNamed:ImageName] forState:UIControlStateNormal];
        
        [StarBtn setBackgroundImage:[UIImage imageNamed:ImageName] forState:UIControlStateSelected];
        
        [StarBtn setBackgroundImage:[UIImage imageNamed:ImageName] forState:UIControlStateHighlighted];
        
        [TopStartContainerView addSubview:StarBtn];
        
        PreFrame2.origin.x=PreFrame2.origin.x+PreFrame2.size.width+18;
        
        
        
    }
    
    UIImageView *CalManImgView=[[UIImageView alloc]initWithFrame:CGRectMake(TopStartContainerView.frame.origin.x+TopStartContainerView.frame.size.width+8, TopStartContainerView.frame.origin.y+5, 39/2+4, 42/2+4)];
    [CalManImgView setImage:[UIImage imageNamed:@"CalMan"]];
    [TopRatingSubView addSubview:CalManImgView];
   
    UIView *HSeperetorView=[[UIView alloc]initWithFrame:CGRectMake(0, 41, TopRatingSubView.frame.size.width, 1)];
    [HSeperetorView setBackgroundColor:RGBCOLOR(110, 110, 110, 1)];
    [TopRatingSubView addSubview:HSeperetorView];
    
    //START OF TEST LABEL
    
    
    UIView *TestRatingSubView=[[UIView alloc]initWithFrame:CGRectMake(0,TopRatingSubView.frame.size.height, RatingTopViewView.frame.size.width,42)];
    
    [TestRatingSubView setBackgroundColor:RGBCOLOR(255, 255, 255, 1)];
    [RatingDropDownView addSubview:TestRatingSubView];
    
    UILabel *TitleLbl=[[UILabel alloc] initWithFrame:CGRectMake(10, 4, 50, 40)];
    [TitleLbl setText:@"Test"];
    [TitleLbl setTextColor:RGBCOLOR(200, 200, 200, 1)];
    [TestRatingSubView addSubview:TitleLbl];

    
    // STARS START
    UIView * TestStartContainerView=[[UIView alloc]initWithFrame:CGRectMake(140 ,5,103, 35)];
    
    TestStartContainerView.backgroundColor=[UIColor clearColor];
    
    [TestRatingSubView addSubview:TestStartContainerView];
    
    CGRect PreFrame3=CGRectMake(0, 9, 33/2, 30/2);
    
    
    
    for (int i=0; i<5; i++) {
        
        UIButton * StarBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        
        [StarBtn setFrame:PreFrame3];
        
        NSString *ImageName=nil;
        
        if (test>i) {
            
            ImageName=@"SmallStar";
            
        } else {
            ImageName=@"SmallFadeStar";
            
        }
        
        [StarBtn setBackgroundImage:[UIImage imageNamed:ImageName] forState:UIControlStateNormal];
        
        [StarBtn setBackgroundImage:[UIImage imageNamed:ImageName] forState:UIControlStateSelected];
        
        [StarBtn setBackgroundImage:[UIImage imageNamed:ImageName] forState:UIControlStateHighlighted];
        
        [TestStartContainerView addSubview:StarBtn];
        
        PreFrame3.origin.x=PreFrame3.origin.x+PreFrame3.size.width+5;
        
        
        
    }
    
    UIImageView *CalManImgView2=[[UIImageView alloc]initWithFrame:CGRectMake(TestStartContainerView.frame.origin.x+TestStartContainerView.frame.size.width+14, TestStartContainerView.frame.origin.y+5, 39/2+4, 42/2+4)];
    [CalManImgView2 setImage:[UIImage imageNamed:@"CalMan"]];
    [TestRatingSubView addSubview:CalManImgView2];
    
    UIView *HSeperetorView1=[[UIView alloc]initWithFrame:CGRectMake(0, 41, TestRatingSubView.frame.size.width, 1)];
    [HSeperetorView1 setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"line2"]]];
    [TestRatingSubView addSubview:HSeperetorView1];

    
    // END OF TEST LABEL
    
    
    
    //START OF SERVICE
    
    
    
    UIView *ServiceRatingSubView=[[UIView alloc]initWithFrame:CGRectMake(0,TestRatingSubView.frame.size.height+TestRatingSubView.frame.origin.y, RatingTopViewView.frame.size.width,42)];
    
    [ServiceRatingSubView setBackgroundColor:RGBCOLOR(255, 255, 255, 1)];
    [RatingDropDownView addSubview:ServiceRatingSubView];
    
    UILabel *TitleLbl1=[[UILabel alloc] initWithFrame:CGRectMake(10, 4, 70, 40)];
    [TitleLbl1 setText:@"Service"];
    [TitleLbl1 setTextColor:RGBCOLOR(200, 200, 200, 1)];
    [ServiceRatingSubView addSubview:TitleLbl1];
    
    
    // STARS START
    UIView * ServiceStartContainerView=[[UIView alloc]initWithFrame:CGRectMake(140 ,5,103, 35)];
    
    ServiceStartContainerView.backgroundColor=[UIColor clearColor];
    
    [ServiceRatingSubView addSubview:ServiceStartContainerView];
    
    CGRect PreFrame4=CGRectMake(0, 9, 33/2, 30/2);
    
    
    
    for (int i=0; i<5; i++) {
        
        UIButton * StarBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        
        [StarBtn setFrame:PreFrame4];
        
        NSString *ImageName=nil;
        
        if (service>i) {
            
            ImageName=@"SmallStar";
            
        } else {
            ImageName=@"SmallFadeStar";
            
        }
        
        [StarBtn setBackgroundImage:[UIImage imageNamed:ImageName] forState:UIControlStateNormal];
        
        [StarBtn setBackgroundImage:[UIImage imageNamed:ImageName] forState:UIControlStateSelected];
        
        [StarBtn setBackgroundImage:[UIImage imageNamed:ImageName] forState:UIControlStateHighlighted];
        
        [ServiceStartContainerView addSubview:StarBtn];
        
        PreFrame4.origin.x=PreFrame4.origin.x+PreFrame4.size.width+5;
        
        
        
    }
    
    UIImageView *CalManImgView3=[[UIImageView alloc]initWithFrame:CGRectMake(ServiceStartContainerView.frame.origin.x+ServiceStartContainerView.frame.size.width+14, ServiceStartContainerView.frame.origin.y+5, 39/2+4, 42/2+4)];
    [CalManImgView3 setImage:[UIImage imageNamed:@"CalMan"]];
    [ServiceRatingSubView addSubview:CalManImgView3];
    
    UIView *HSeperetorView2=[[UIView alloc]initWithFrame:CGRectMake(0, 41, TestRatingSubView.frame.size.width, 1)];
    [HSeperetorView2 setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"line2"]]];
    [ServiceRatingSubView addSubview:HSeperetorView2];
    
    
   
    
    //END OF SERVICE
    
    
    
    //START OF PRESENTATION
    
    
    
    UIView *PresentationRatingSubView=[[UIView alloc]initWithFrame:CGRectMake(0,ServiceRatingSubView.frame.size.height+ServiceRatingSubView.frame.origin.y, RatingTopViewView.frame.size.width,42)];
    
    [PresentationRatingSubView setBackgroundColor:RGBCOLOR(255, 255, 255, 1)];
    [RatingDropDownView addSubview:PresentationRatingSubView];
    
    UILabel *TitleLbl2=[[UILabel alloc] initWithFrame:CGRectMake(10, 4, 100, 40)];
    [TitleLbl2 setText:@"Presentation"];
    [TitleLbl2 setTextColor:RGBCOLOR(200, 200, 200, 1)];
    [PresentationRatingSubView addSubview:TitleLbl2];
    
    
    // STARS START
    UIView * PresentationStartContainerView=[[UIView alloc]initWithFrame:CGRectMake(140 ,5,103, 35)];
    
    PresentationStartContainerView.backgroundColor=[UIColor clearColor];
    
    [PresentationRatingSubView addSubview:PresentationStartContainerView];
    
    CGRect PreFrame5=CGRectMake(0, 9, 33/2, 30/2);
    
    
    
    for (int i=0; i<5; i++) {
        
        UIButton * StarBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        
        [StarBtn setFrame:PreFrame5];
        
        NSString *ImageName=nil;
        
        if (presentation>i) {
            
            ImageName=@"SmallStar";
            
        } else {
            ImageName=@"SmallFadeStar";
            
        }
        
        [StarBtn setBackgroundImage:[UIImage imageNamed:ImageName] forState:UIControlStateNormal];
        
        [StarBtn setBackgroundImage:[UIImage imageNamed:ImageName] forState:UIControlStateSelected];
        
        [StarBtn setBackgroundImage:[UIImage imageNamed:ImageName] forState:UIControlStateHighlighted];
        
        [PresentationStartContainerView addSubview:StarBtn];
        
        PreFrame5.origin.x=PreFrame5.origin.x+PreFrame5.size.width+5;
        
        
        
    }
    
    UIImageView *CalManImgView4=[[UIImageView alloc]initWithFrame:CGRectMake(ServiceStartContainerView.frame.origin.x+ServiceStartContainerView.frame.size.width+14, ServiceStartContainerView.frame.origin.y+5, 39/2+4, 42/2+4)];
    [CalManImgView4 setImage:[UIImage imageNamed:@"CalMan"]];
    [PresentationRatingSubView addSubview:CalManImgView4];
    
    UIView *HSeperetorView3=[[UIView alloc]initWithFrame:CGRectMake(0, 41, TestRatingSubView.frame.size.width, 1)];
    [HSeperetorView3 setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"line2"]]];
    [PresentationRatingSubView addSubview:HSeperetorView3];
    
    
    
    
    //END OF PRESENTATION
    
    
    
    
    //START OF atmosphere
    
    
    
    UIView *AtmosphereRatingSubView=[[UIView alloc]initWithFrame:CGRectMake(0,PresentationRatingSubView.frame.size.height+PresentationRatingSubView.frame.origin.y, RatingTopViewView.frame.size.width,42)];
    
    [AtmosphereRatingSubView setBackgroundColor:RGBCOLOR(255, 255, 255, 1)];
    [RatingDropDownView addSubview:AtmosphereRatingSubView];
    
    UILabel *TitleLbl3=[[UILabel alloc] initWithFrame:CGRectMake(10, 4, 100, 40)];
    [TitleLbl3 setText:@"Atmosphere"];
    [TitleLbl3 setTextColor:RGBCOLOR(200, 200, 200, 1)];
    [AtmosphereRatingSubView addSubview:TitleLbl3];
    
    
    // STARS START
    UIView *AtmosphereStartContainerView=[[UIView alloc]initWithFrame:CGRectMake(140 ,5,103, 35)];
    
    AtmosphereStartContainerView.backgroundColor=[UIColor clearColor];
    
    [AtmosphereRatingSubView addSubview:AtmosphereStartContainerView];
    
    CGRect PreFrame6=CGRectMake(0, 9, 33/2, 30/2);
    
    
    
    for (int i=0; i<5; i++) {
        
        UIButton * StarBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        
        [StarBtn setFrame:PreFrame6];
        
        NSString *ImageName=nil;
        
        if (atmosphere>i) {
            
            ImageName=@"SmallStar";
            
        } else {
            ImageName=@"SmallFadeStar";
            
        }
        
        [StarBtn setBackgroundImage:[UIImage imageNamed:ImageName] forState:UIControlStateNormal];
        
        [StarBtn setBackgroundImage:[UIImage imageNamed:ImageName] forState:UIControlStateSelected];
        
        [StarBtn setBackgroundImage:[UIImage imageNamed:ImageName] forState:UIControlStateHighlighted];
        
        [AtmosphereStartContainerView addSubview:StarBtn];
        
        PreFrame6.origin.x=PreFrame6.origin.x+PreFrame6.size.width+5;
        
        
        
    }
    
    UIImageView *CalManImgView5=[[UIImageView alloc]initWithFrame:CGRectMake(ServiceStartContainerView.frame.origin.x+ServiceStartContainerView.frame.size.width+14, ServiceStartContainerView.frame.origin.y+5, 39/2+4, 42/2+4)];
    [CalManImgView5 setImage:[UIImage imageNamed:@"CalMan"]];
    [AtmosphereRatingSubView addSubview:CalManImgView5];
  
    
    
    
    
    //END OF atmosphere
    
    
}
-(void)Backbutton:(UIButton *)Sender
{
    NSLog(@"here ythe  back");
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
