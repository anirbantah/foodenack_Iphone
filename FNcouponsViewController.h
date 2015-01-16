//
//  FNcouponsViewController.h
//  Foodenak
//
//  Created by RAHUL - ( iMAC ) on 07/01/15.
//  Copyright (c) 2015 Esolz Tech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FNredeemViewController.h"
@interface FNcouponsViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    
    
    UIView *Backgroundview,*redline,*shortview;
    UIImageView *topview,*topbar;
    UILabel *header,*header1;
    
    
    /*--------------------- Top Menu buttons -------------------*/
    
    UIButton *all,*review,*photo,*discussion;
    UILabel *popularlistlbl;
    UIImageView *downarrow;
    
    UITableView *mycouponstable;

    
    
}
@end
