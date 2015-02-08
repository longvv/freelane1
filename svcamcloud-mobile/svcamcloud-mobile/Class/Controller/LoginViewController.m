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
#import "SettingViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self prepareLayout];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    if ([self.loginView.txtEmail isEditing] || [self.loginView.txtPassword isEditing]) {
        [self.loginView endEditing:YES];
    }
}

#pragma mark - LoginDelegate
- (void)loginUser:(NSString *)email password:(NSString *)pass{
    [User loginWithUserEmail:email andPassword:pass successBlock:^(User *loginUser, NSString *userToken) {
        MenuTableViewController* controller = [mainStoryboard instantiateViewControllerWithIdentifier:@"MenuTableViewController"];
        [self.navigationController pushViewController:controller animated:YES];
        
    } errorBlock:^(NSError *error) {
        
        
    }];
}

#pragma mark - Business methods
- (void)prepareLayout{
    if (!self.loginView) {
        self.loginView = [[LoginView alloc] initWithFrame:self.scrollView.bounds];
        self.loginView.delegate = self;
        [self.scrollView addSubview:self.loginView];
    }
}

#pragma mark - IBAction methods
- (IBAction)btnSettingPressed:(id)sender {
    SettingViewController* controller = [mainStoryboard instantiateViewControllerWithIdentifier:@"SettingViewController"];
    controller.scrollViewTopContraint.constant = 75;
    [self.navigationController pushViewController:controller animated:YES];
}

@end
