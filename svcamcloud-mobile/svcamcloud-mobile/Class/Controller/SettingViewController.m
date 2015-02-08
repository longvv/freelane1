//
//  ViewController.m
//  svcamcloud-mobile
//
//  Created by vu van long on 2/8/15.
//  Copyright (c) 2015 LTTeam. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController ()

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
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
    if ([self.settingView.txtDomain isEditing] || [self.settingView.txtPort isEditing]) {
        [self.settingView endEditing:YES];
    }
}

#pragma mark - Business methods
- (void)prepareLayout{
    if (!self.settingView) {
        self.settingView = [[SettingView alloc] initWithFrame:self.scrollView.bounds];
        self.settingView.delegate = self;
        [self.scrollView addSubview:self.settingView];
    }
}

- (IBAction)btnBackPressed:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
