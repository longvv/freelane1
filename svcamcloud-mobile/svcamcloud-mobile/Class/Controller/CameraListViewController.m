//
//  CameraListViewController.m
//  svcamcloud-mobile
//
//  Created by vu van long on 2/9/15.
//  Copyright (c) 2015 LTTeam. All rights reserved.
//

#import "CameraListViewController.h"
#import "Camera.h"

@interface CameraListViewController()
@property (strong, nonatomic) NSArray *cameraList;

@end

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
- (void) viewDidAppear:(BOOL)animated{
    [self loadCameraListData];
}
#pragma mark - TableView methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.cameraList.count;
}
- (void) loadCameraListData{
    [Camera globalCameraListWithFinishBlock:^(NSArray *cameras) {
        self.cameraList = cameras;
        [self.tableView reloadData];
        
    } errorBlock:^(NSError *error) {
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Lỗi" message:@"Bị lỗi rồi" delegate:nil
    cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
        
    }];
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cameraCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cameraCell"];
    }
    Camera *cameraItem = [self.cameraList objectAtIndex:indexPath.row];
    
    cell.textLabel.text = cameraItem.cameraName;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.delegate respondsToSelector:@selector(selectCamera:)]) {
        Camera *selectedCamera = [self.cameraList objectAtIndex:indexPath.row];
        [self.delegate selectCamera:selectedCamera];
    }
    [self dismissViewControllerAnimated:NO completion:nil];
}

@end
