//
//  WebServiceManager.h
//  svcamcloud-mobile
//
//  Created by MD313 on 2/7/15.
//  Copyright (c) 2015 LTTeam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

@interface WebServiceManager : NSObject

+(NSString *) listCameraWebServicePath;
+(NSString *) loginWebServicePath;
+(NSString *) listRecordWebServicePath;
+(NSString *) viewCameraWebServicePath;
+(NSString *) serviceBaseUrlString;
@end
