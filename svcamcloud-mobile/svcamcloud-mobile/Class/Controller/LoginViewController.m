//
//  ViewController.m
//  svcamcloud-mobile
//
//  Created by vu van long on 2/7/15.
//  Copyright (c) 2015 LTTeam. All rights reserved.
//

#import "LoginViewController.h"
#import "MenuTableViewController.h"
#import "User.h"
#import "AppAuthenticationManager.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self prepareLayout];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TextField delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField becomeFirstResponder];
    if ([textField isEqual:self.txtEmail]) {
        [self.txtPassword resignFirstResponder];
    }else{
        [self btnSinginPressed:nil];
    }
    return YES;
}

#pragma mark - Business methods
- (void)prepareLayout{
    [self setupViewBorder:self.txtPassword];
    [self setupViewBorder:self.txtEmail];
    [self setupViewBorder:self.btnRemember];
}

#pragma mark - IBAction methods
- (IBAction)btnSinginPressed:(id)sender {
    NSString *email = self.txtEmail.text;
    NSString *password = self.txtPassword.text;
    [User loginWithUserEmail:email andPassword:password successBlock:^(User *loginUser, NSString *userToken) {
        [AppAuthenticationManager saveLogginUser:loginUser];
        [AppAuthenticationManager saveSessionKey:userToken];
        MenuTableViewController* controller = [mainStoryboard instantiateViewControllerWithIdentifier:@"MenuTableViewController"];
        [self.navigationController pushViewController:controller animated:YES];
        
    } errorBlock:^(NSError *error) {
        
    }];
}

- (IBAction)btnSettingPressed:(id)sender {
}

@end
