//
//  ViewController.m
//  svcamcloud-mobile
//
//  Created by vu van long on 2/7/15.
//  Copyright (c) 2015 FreelancerTeam. All rights reserved.
//

#import "LoginViewController.h"
#import "ViewController.h"
#import "User.h"

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
        ViewController* controller = [mainStoryboard instantiateViewControllerWithIdentifier:@"ViewController"];
        [self.navigationController pushViewController:controller animated:YES];
        
    } errorBlock:^(NSError *error) {
    
        
    }];
//    ViewController* controller = [mainStoryboard instantiateViewControllerWithIdentifier:@"ViewController"];
//    [self.navigationController pushViewController:controller animated:YES];
}

- (IBAction)btnSettingPressed:(id)sender {
}

@end
