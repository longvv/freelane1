//
//  User.h
//  svcamcloud-mobile
//
//  Created by MD313 on 2/7/15.
//  Copyright (c) 2015 LTTeam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFAppDotNetAPIClient.h"

@interface User : NSObject
@property (readonly, nonatomic, assign) NSString *userEmail;
@property (readonly, nonatomic, assign) NSString *userName;

- (instancetype)initWithAttributes:(NSDictionary *)attributes;

+ (NSURLSessionDataTask *)loginWithUserEmail:(NSString *) userEmail andPassword:(NSString *) password successBlock:(void (^)(User *loginUser, NSString *userToken))successBlock errorBlock:(void (^)(NSError * error))errorBLock;

@end
