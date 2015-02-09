//
//  MyRecordingViewController.m
//  svcamcloud-mobile
//
//  Created by vu van long on 2/8/15.
//  Copyright (c) 2015 LTTeam. All rights reserved.
//

#import "MyRecordingViewController.h"

@interface MyRecordingViewController ()

@end

@implementation MyRecordingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showCameraSegue"]) {
        CameraListViewController *controller = segue.destinationViewController;
        controller.delegate = self;
    }
}

- (void)selectCamera:(id)camera{
    // show camera name is selected here.
}

#pragma mark - TableView methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    RecordTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"RecordTableViewCell"];
    if (!cell) {
        cell = [[RecordTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"RecordTableViewCell"];
    }
    
    return cell;
}

@end
