//
//  WebServiceManager.m
//  svcamcloud-mobile
//
//  Created by MD313 on 2/7/15.
//  Copyright (c) 2015 FreelancerTeam. All rights reserved.
//

#import "WebServiceManager.h"

@implementation WebServiceManager

+ (NSString*) listCameraWebServicePath{
    return nil;
}

+ (NSString *) loginWebServicePath{
    return @"http://vcamcloud.com/api/v1/login";
}

+(NSString *)listRecordWebServicePath{
    return nil;
}

+(NSString *) viewCameraWebServicePath{
    return nil;
}

+(NSString *) serviceBaseUrlString{
    return @"http://vcamcloud.com";
}
@end
