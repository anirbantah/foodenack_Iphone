//
//  FNaddItemViewController.h
//  Foodenak
//
//  Created by RAHUL - ( iMAC ) on 09/01/15.
//  Copyright (c) 2015 Esolz Tech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FNaddItemViewController : UIViewController<UITextFieldDelegate>
{
    UIView *Backgroundview;
    UIImageView *topview,*topbar;
    UILabel *header,*header1;
    
    /* ------------- input fields ---------------- */
    
    UITextField *Menuname,*price;
    
}
@end
