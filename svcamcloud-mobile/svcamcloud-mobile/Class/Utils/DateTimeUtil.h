//
//  DateTimeUtil.h
//  svcamcloud-mobile
//
//  Created by MD313 on 2/10/15.
//  Copyright (c) 2015 LTTeam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateTimeUtil : NSObject
+(NSString *) getTimeStringFromTimeInterval:(long) timeInterval;
+(NSString *) getDateStringFromTimeInterval:(long) timeInterval;

@end
