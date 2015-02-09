//
//  WebServiceManager.m
//  svcamcloud-mobile
//
//  Created by MD313 on 2/7/15.
//  Copyright (c) 2015 LTTeam. All rights reserved.
//

#import "WebServiceManager.h"
#import "UserDataManager.h"

@implementation WebServiceManager

+ (NSString*) listCameraWebServicePath{
    NSString *serviceBaseUrl = [self serviceBaseUrlString];
    NSString *apiString = [NSString stringWithFormat:@"%@%@",serviceBaseUrl,@"/api/v1/camera/list"];
    return apiString;
}

+ (NSString *) loginWebServicePath{
    NSString *serviceBaseUrl = [self serviceBaseUrlString];
    NSString *apiString = [NSString stringWithFormat:@"%@%@",serviceBaseUrl,@"/api/v1/login"];
    return apiString;
}

+(NSString *)listRecordWebServicePath{
    NSString *serviceBaseUrl = [self serviceBaseUrlString];
    NSString *apiString = [NSString stringWithFormat:@"%@%@",serviceBaseUrl,@"/api/v1/camera/record"];
    return apiString;

}

+(NSString *) viewCameraWebServicePath{
    return nil;
}

+(NSString *) serviceBaseUrlString{
    NSString *usrBaseUrl = [UserDataManager serverBaseUrl];
    NSString *serverPort = [UserDataManager serverPort];
    NSString *serverBaseUrlWithPort = [NSString stringWithFormat:@"%@:%@",usrBaseUrl,serverPort];
    return serverBaseUrlWithPort;
}
@end
