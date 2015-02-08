//
//  MyRecordingViewController.h
//  svcamcloud-mobile
//
//  Created by vu van long on 2/8/15.
//  Copyright (c) 2015 LTTeam. All rights reserved.
//

#import "BaseViewController.h"
#import "RecordTableViewCell.h"

@interface MyRecordingViewController : BaseViewController<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *MenuView;
@property (weak, nonatomic) IBOutlet UIView *titleBarView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
