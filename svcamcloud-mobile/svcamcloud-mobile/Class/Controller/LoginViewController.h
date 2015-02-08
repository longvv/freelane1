//
//  ViewController.h
//  svcamcloud-mobile
//
//  Created by vu van long on 2/7/15.
//  Copyright (c) 2015 LTTeam. All rights reserved.
//

#import "BaseViewController.h"
#import "AppDelegate.h"
#import "LoginView.h"
#import <TPKeyboardAvoiding/TPKeyboardAvoidingScrollView.h>

@interface LoginViewController : BaseViewController<LoginDelegate>

@property (weak, nonatomic) IBOutlet TPKeyboardAvoidingScrollView *scrollView;
@property (nonatomic, strong) LoginView* loginView;


- (IBAction)btnSettingPressed:(id)sender;
@end

