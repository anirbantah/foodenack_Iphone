//
//  FNaddmenuViewController.h
//  Foodenak
//
//  Created by RAHUL - ( iMAC ) on 07/01/15.
//  Copyright (c) 2015 Esolz Tech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FNaddmenuViewController : UIViewController
{
    
    
    UIView *Backgroundview,*redline,*shortview;
    UIScrollView *Backgroundscroll;
    UIImageView *topview,*topbar;
    UILabel *header,*header1;
    
    
   /*--------------------- Top Menu buttons -------------------*/
    
    UIButton *all,*review,*photo,*discussion;
    UILabel *popularlistlbl;
    UIImageView *downarrow;
}
@end
