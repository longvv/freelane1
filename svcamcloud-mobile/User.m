//
//  User.m
//  svcamcloud-mobile
//
//  Created by MD313 on 2/7/15.
//  Copyright (c) 2015 FreelancerTeam. All rights reserved.
//

#import "User.h"
#import "WebServiceManager.h"
@interface User()
@property (readwrite, nonatomic, assign) NSString *userEmail;
@property (readwrite, nonatomic, assign) NSString *userName;
@end
@implementation User
- (instancetype)initWithAttributes:(NSDictionary *)attributes {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.userName = [attributes valueForKeyPath:@"name"] ;
    self.userEmail = [attributes valueForKeyPath:@"email"];
    
    return self;
}


+ (NSURLSessionDataTask *)loginWithUserEmail:(NSString *) userEmail andPassword:(NSString *) password successBlock:(void (^)(User *loginUser, NSString *userToken))successBlock errorBlock:(void (^)(NSError * error))errorBLock{
    NSDictionary *parameters = [[NSMutableDictionary alloc]init];
    [parameters setValue:userEmail forKey:@"email"];
    [parameters setValue:@"password" forKey:@"password"];
    return [[AFAppDotNetAPIClient sharedClient] POST:[WebServiceManager loginWebServicePath] parameters:parameters  success:^(NSURLSessionDataTask * __unused task, id JSON) {
        NSDictionary *userDic = [JSON valueForKeyPath:@"user"];
        User *loginUsr = [[User alloc]initWithAttributes:userDic];
        NSString *loginToken = [JSON valueForKeyPath:@"session_key"];
        if (successBlock) {
            successBlock(loginUsr, loginToken);
        }
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        if (errorBLock) {
            errorBLock(error);
        }
    }];
}
@end
