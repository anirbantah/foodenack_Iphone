//
//  FNmenuViewController.h
//  Foodenak
//
//  Created by RAHUL - ( iMAC ) on 09/01/15.
//  Copyright (c) 2015 Esolz Tech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FNaddItemViewController.h"
@interface FNmenuViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
{
    
    UIView *Backgroundview,*redline,*shortview;
    UIImageView *topview,*topbar;
    UILabel *header,*header1,*likecount,*photocount;
    UITableView *menulistTable;
    
    UIScrollView *photoscroll;

    
    /*--------- Page indicator image -------------*/
    
    
    UIImageView *p1,*p2,*p3,*p4;
    
}

@end
