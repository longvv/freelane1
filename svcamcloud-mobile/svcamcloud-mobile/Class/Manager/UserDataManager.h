//
//  UserDataManager.h
//  svcamcloud-mobile
//
//  Created by MD313 on 2/8/15.
//  Copyright (c) 2015 LTTeam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserDataManager : NSObject
+ (void) saveServerBaseUrl:(NSString *) baseUrl;
+ (void) saveServerPort:(NSString *) port;
+ (NSString *) serverBaseUrl;
+ (NSString *) serverPort;

@end
