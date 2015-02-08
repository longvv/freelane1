//
//  BaseViewController.h
//  svcamcloud-mobile
//
//  Created by vu van long on 2/8/15.
//  Copyright (c) 2015 LTTeam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface BaseViewController : UIViewController
@property (strong, nonatomic) UIView* overlayView;
- (void)showSideMenu;
@end
