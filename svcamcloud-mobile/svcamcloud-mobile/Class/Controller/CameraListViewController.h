//
//  CameraListViewController.h
//  svcamcloud-mobile
//
//  Created by vu van long on 2/9/15.
//  Copyright (c) 2015 LTTeam. All rights reserved.
//

#import "BaseViewController.h"

@protocol CameraListDelegate

- (void)selectCamera:(id)camera;

@end

@interface CameraListViewController : BaseViewController<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tableHeightContraint;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (assign, nonatomic) id delegate;

@end
