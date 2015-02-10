//
//  RecordTableViewCell.m
//  svcamcloud-mobile
//
//  Created by vu van long on 2/9/15.
//  Copyright (c) 2015 LTTeam. All rights reserved.
//

#import "RecordTableViewCell.h"

@implementation RecordTableViewCell

- (IBAction)actionMenu:(id)sender {
    NSURL *url = [NSURL URLWithString:self.recordDownloadLink];
    [[UIApplication sharedApplication] openURL:url];
}
@end
