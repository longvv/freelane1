//
//  MyRecordingViewController.m
//  svcamcloud-mobile
//
//  Created by vu van long on 2/8/15.
//  Copyright (c) 2015 LTTeam. All rights reserved.
//

#import "MyRecordingViewController.h"
#import "Record.h"
#import "Camera.h"
#import "DateTimeUtil.h"
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>

@interface MyRecordingViewController ()

@property (strong, nonatomic) NSArray *recordList;
@property (strong, nonatomic) NSString *strRecordDate;
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
    }else if ([segue.identifier isEqualToString:@"showCalendarSegue"]){
        //CalendarViewController *controller = segue.destinationViewController;
        //controller.delegate = self;
    }
}

- (void)selectCamera:(Camera*)camera{
    if(self.strRecordDate != nil){
        [self loadRecordListRecordByCamera:camera inDay:self.strRecordDate];
    }
    else{
        NSDate *today = [NSDate date];
        NSCalendar *cal = [[NSCalendar alloc] init];
       NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:[NSDate date]];
        int year = [components year];
        int month = [components month];
        int day = [components day];
        NSString *dateString = [NSString stringWithFormat:@"%d%02d%02d",year,month,day];
        [self loadRecordListRecordByCamera:camera inDay:dateString];
    }
}
- (void) sortRecordList{
    NSSortDescriptor *sortDescriptor;
    sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"startTime"
                                                 ascending:NO];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    self.recordList = [self.recordList sortedArrayUsingDescriptors:sortDescriptors];
    sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"endTime"
                                                 ascending:NO];
     self.recordList = [self.recordList sortedArrayUsingDescriptors:sortDescriptors];
}
- (void) loadRecordListRecordByCamera:(Camera *) camera inDay:(NSString *) recordDate{
    [Record globalRecordListWithCameraCode:camera.cameraCode recordDate:recordDate andFinishBlock:^(NSArray *records) {
        
        self.recordList = records;
        [self sortRecordList];
        [self.tableView reloadData];
    } andErrorBlock:^(NSError *error) {
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Lỗi" message:@"Bị lỗi rồi" delegate:nil
                                                 cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
        
    }];

}

#pragma mark - TableView methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.recordList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    RecordTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"RecordTableViewCell"];
    if (!cell) {
        cell = [[RecordTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"RecordTableViewCell"];
       
    }
    Record *recordItem = [self.recordList objectAtIndex:indexPath.row];
    NSString *startRecordTimeString = [DateTimeUtil getTimeStringFromTimeInterval:recordItem.startTime];
    NSString *endRecordTimeString = [DateTimeUtil getTimeStringFromTimeInterval:recordItem.endTime];
    NSString *recordDateString = [DateTimeUtil getDateStringFromTimeInterval:recordItem.startTime];
    cell.lbRecordBegin.text = startRecordTimeString;
    cell.lbRecordEnd.text = endRecordTimeString;
    cell.lbRecordDate.text = recordDateString;
    cell.recordDownloadLink = recordItem.viewRecordUrl;
    [cell setPlayActionBlock:^{
        NSURL *url = [NSURL URLWithString:recordItem.viewRecordUrl];
        if(self.playContainer.frame.size.height == 0){
            self.playContainer.frame = CGRectMake(self.playContainer.frame.origin.x, 100, self.playContainer.frame.size.width, 280);
        }
        CGRect titleBarFrame = self.titleBarView.frame;
        titleBarFrame.origin.y = self.playContainer.frame.origin.y + self.playContainer.frame.size.height;
        self.titleBarView.frame = titleBarFrame;
        CGRect tableViewFrame = self.tableView.frame;
        tableViewFrame.size.height = self.view.frame.size.height - self.titleBarView.frame.origin.y - self.titleBarView.frame.size.height;
        tableViewFrame.origin.y = self.titleBarView.frame.origin.y + self.titleBarView.frame.size.height;
        self.tableView.frame = tableViewFrame;
        UIWebView *webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, self.playContainer.frame.size.width, self.playContainer.frame.size.height)];
        [self.playContainer addSubview:webView];
        NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url];
        [webView loadRequest:request];
    }];
    
    return cell;
}

@end
