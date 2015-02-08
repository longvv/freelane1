//
//  MenuTableViewController.m
//  Template 1
//
//  Created by Rafael on 05/12/13.
//  Copyright (c) 2013 Rafael Colatusso. All rights reserved.
//

#import "MenuTableViewController.h"
#import "CustomMenuCell.h"
#import "SettingViewController.h"
#import "MyCameraViewController.h"
#import "MyRecordingViewController.h"

@interface MenuTableViewController ()

@end

@implementation MenuTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.menuOptions = [NSArray arrayWithObjects:@"My camera", @"My Recording", @"Setting", @"Sing out", nil]; // menu options strings
    self.tableView.backgroundColor = [UIColor whiteColor];
    // watch for new rows added via AddToDoViewController
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleUpdatedData:)
                                                 name:@"ToDoDataUpdated"
                                               object:nil];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // define screen size
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    self.screenWidth = screenRect.size.width;
    self.screenHeight = screenRect.size.height;
    
    self.view.frame = CGRectMake(-(self.screenWidth * 0.8), 0, (self.screenWidth * 0.8) + self.screenWidth, self.screenHeight);
    // instantiate the controllers 
    [self instantiateControllers];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.menuOptions count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // example using a custom UITableViewCell
    static NSString *CellIdentifier = @"MenuCell";
    CustomMenuCell *customCell = (CustomMenuCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!customCell) {
        customCell = [[CustomMenuCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    customCell.info.text = [self.menuOptions objectAtIndex:indexPath.row];
    return customCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // controls your menu selection but first remove what is currently loaded
    [self removeSubviews];
    
    self.navigationItem.rightBarButtonItem = nil;
    switch (indexPath.row) {
        case 0:
            [self initMyCameraViewController];
            break;
        case 1:
            [self initMyRecordingViewController];
            break;
        case 2:
            [self initSettingViewController];
            break;
        case 3:
            [self singOut];
            break;
        default:
            break;
    }
}

#pragma mark -
#pragma mark Helper methods

- (void)instantiateControllers {
    // my camera
    self.myCameraViewController.view.tag = 999;
    self.myCameraViewController = [myCameraStoryboard
                               instantiateViewControllerWithIdentifier:@"MyCameraViewController"];
    self.myCameraViewController.view.frame = CGRectMake((self.screenWidth * 0.8), 0, self.screenWidth, self.screenHeight);
    [self.navigationController.navigationBar.topItem setTitle:@"My Camera"];
    [self.view addSubview:self.myCameraViewController.view];
    [UIView animateWithDuration:0.5f animations:^{
        self.view.frame = CGRectMake(-(self.screenWidth * 0.8), 0, (self.screenWidth * 0.8) + self.screenWidth, self.screenHeight);
    }];

    
    // my record
    self.myRecordingViewController.view.tag = 999;
    self.myRecordingViewController = [myRecordingStoryboard
                                   instantiateViewControllerWithIdentifier:@"MyRecordingViewController"];
    // setting
    self.settingViewController.view.tag = 999;
    self.settingViewController = [mainStoryboard
                                instantiateViewControllerWithIdentifier:@"SettingViewController"];
    // sing out
    
}

- (void)initSettingViewController {
    // load todo view controller
    [self.navigationController.navigationBar.topItem setTitle:@"Setting"];
    self.settingViewController.view.tag = 999;
    self.settingViewController.view.frame = CGRectMake((self.screenWidth * 0.8), 0, self.screenWidth, self.screenHeight);
    [self.view addSubview:self.settingViewController.view];
    self.settingViewController.scrollViewTopContraint.constant = 10;
    [self.settingViewController.view layoutIfNeeded];
    
    [UIView animateWithDuration:0.5f animations:^{
        self.view.frame = CGRectMake(-(self.screenWidth * 0.8), 0, (self.screenWidth * 0.8) + self.screenWidth, self.screenHeight);
    }];
}

- (void)initMyCameraViewController {
    // load todo view controller
    [self.navigationController.navigationBar.topItem setTitle:@"My Camera"];
    self.myCameraViewController.view.tag = 999;
    self.myCameraViewController.view.frame = CGRectMake((self.screenWidth * 0.8), 0, self.screenWidth, self.screenHeight);
    [self.view addSubview:self.myCameraViewController.view];
    [UIView animateWithDuration:0.5f animations:^{
        self.view.frame = CGRectMake(-(self.screenWidth * 0.8), 0, (self.screenWidth * 0.8) + self.screenWidth, self.screenHeight);
    }];
}

- (void)initMyRecordingViewController {
    // load todo view controller
    [self.navigationController.navigationBar.topItem setTitle:@"My Recording"];
    self.myRecordingViewController.view.tag = 999;
    self.myRecordingViewController.view.frame = CGRectMake((self.screenWidth * 0.8), 0, self.screenWidth, self.screenHeight);
    [self.view addSubview:self.myRecordingViewController.view];
    [UIView animateWithDuration:0.5f animations:^{
        self.view.frame = CGRectMake(-(self.screenWidth * 0.8), 0, (self.screenWidth * 0.8) + self.screenWidth, self.screenHeight);
    }];
}

- (void)singOut{
    
}

- (void)removeSubviews {
    // remove the current subview loaded
    for (UIView *view in [self.view subviews]) {
        if (view.tag == 999) {
            [view removeFromSuperview];
        }
    }
}

-(void)handleUpdatedData:(NSNotification *)notification {
    // remove the view after you add a new line
}

- (IBAction)showMenu:(id)sender {
    // controls the side menu with animations
    if (self.view.frame.origin.x < 0) {
        [UIView animateWithDuration:0.5f animations:^{
            // show side menu
            self.view.frame = CGRectMake(0, 0, (self.screenWidth * 0.8) + self.screenWidth, self.screenHeight);
        }];
    }
    else {
        [UIView animateWithDuration:0.5f animations:^{
            // hide side menu
            self.view.frame = CGRectMake(-(self.screenWidth * 0.8), 0, (self.screenWidth * 0.8) + self.screenWidth, self.screenHeight);
        }];
    }
}

@end
