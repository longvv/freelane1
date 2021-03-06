//
//  Record.h
//  svcamcloud-mobile
//
//  Created by MD313 on 2/8/15.
//  Copyright (c) 2015 LTTeam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFAppDotNetAPIClient.h"

@interface Record : NSObject

@property (readonly,  nonatomic) NSInteger recordId;
@property (readonly, nonatomic, strong) NSString *cameraCode;
@property (readonly, nonatomic) long startTime;
@property (readonly, nonatomic) long endTime;
@property (readonly, nonatomic, strong) NSString *recordFile;
@property (readonly, nonatomic, strong) NSString *recordType;
@property (readonly, nonatomic, strong) NSString *viewRecordUrl;

- (instancetype)initWithAttributes:(NSDictionary *)attributes;
+ (NSURLSessionDataTask *)globalRecordListWithCameraCode:(NSString *)cameraCode  recordDate:(NSString *) date andFinishBlock:(void (^)(NSArray *records))finishBlock andErrorBlock:(void (^)(NSError *error))errorBlock;

@end
