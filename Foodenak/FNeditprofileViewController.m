//
//  FNeditprofileViewController.m
//  Foodenak
//
//  Created by Soumarsi Kundu on 19/01/15.
//  Copyright (c) 2015 Esolz Tech. All rights reserved.
//

#import "FNeditprofileViewController.h"
#import "ViewController.h"

@interface FNeditprofileViewController ()<UIScrollViewDelegate,UITextFieldDelegate>{
    
    UIView *MainView,*LineView;
    UIImageView *TopView,*BackGroundScroll,*UserProfileimage,*SubBackgroundimg,*usernamefieldbackview,*namefieldbackview,*genderbackimage,*gradientview;
    UIButton *BackButton,*DoneButton,*ChangePictureButton;
    UILabel *EditProfileLbl,*UserFullname,*UserName,*Usernamelbl,*Namelbl,*GenderLbl,*Changepasswordlbl,*passwordlbl,*newpasswordlbl,*confirmpasswordlbl;
    UIScrollView *MainScroll;
    UITextField *UsernameField,*Nametextfield,*passwordtextfield,*newwpasswordtextfield,*confirmtextfield;
    UIButton *Malebutton,*Femalenutton,*Uparrawbutton,*preferencedownarrowbutton,*notificationdownarrowbutton;
}

@end

@implementation FNeditprofileViewController

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
    [EditProfileLbl setText:@"Edit Profile"];
    [EditProfileLbl setTextAlignment:NSTextAlignmentLeft];
    [EditProfileLbl setTextColor:[UIColor whiteColor]];
    [EditProfileLbl setFont:[UIFont fontWithName:@"Helvetica Bold" size:20]];
    [TopView addSubview:EditProfileLbl];
    
    //Done button allocation.....
    
    if (self.view.frame.size.width == 320) {
        
        DoneButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [DoneButton setFrame:CGRectMake(275, 36, 30, 30)];
        [DoneButton setBackgroundImage:[UIImage imageNamed:@"DoneTick"] forState:UIControlStateNormal];
        [DoneButton addTarget:self action:@selector(Donetick:) forControlEvents:UIControlEventTouchUpInside];
        [TopView addSubview:DoneButton];
    }
    else
    {
        DoneButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [DoneButton setFrame:CGRectMake(320, 35, 30, 30)];
        [DoneButton setBackgroundImage:[UIImage imageNamed:@"DoneTick"] forState:UIControlStateNormal];
        [DoneButton addTarget:self action:@selector(Donetick:) forControlEvents:UIControlEventTouchUpInside];
        [TopView addSubview:DoneButton];
    }
    
    
    //scrollview declare...
    
    MainScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0.0f, 80.0f, self.view.frame.size.width, self.view.frame.size.height-80)];
    MainScroll.userInteractionEnabled=YES;
    MainScroll.scrollEnabled=YES;
    MainScroll.delegate=self;
    MainScroll.bounces=YES;
    MainScroll.showsHorizontalScrollIndicator=NO;
    [MainView addSubview:MainScroll];
    
    MainScroll.contentSize = CGSizeMake(0, 1000);
    
    
    //gradientview.........
    
    gradientview = [[UIImageView alloc]init];
    [gradientview setImage:[UIImage imageNamed:@"gradientview"]];
    [MainScroll addSubview:gradientview];
    
    [gradientview setFrame:CGRectMake(25, 23, self.view.frame.size.width-50, 30)];
    
    //background scrollview
    
    BackGroundScroll = [[UIImageView alloc]initWithFrame:CGRectMake(20, 20, self.view.frame.size.width-40, 900)];
    [BackGroundScroll setImage:[UIImage imageNamed:@"popularbg"]];
    [MainScroll addSubview:BackGroundScroll];
    

    //user profile image.....
    
    UserProfileimage = [[UIImageView alloc]init];
    [UserProfileimage setImage:[UIImage imageNamed:@"userprofileimg"]];
    [BackGroundScroll addSubview:UserProfileimage];
    
    //user full name.....
    
    UserFullname = [[UILabel alloc]init];
    [UserFullname setText:@"Paul M"];
    [UserFullname setTextAlignment:NSTextAlignmentCenter];
    [UserFullname setBackgroundColor:[UIColor clearColor]];
    [UserFullname setTextColor:[UIColor blackColor]];
    [UserFullname setFont:[UIFont fontWithName:@"Helvetica" size:20]];
    [BackGroundScroll addSubview:UserFullname];
    
    
    //user name......
    
    UserName = [[UILabel alloc]init];
    [UserName setText:@"@paulm"];
    [UserName setTextAlignment:NSTextAlignmentCenter];
    [UserName setBackgroundColor:[UIColor clearColor]];
    [UserName setTextColor:[UIColor lightGrayColor]];
    [UserName setFont:[UIFont fontWithName:@"Helvetica" size:17]];
    [BackGroundScroll addSubview:UserName];
    
    //change picture button....
    
    ChangePictureButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [ChangePictureButton setBackgroundImage:[UIImage imageNamed:@"changepicturebtn"] forState:UIControlStateNormal];
//    [ChangePictureButton addTarget:self action:@selector(changepicture:) forControlEvents:UIControlEventTouchUpInside];
    [BackGroundScroll addSubview:ChangePictureButton];
    
    

    
    //sub background image...
    
    SubBackgroundimg = [[UIImageView alloc]initWithFrame:CGRectMake(BackGroundScroll.frame.origin.x, 230, BackGroundScroll.frame.size.width-40, 650)];
    [SubBackgroundimg setImage:[UIImage imageNamed:@"popularbg"]];
    [BackGroundScroll addSubview:SubBackgroundimg];
    
    
    
    //////////////==================///////////////////==========================
    
    //user name sub label.....
    
    Usernamelbl = [[UILabel alloc]initWithFrame:CGRectMake(20, 10, 130, 30)];
    [Usernamelbl setText:@"Username"];
    [Usernamelbl setTextAlignment:NSTextAlignmentLeft];
    [Usernamelbl setBackgroundColor:[UIColor clearColor]];
    [Usernamelbl setTextColor:[UIColor blackColor]];
    [Usernamelbl setFont:[UIFont fontWithName:@"Helvetica" size:17]];
    [SubBackgroundimg addSubview:Usernamelbl];
    
    
    usernamefieldbackview = [[UIImageView alloc]init];
    [usernamefieldbackview setImage:[UIImage imageNamed:@"usernameview"]];
    [SubBackgroundimg addSubview:usernamefieldbackview];
    
    
    ///username textfield////////============
    
    UsernameField = [[UITextField alloc]init];
    [UsernameField setBackgroundColor:[UIColor clearColor]];
    [UsernameField setPlaceholder:@"Username"];
    [UsernameField setText:@"@paulm"];
    [UsernameField setTextAlignment:NSTextAlignmentLeft];
    [UsernameField setTextColor:[UIColor lightGrayColor]];
    [UsernameField setDelegate:self];
    [SubBackgroundimg addSubview:UsernameField];
    
    
    //name sub label.....
    
     Namelbl = [[UILabel alloc]initWithFrame:CGRectMake(20, 80, 130, 30)];
    [Namelbl setText:@"Name"];
    [Namelbl setTextAlignment:NSTextAlignmentLeft];
    [Namelbl setBackgroundColor:[UIColor clearColor]];
    [Namelbl setTextColor:[UIColor blackColor]];
    [Namelbl setFont:[UIFont fontWithName:@"Helvetica" size:17]];
    [SubBackgroundimg addSubview:Namelbl];
    
    
    namefieldbackview = [[UIImageView alloc]init];
    [namefieldbackview setImage:[UIImage imageNamed:@"nametextfield"]];
    [SubBackgroundimg addSubview:namefieldbackview];
    
    
    ///name textfield////////============
    
    Nametextfield = [[UITextField alloc]init];
    [Nametextfield setBackgroundColor:[UIColor clearColor]];
    [Nametextfield setPlaceholder:@"Username"];
    [Nametextfield setText:@"Paul M"];
    [Nametextfield setTextAlignment:NSTextAlignmentLeft];
    [Nametextfield setTextColor:[UIColor lightGrayColor]];
    [Nametextfield setDelegate:self];
    [SubBackgroundimg addSubview:Nametextfield];
    
    
    //Gender label//////
    
    Namelbl = [[UILabel alloc]initWithFrame:CGRectMake(20, 150, 130, 30)];
    [Namelbl setText:@"Gender"];
    [Namelbl setTextAlignment:NSTextAlignmentLeft];
    [Namelbl setBackgroundColor:[UIColor clearColor]];
    [Namelbl setTextColor:[UIColor blackColor]];
    [Namelbl setFont:[UIFont fontWithName:@"Helvetica" size:17]];
    [SubBackgroundimg addSubview:Namelbl];
    
    //gender back image.....
    
    genderbackimage = [[UIImageView alloc]init];
    [genderbackimage setImage:[UIImage imageNamed:@"switchbutton"]];
    [SubBackgroundimg addSubview:genderbackimage];
    
    //gender male button...
    
    Malebutton = [UIButton buttonWithType:UIButtonTypeCustom];
    [Malebutton setBackgroundColor:[UIColor clearColor]];
    [Malebutton setTitle:@"Male" forState:UIControlStateNormal];
    [Malebutton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    //[Malebutton addTarget:self action:@selector(Male:) forControlEvents:UIControlEventTouchUpInside];
    [SubBackgroundimg addSubview:Malebutton];
    
    //gender female button......
    
    Femalenutton = [UIButton buttonWithType:UIButtonTypeCustom];
    [Femalenutton setTitle:@"Female" forState:UIControlStateNormal];
    [Femalenutton setBackgroundColor:[UIColor clearColor]];
    [Femalenutton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    //[Femalenutton addTarget:self action:@selector(Female:) forControlEvents:UIControlEventTouchUpInside];
    [SubBackgroundimg addSubview:Femalenutton];
    
    //border line view....
    
    LineView = [[UIView alloc]initWithFrame:CGRectMake(SubBackgroundimg.frame.origin.x-17, 230, SubBackgroundimg.frame.size.width-6, 2.0f)];
    [LineView setBackgroundColor:[UIColor lightGrayColor]];
    [SubBackgroundimg addSubview:LineView];
    
    
    //change password label...
    
    Changepasswordlbl = [[UILabel alloc]initWithFrame:CGRectMake(20, 237, 180, 30)];
    [Changepasswordlbl setText:@"Change Password"];
    [Changepasswordlbl setTextAlignment:NSTextAlignmentLeft];
    [Changepasswordlbl setBackgroundColor:[UIColor clearColor]];
    [Changepasswordlbl setTextColor:[UIColor blackColor]];
    [Changepasswordlbl setFont:[UIFont fontWithName:@"Helvetica" size:18]];
    [SubBackgroundimg addSubview:Changepasswordlbl];
    
    
    //uparrow button....
    
    Uparrawbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    [Uparrawbutton setBackgroundImage:[UIImage imageNamed:@"uparrow"] forState:UIControlStateNormal];
    //[Uparrawbutton addTarget:self action:@selector(uparrow:) forControlEvents:UIControlEventTouchUpInside];
    [SubBackgroundimg addSubview:Uparrawbutton];
    
    
    //shadow view.....
    
    UIImageView *shadow = [[UIImageView alloc]initWithFrame:CGRectMake(6, 275, SubBackgroundimg.frame.size.width-12, 50)];
    [shadow setImage:[UIImage imageNamed:@"shadowimg"]];
    [SubBackgroundimg addSubview:shadow];
    
    
    //password label/////////
    passwordlbl = [[UILabel alloc]initWithFrame:CGRectMake(20, 290, 130, 30)];
    [passwordlbl setText:@"Password"];
    [passwordlbl setTextAlignment:NSTextAlignmentLeft];
    [passwordlbl setBackgroundColor:[UIColor clearColor]];
    [passwordlbl setTextColor:[UIColor blackColor]];
    [passwordlbl setFont:[UIFont fontWithName:@"Helvetica" size:17]];
    [SubBackgroundimg addSubview:passwordlbl];
    
    
    UIImageView *passwordbackview = [[UIImageView alloc]init];
    [passwordbackview setImage:[UIImage imageNamed:@"passwordbackview"]];
    [SubBackgroundimg addSubview:passwordbackview];
    
    passwordtextfield = [[UITextField alloc]init];
    [passwordtextfield setBackgroundColor:[UIColor clearColor]];
    [passwordtextfield setPlaceholder:@"Password"];
    [passwordtextfield setText:@"aaaaaaaaaaa"];
    [passwordtextfield setTextAlignment:NSTextAlignmentLeft];
    [passwordtextfield setTextColor:[UIColor lightGrayColor]];
    [passwordtextfield setDelegate:self];
    [SubBackgroundimg addSubview:passwordtextfield];
    ///new password label//////
    
    newpasswordlbl = [[UILabel alloc]initWithFrame:CGRectMake(20, 355, 130, 30)];
    [newpasswordlbl setText:@"New Password"];
    [newpasswordlbl setTextAlignment:NSTextAlignmentLeft];
    [newpasswordlbl setBackgroundColor:[UIColor clearColor]];
    [newpasswordlbl setTextColor:[UIColor blackColor]];
    [newpasswordlbl setFont:[UIFont fontWithName:@"Helvetica" size:17]];
    [SubBackgroundimg addSubview:newpasswordlbl];
    
    
    UIImageView *newpasswordview = [[UIImageView alloc]init];
    [newpasswordview setImage:[UIImage imageNamed:@"passwordbackview"]];
    [SubBackgroundimg addSubview:newpasswordview];
    
    newwpasswordtextfield = [[UITextField alloc]init];
    [newwpasswordtextfield setBackgroundColor:[UIColor clearColor]];
    [newwpasswordtextfield setPlaceholder:@"New Password"];
    [newwpasswordtextfield setText:@"aaaaaaaaaaa"];
    [newwpasswordtextfield setTextAlignment:NSTextAlignmentLeft];
    [newwpasswordtextfield setTextColor:[UIColor lightGrayColor]];
    [newwpasswordtextfield setDelegate:self];
    [SubBackgroundimg addSubview:newwpasswordtextfield];
    
    //confirm password lanbel/////
    
    
    confirmpasswordlbl = [[UILabel alloc]initWithFrame:CGRectMake(20, 420, 150, 30)];
    [confirmpasswordlbl setText:@"Confirm Password"];
    [confirmpasswordlbl setTextAlignment:NSTextAlignmentLeft];
    [confirmpasswordlbl setBackgroundColor:[UIColor clearColor]];
    [confirmpasswordlbl setTextColor:[UIColor blackColor]];
    [confirmpasswordlbl setFont:[UIFont fontWithName:@"Helvetica" size:17]];
    [SubBackgroundimg addSubview:confirmpasswordlbl];
    
    
    UIImageView *confirmpasswordview = [[UIImageView alloc]init];
    [confirmpasswordview setImage:[UIImage imageNamed:@"passwordbackview"]];
    [SubBackgroundimg addSubview:confirmpasswordview];
    
    confirmtextfield = [[UITextField alloc]init];
    [confirmtextfield setBackgroundColor:[UIColor clearColor]];
    [confirmtextfield setPlaceholder:@"Confirm Password"];
    [confirmtextfield setText:@"aaaaaaaaaaa"];
    [confirmtextfield setTextAlignment:NSTextAlignmentLeft];
    [confirmtextfield setTextColor:[UIColor lightGrayColor]];
    [confirmtextfield setDelegate:self];
    [SubBackgroundimg addSubview:confirmtextfield];
    
    //lineview.......
    
    
    UIView *LineView1 = [[UIView alloc]initWithFrame:CGRectMake(SubBackgroundimg.frame.origin.x-17, 505, SubBackgroundimg.frame.size.width-6, 1.0f)];
    [LineView1 setBackgroundColor:[UIColor lightGrayColor]];
    [SubBackgroundimg addSubview:LineView1];
    
    
    
    //preference label//////
    
    UILabel * Preferences = [[UILabel alloc]initWithFrame:CGRectMake(20, 512, 130, 30)];
    [Preferences setText:@"Preferences"];
    [Preferences setTextAlignment:NSTextAlignmentLeft];
    [Preferences setBackgroundColor:[UIColor clearColor]];
    [Preferences setTextColor:[UIColor blackColor]];
    [Preferences setFont:[UIFont fontWithName:@"Helvetica" size:17]];
    [SubBackgroundimg addSubview:Preferences];
    
    UIButton *downarrowbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    [downarrowbutton setBackgroundImage:[UIImage imageNamed:@"downarrowbutton"] forState:UIControlStateNormal];
    [SubBackgroundimg addSubview:downarrowbutton];
    
    //second line view......
    
    UIView *LineView2 = [[UIView alloc]initWithFrame:CGRectMake(SubBackgroundimg.frame.origin.x-17, 548, SubBackgroundimg.frame.size.width-6, 1.0f)];
    [LineView2 setBackgroundColor:[UIColor lightGrayColor]];
    [SubBackgroundimg addSubview:LineView2];
    
    
    
    //preference label//////
    
    UILabel * notification = [[UILabel alloc]initWithFrame:CGRectMake(20, 555, 130, 30)];
    [notification setText:@"Notification"];
    [notification setTextAlignment:NSTextAlignmentLeft];
    [notification setBackgroundColor:[UIColor clearColor]];
    [notification setTextColor:[UIColor blackColor]];
    [notification setFont:[UIFont fontWithName:@"Helvetica" size:17]];
    [SubBackgroundimg addSubview:notification];
    
    //third line view...../////
    
    UIView *LineView3 = [[UIView alloc]initWithFrame:CGRectMake(SubBackgroundimg.frame.origin.x-17, 590, SubBackgroundimg.frame.size.width-6, 1.0f)];
    [LineView3 setBackgroundColor:[UIColor lightGrayColor]];
    [SubBackgroundimg addSubview:LineView3];
    
    //preference downarrow button....
    
    preferencedownarrowbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    [preferencedownarrowbutton setBackgroundImage:[UIImage imageNamed:@"downarrowbutton"] forState:UIControlStateNormal];
   // [preferencedownarrowbutton addTarget:self action:@selector(preferencedownbutton:) forControlEvents:UIControlEventTouchUpInside];
    [SubBackgroundimg addSubview:preferencedownarrowbutton];
    
    //notification downarrow button......
    
    notificationdownarrowbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    [notificationdownarrowbutton setBackgroundImage:[UIImage imageNamed:@"downarrowbutton"] forState:UIControlStateNormal];
    //[notificationdownarrowbutton addTarget:self action:@selector(preferencedownbutton:) forControlEvents:UIControlEventTouchUpInside];
    [SubBackgroundimg addSubview:notificationdownarrowbutton];
    
    if ([[UIScreen mainScreen]bounds].size.width == 320)
    {
        UserFullname.frame = CGRectMake(75, 133, 130, 30);
        UserProfileimage.frame = CGRectMake(90, 30, 100, 100);
        UserName.frame = CGRectMake(75, 155, 130, 30);
        ChangePictureButton.frame = CGRectMake(BackGroundScroll.frame.origin.x+58, 185,BackGroundScroll.frame.size.width-155, 30);
        usernamefieldbackview.frame = CGRectMake(20, 40, 201, 35);
        UsernameField.frame = CGRectMake(55, 40, 170, 35);
        namefieldbackview.frame = CGRectMake(20,110,201,35);
        Nametextfield.frame = CGRectMake(23,110,201,35);
        genderbackimage.frame = CGRectMake(20,180,201,35);
        [Femalenutton setFrame:CGRectMake(122, 180, 80, 35)];
        [Malebutton setFrame:CGRectMake(22, 180, 90, 35)];
        Uparrawbutton.frame = CGRectMake(200, 238, 26, 26);
        passwordbackview.frame = CGRectMake(20, 320, 201, 35);
        passwordtextfield.frame = CGRectMake(23, 320, 198, 35);
        newpasswordview.frame = CGRectMake(20, 385, 201, 35);
        newwpasswordtextfield.frame = CGRectMake(23, 385, 198, 35);
        confirmpasswordview.frame = CGRectMake(20, 455, 201, 35);
        confirmtextfield.frame = CGRectMake(23, 455, 198, 35);
        preferencedownarrowbutton.frame = CGRectMake(200, 512, 26, 26);
        notificationdownarrowbutton.frame = CGRectMake(200, 552, 26, 26);
    }
    else
    {
        UserProfileimage.frame = CGRectMake(117, 30, 100, 100);
        UserFullname.frame = CGRectMake(102, 133, 130, 30);
        UserName.frame = CGRectMake(102, 155, 130, 30);
        ChangePictureButton.frame = CGRectMake(BackGroundScroll.frame.origin.x+70, 185,BackGroundScroll.frame.size.width-180, 30);
        usernamefieldbackview.frame = CGRectMake(20, 40, 255, 35);
        UsernameField.frame = CGRectMake(55, 40, 220, 35);
        namefieldbackview.frame = CGRectMake(20,110,255,35);
        Nametextfield.frame = CGRectMake(23,110,255,35);
        genderbackimage.frame = CGRectMake(20,180,255,35);
        [Femalenutton setFrame:CGRectMake(152, 180, 120, 35)];
        [Malebutton setFrame:CGRectMake(22, 180, 120, 35)];
        Uparrawbutton.frame = CGRectMake(245, 238, 34, 34);
        passwordbackview.frame = CGRectMake(20, 320, 255, 35);
        passwordtextfield.frame = CGRectMake(23, 320, 250, 35);
        newpasswordview.frame = CGRectMake(20, 385, 255, 35);
        newwpasswordtextfield.frame = CGRectMake(23, 385, 250, 35);
        confirmpasswordview.frame = CGRectMake(20, 455, 255, 35);
        confirmtextfield.frame = CGRectMake(23, 455, 253, 35);
        preferencedownarrowbutton.frame = CGRectMake(245, 510, 34, 34);
        notificationdownarrowbutton.frame = CGRectMake(245, 552, 34, 34);
    }
    
    // Do any additional setup after loading the view.
}


//Backbutton function.....
-(void)Backbutton:(UIButton *)sender{
    
    ViewController *view = [[ViewController alloc]init];
    [self.navigationController pushViewController:view animated:YES];
}

-(void)Donetick:(UIButton *)sender{
    
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return  YES;
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
