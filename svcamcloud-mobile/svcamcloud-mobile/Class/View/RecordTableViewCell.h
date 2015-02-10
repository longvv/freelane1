//
//  RecordTableViewCell.h
//  svcamcloud-mobile
//
//  Created by vu van long on 2/9/15.
//  Copyright (c) 2015 LTTeam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecordTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lbRecordDate;
@property (weak, nonatomic) IBOutlet UILabel *lbRecordBegin;
@property (weak, nonatomic) IBOutlet UILabel *lbRecordEnd;
@property (strong, nonatomic) NSString *recordDownloadLink;
@property (nonatomic, copy) void (^playActionBlock)(void);
- (IBAction)actionMenu:(id)sender;

@end
