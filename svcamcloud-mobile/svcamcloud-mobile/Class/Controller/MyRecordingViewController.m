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
        NSString *dateString = [NSString stringWithFormat:@"%d%d%d",year,month,day];
        [self loadRecordListRecordByCamera:camera inDay:dateString];
    }
}

- (void) loadRecordListRecordByCamera:(Camera *) camera inDay:(NSString *) recordDate{
    [Record globalRecordListWithCameraCode:camera.cameraCode recordDate:recordDate andFinishBlock:^(NSArray *records) {
        self.recordList = records;
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
        Record *recordItem = [self.recordList objectAtIndex:indexPath.row];
        cell.lbRecordBegin.text = recordItem.startTime;
        cell.lbRecordEnd.text = recordItem.endTime;
        cell.lbRecordDate.text = self.strRecordDate;
    }
    
    return cell;
}

@end
