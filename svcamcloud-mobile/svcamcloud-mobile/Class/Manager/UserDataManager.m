//
//  UserDataManager.m
//  svcamcloud-mobile
//
//  Created by MD313 on 2/8/15.
//  Copyright (c) 2015 LTTeam. All rights reserved.
//

#import "UserDataManager.h"

@implementation UserDataManager
+(void) saveServerBaseUrl:(NSString *)baseUrl{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    [userDefault setValue:baseUrl forKey:@"server_base_url"];
}
+ (void) saveServerPort:(NSString *)port{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    [userDefault setValue:port forKey:@"server_port"];
}
+ (NSString *) serverBaseUrl{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *url = [userDefault objectForKey:@"server_base_url"];
    if(url == nil){
        url = @"http://vcamcloud.com";
    }
    return url;
}
+(NSString *) serverPort{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *port = [userDefault objectForKey:@"server_port"];
    if(port == nil){
        port = @"80";
    }
    return port;
}
@end
