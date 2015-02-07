//
//  Camera.h
//  svcamcloud-mobile
//
//  Created by MD313 on 2/7/15.
//  Copyright (c) 2015 FreelancerTeam. All rights reserved.
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
+ (NSURLSessionDataTask *)globalCameraListWithCameraCode:(NSString *) cameraCode andFinishBlock:(void (^)(NSArray *cameras))finishBlock errorBlock:(void (^)( NSError *error))errorBLock ;

@end
