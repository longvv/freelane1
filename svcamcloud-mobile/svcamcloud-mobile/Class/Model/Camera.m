//
//  Camera.m
//  svcamcloud-mobile
//
//  Created by MD313 on 2/7/15.
//  Copyright (c) 2015 LTTeam. All rights reserved.
//

#import "Camera.h"
#import "WebServiceManager.h"
#import "AppAuthenticationManager.h"

@interface Camera()
@property (readwrite, strong, nonatomic) NSString *groupName;
@property (readwrite, strong, nonatomic) NSString *cameraId;
@property (readwrite, strong, nonatomic) NSString *groupId;
@property (readwrite, strong, nonatomic) NSString *cameraCode;
@property (readwrite, strong, nonatomic) NSString *cameraName;
@property (readwrite, nonatomic) CameraStatus status;
@end

@implementation Camera

- (instancetype)initWithAttributes:(NSDictionary *)attributes{
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.cameraId = [attributes valueForKeyPath:@"id"] ;
    self.cameraCode = [attributes valueForKeyPath:@"camera_code"];
    self.cameraName = [attributes valueForKeyPath:@"camera_name"];
    self.groupId = [attributes valueForKeyPath:@"group_id"];
    self.status = [[attributes valueForKeyPath:@"status"] integerValue];
    
    return self;
}

+ (NSURLSessionDataTask *)globalCameraListWithFinishBlock:(void (^)(NSMutableDictionary *))finishBlock errorBlock:(void (^)(NSError *))errorBLock{
       [[AFAppDotNetAPIClient sharedClient].requestSerializer setValue:[AppAuthenticationManager sessionKeyString] forHTTPHeaderField:@"X-Tokens"];
    return [[AFAppDotNetAPIClient sharedClient] GET:[WebServiceManager listCameraWebServicePath] parameters:nil success:^(NSURLSessionDataTask * __unused task, id JSON) {
        NSDictionary *cameraFromResponse = [JSON valueForKeyPath:@"camera_list"];
//        NSMutableArray *mutablecameras = [NSMutableArray arrayWithCapacity:[cameraFromResponse count]];
        NSMutableDictionary *groupCameraDict = [[NSMutableDictionary alloc]init];
        for (NSString *key in cameraFromResponse) {
            NSMutableArray *groupCamera = [[NSMutableArray alloc]init];
            NSArray *cameraList = [cameraFromResponse objectForKey:key];
            for(NSDictionary *attribute in cameraList){
                Camera *camera = [[Camera alloc] initWithAttributes:attribute];
                [groupCamera addObject:camera];
            }
            [groupCameraDict setObject:groupCamera forKey:key];
        }
        if (finishBlock) {
            finishBlock(groupCameraDict);
        }
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        if (errorBLock) {
            errorBLock(error);
        }
    }];
}

+ (NSURLSessionDataTask *)globalGetCameraViewURLWithCameraCode:(NSString *)cameraCode andFinishBlock:(void (^)(NSString *viewUrl))finishBlock errorBlock:(void (^)(NSError *))errorBLock{
    [[AFAppDotNetAPIClient sharedClient].requestSerializer setValue:[AppAuthenticationManager sessionKeyString] forHTTPHeaderField:@"X-Tokens"];
    return [[AFAppDotNetAPIClient sharedClient] GET:[WebServiceManager loginWebServicePath] parameters:cameraCode  success:^(NSURLSessionDataTask * __unused task, id JSON) {
        NSString *viewUrl = [JSON valueForKeyPath:@"url"];
        if (finishBlock) {
            finishBlock(viewUrl);
        }
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        if (errorBLock) {
            errorBLock(error);
        }
    }];
    
}

@end
