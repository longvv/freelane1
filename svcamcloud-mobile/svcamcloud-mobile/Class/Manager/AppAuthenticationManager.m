//
//  AuthenticationManager.m
//  svcamcloud-mobile
//
//  Created by MD313 on 2/8/15.
//  Copyright (c) 2015 LTTeam. All rights reserved.
//

#import "AppAuthenticationManager.h"
#import "AppDelegate.h"

@implementation AppAuthenticationManager
+ (NSString *) sessionKeyString{
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    return appDelegate.sessionKey;
}

+ (User *) logginUser{
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    return appDelegate.loginUser;
}
+ (void) saveLogginUser:(User *)logginUser{
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    appDelegate.loginUser = logginUser;
}
+ (void) saveSessionKey:(NSString *)sessionkey{
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    appDelegate.sessionKey = sessionkey;
}
@end
