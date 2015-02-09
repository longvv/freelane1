//
//  CameraListViewController.m
//  svcamcloud-mobile
//
//  Created by vu van long on 2/9/15.
//  Copyright (c) 2015 LTTeam. All rights reserved.
//

#import "CameraListViewController.h"

@implementation CameraListViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    [self updateTableHeight]; // let's call it before tableview reload data.
}

- (void)updateTableHeight{
    self.tableHeightContraint.constant = 4 * 50;
    [self.view layoutIfNeeded];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [self dismissViewControllerAnimated:NO completion:nil];
}

#pragma mark - TableView methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cameraCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cameraCell"];
    }
    
    cell.textLabel.text = @"Camera name";
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.delegate respondsToSelector:@selector(selectCamera:)]) {
        [self.delegate selectCamera:nil];
    }
    [self dismissViewControllerAnimated:NO completion:nil];
}

@end
