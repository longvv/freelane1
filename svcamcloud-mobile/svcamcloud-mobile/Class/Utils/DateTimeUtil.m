//
//  DateTimeUtil.m
//  svcamcloud-mobile
//
//  Created by MD313 on 2/10/15.
//  Copyright (c) 2015 LTTeam. All rights reserved.
//

#import "DateTimeUtil.h"

@implementation DateTimeUtil

+ (NSString *) getTimeStringFromTimeInterval:(long)timeInterval{
    NSDate *recordStartTime = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond fromDate:recordStartTime];
    int startHour = [components hour];
    int startMinute = [components minute];
    int startSecond = [components second];
    NSString *timeString = [NSString stringWithFormat:@"%02d:%02d:%02d",startHour,startMinute,startSecond];
    return timeString;
}

+ (NSString *) getDateStringFromTimeInterval:(long)timeInterval{
    NSDate *recordStartTime = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:recordStartTime];
    int year = [components year];
    int month = [components month];
    int day = [components date];
    NSString *dateString = [NSString stringWithFormat:@"%d/%02d/%02d",year,month,day];
    return dateString;
}
@end
