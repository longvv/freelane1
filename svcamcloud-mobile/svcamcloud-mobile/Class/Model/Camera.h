//
//  Camera.h
//  svcamcloud-mobile
//
//  Created by MD313 on 2/7/15.
//  Copyright (c) 2015 LTTeam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CameraStatus.h"
#import "AFAppDotNetAPIClient.h"

@interface Camera : NSObject
@property (readonly, strong, nonatomic) NSString *cameraId;
@property (readonly, strong, nonatomic) NSString *groupId;
@property (readonly, strong, nonatomic) NSString *cameraCode;
@property (readonly, strong, nonatomic) NSString *cameraName;
@property (readonly, nonatomic) CameraStatus status;

- (instancetype)initWithAttributes:(NSDictionary *)attributes;
+ (NSURLSessionDataTask *)globalCameraListWithFinishBlock:(void (^)(NSArray *cameras))finishBlock errorBlock:(void (^)( NSError *error))errorBLock ;
+ (NSURLSessionDataTask *)globalGetCameraViewURLWithCameraCode:(NSString *)cameraCode andFinishBlock:(void (^)(NSString *viewUrl))finishBlock errorBlock:(void (^)(NSError *))errorBLock;
@end
