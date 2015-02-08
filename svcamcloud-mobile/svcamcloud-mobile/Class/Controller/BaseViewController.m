//
//  BaseViewController.m
//  svcamcloud-mobile
//
//  Created by vu van long on 2/8/15.
//  Copyright (c) 2015 LTTeam. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

- (void)setupViewBorder:(UIView*)view{
    view.layer.borderColor = [[UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1.0] CGColor];
    view.layer.borderWidth = 0.5;
    view.layer.cornerRadius = 5;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view sendSubviewToBack:self.overlayView];
    [self.overlayView setHidden:YES];
}

- (void)showSideMenu{
    if (!self.overlayView) {
        self.overlayView = [[UIView alloc] initWithFrame:self.view.bounds];
        self.overlayView.backgroundColor = [UIColor blackColor];
        self.overlayView.alpha = 0.5;
        [self.view addSubview:self.overlayView];
    }
    [self.overlayView setHidden:NO];
    [self.view bringSubviewToFront:self.overlayView];
}
@end
