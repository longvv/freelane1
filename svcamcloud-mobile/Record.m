//
//  Record.m
//  svcamcloud-mobile
//
//  Created by MD313 on 2/8/15.
//  Copyright (c) 2015 FreelancerTeam. All rights reserved.
//

#import "Record.h"
#import "WebServiceManager.h"

@interface Record()

@property (readwrite,  nonatomic) NSInteger recordId;
@property (readwrite, nonatomic, strong) NSString *cameraCode;
@property (readwrite, nonatomic, strong) NSString *startTime;
@property (readwrite, nonatomic, strong) NSString *endTime;
@property (readwrite, nonatomic, strong) NSString *recordFile;
@property (readwrite, nonatomic, strong) NSString *recordType;
@property (readwrite, nonatomic, strong) NSString *viewRecordUrl;
@end

@implementation Record
- (instancetype)initWithAttributes:(NSDictionary *)attributes {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.recordId  = [[attributes valueForKeyPath:@"id"]integerValue] ;
    self.cameraCode = [attributes valueForKeyPath:@"camera_code"];
    self.startTime = [attributes valueForKey:@"start_time"];
    self.endTime = [attributes valueForKey:@"end_time"];
    self.recordFile = [attributes valueForKey:@"record_file"];
    self.recordType = [attributes valueForKey:@"type"];
    self.viewRecordUrl = [attributes valueForKey:@"view_record_url"];
    
    return self;
}

+ (NSURLSessionDataTask *)globalRecordListWithCameraCode:(NSString *)cameraCode andFinishBlock:(void (^)(NSArray *records))finishBlock andErrorBlock:(void (^)(NSError *error))errorBlock{
       [[AFAppDotNetAPIClient sharedClient].requestSerializer setValue:[AppAuthenticationManager sessionKeyString] forHTTPHeaderField:@"X-Tokens"];
    return [[AFAppDotNetAPIClient sharedClient] GET:[WebServiceManager listCameraWebServicePath] parameters:cameraCode success:^(NSURLSessionDataTask * __unused task, id JSON) {
        NSArray *recordsFromResponse = [JSON valueForKeyPath:@"record_list"];
        NSMutableArray *mutableRecords = [NSMutableArray arrayWithCapacity:[recordsFromResponse count]];
        for (NSDictionary *attributes in recordsFromResponse) {
            Record *record = [[Record alloc] initWithAttributes:attributes];
            [mutableRecords addObject:record];
        }
        
        if (finishBlock) {
            finishBlock([NSArray arrayWithArray:mutableRecords]);
        }
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        if (errorBlock) {
            errorBlock(error);
        }
    }];
}
@end
