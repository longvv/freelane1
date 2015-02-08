//
//  AuthenticationManager.h
//  svcamcloud-mobile
//
//  Created by MD313 on 2/8/15.
//  Copyright (c) 2015 LTTeam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface AppAuthenticationManager : NSObject

+(NSString*) sessionKeyString;
+ (User *) logginUser;
+ (void) saveLogginUser:(User *) logginUser;
+ (void) saveSessionKey:(NSString *) sessionkey;
@end
