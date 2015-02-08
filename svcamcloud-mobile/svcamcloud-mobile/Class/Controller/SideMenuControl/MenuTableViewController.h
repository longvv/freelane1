//
//  MenuTableViewController.h
//  Template 1
//
//  Created by Rafael on 05/12/13.
//  Copyright (c) 2013 Rafael Colatusso. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SettingViewController;
@class MyCameraViewController;
@class MyRecordingViewController;

@interface MenuTableViewController : UITableViewController
@property (strong, nonatomic) NSArray *menuOptions;
@property (assign, nonatomic) CGFloat screenWidth;
@property (assign, nonatomic) CGFloat screenHeight;
@property (strong, nonatomic) SettingViewController *settingViewController;
@property (strong, nonatomic) MyCameraViewController *myCameraViewController;
@property (strong, nonatomic) MyRecordingViewController *myRecordingViewController;

- (IBAction)showMenu:(id)sender;
@end
