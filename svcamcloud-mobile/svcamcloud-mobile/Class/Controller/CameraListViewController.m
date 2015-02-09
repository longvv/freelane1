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
@property (strong, nonatomic) NSDictionary *groupsCameraList;
@property (strong, nonatomic) NSMutableArray *groupNames;

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

- (void) loadCameraListData{
    [Camera globalCameraListWithFinishBlock:^(NSMutableDictionary *cameras) {
        self.groupsCameraList = cameras;
        self.groupNames = [[NSMutableArray alloc]init];
        for (NSString *key in self.groupsCameraList){
            [self.groupNames addObject:key];
        }
        [self.tableView reloadData];
        
    } errorBlock:^(NSError *error) {
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Lỗi" message:@"Bị lỗi rồi" delegate:nil
                                                 cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
        
    }];
    
}
#pragma mark - TableView methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSString *groupName = [self.groupNames objectAtIndex:section];
    NSMutableArray *groupCameras = [self.groupsCameraList objectForKey:groupName];
    return groupCameras.count;
}

- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    NSString *headerTitle = [self.groupNames objectAtIndex:section];
    UILabel *headerLabel = [[UILabel alloc]init];
    headerLabel.text = headerTitle;
    return headerLabel;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.groupsCameraList.count;
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cameraCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cameraCell"];
    }
    NSString *groupName = [self.groupNames objectAtIndex:indexPath.section];
    NSMutableArray *groupCameras = [self.groupsCameraList objectForKey:groupName];

    Camera *cameraItem = [groupCameras objectAtIndex:indexPath.row];
    
    cell.textLabel.text = cameraItem.cameraName;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.delegate respondsToSelector:@selector(selectCamera:)]) {
        NSString *groupName = [self.groupNames objectAtIndex:indexPath.section];
        NSMutableArray *groupCameras = [self.groupsCameraList objectForKey:groupName];
        
//        Camera *cameraItem = [groupCameras objectAtIndex:indexPath.row];
        Camera *selectedCamera = [groupCameras objectAtIndex:indexPath.row];
        [self.delegate selectCamera:selectedCamera];
    }
    [self dismissViewControllerAnimated:NO completion:nil];
}

@end
