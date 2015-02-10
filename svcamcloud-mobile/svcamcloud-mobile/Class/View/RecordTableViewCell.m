//
//  RecordTableViewCell.m
//  svcamcloud-mobile
//
//  Created by vu van long on 2/9/15.
//  Copyright (c) 2015 LTTeam. All rights reserved.
//

#import "RecordTableViewCell.h"
#import <AVFoundation/AVFoundation.h>


@implementation RecordTableViewCell

- (IBAction)actionMenu:(id)sender {
    if(self.playActionBlock){
        self.playActionBlock();
    }
}
@end
