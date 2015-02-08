//
//  ViewController.h
//  svcamcloud-mobile
//
//  Created by vu van long on 2/8/15.
//  Copyright (c) 2015 LTTeam. All rights reserved.
//

#import "BaseViewController.h"
#import "SettingView.h"
#import <TPKeyboardAvoiding/TPKeyboardAvoidingScrollView.h>

@interface SettingViewController : BaseViewController

@property (weak, nonatomic) IBOutlet TPKeyboardAvoidingScrollView *scrollView;
@property (strong, nonatomic) SettingView* settingView;

- (IBAction)btnBackPressed:(id)sender;

@end
