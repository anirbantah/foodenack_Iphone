//
//  ViewController.h
//  Foodenak
//
//  Created by RAHUL - ( iMAC ) on 05/01/15.
//  Copyright (c) 2015 Esolz Tech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FNaddmenuViewController.h"
#import "FNcouponsViewController.h"
#import "FNmenuViewController.h"
@interface ViewController : UIViewController<UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
{
 /* //// Mainview and TopView(RED) //// */
    
    UIView *Backgroundview;
    UIScrollView *Backgroundscroll,*sidescroll;
    UIImageView *topview,*topbar,*backgroundimage,*downarrow,*nearim,*imlooking;
    UIButton *menubutton,*locatorbutton,*editbutton,*camerabutton,*messegebutton,*searchbutton;
    UILabel *header,*about,*about2;
    UITextField *near,*lookingfor;
    
    /* Page Indicator */
    
    UIImageView *p1,*p2,*p3,*p4,*p5;
    
    /////////////////////////////
    
    /*---- For Top Bar -----*/
    
    UIButton *peoplebutton1,*homebutton,*placebutton;
    UIImageView *people,*home,*place;
    UIView *redline,*blackline;
    
    //////////////////////
    
    UIButton *statictbutton,*popularbutton;
    UIImageView *popularbackground,*popularview,*popularicon,*uparrow,*topuserbackground,*topuserview,*uparrow2,*topusericon,*mypinbackground,*mypinview,*uparrow3,*mypinicon,*myfeedbackground,*myfeedview,*myfeedicon,*uparrow4;
    UILabel *popularheader,*topuserheader,*mypinheader,*myfeedheader;
    
    UITableView *topusertable,*popularcommenttable,*Feedlist_View,*mypintable;
    
    UIScrollView *Popularsidescroll;
    
    BOOL toggle;
    
    /* ------------------------ Left Toggle Menu ------------------------- */
    
    UIView *Leftmenu;
    UIButton *Bookmark,*Recent,*Mycoupons,*Editprofile,*Signout,*Rateus,*Sendfeedback,*Addnew,*Restaurant,*About;
    UIImageView *bookmarkicon,*recenticon,*mycouponicon,*editprofileicon,*signouticon,*rateusicon,*sendfeedbackicon,*addnewicon,*abouticon;
    UIScrollView *leftmenuscroll;
    
    
   
    
}
@end

