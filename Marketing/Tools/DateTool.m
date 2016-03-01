//
//  DateTool.m
//  移动营销
//
//  Created by Hanen 3G 01 on 16/2/24.
//  Copyright © 2016年 Hanen 3G 01. All rights reserved.
//

#import "DateTool.h"

@implementation DateTool

+ (NSString *)getCurrentDate;
{
    NSDate *date = [NSDate date];
    NSDateFormatter *formate = [[NSDateFormatter alloc] init];
    [formate setDateFormat:@"yyyy.MM.dd HH:mm"];//HH 大写就是24小时制 小写就是12小时制
    NSString * dateStr = [formate stringFromDate:date];
   
    NSLog(@"currentdate:%@",dateStr);
    return dateStr;
    
}

+ (NSString *)getCurrentWeekDay
{
    NSInteger  weekdayNum =  [[NSCalendar currentCalendar] ordinalityOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitWeekOfMonth forDate:[NSDate date]];
    if (weekdayNum == 1) {
        return @"星期日";
    }else if(weekdayNum == 2){
        return @"星期一";
    }else if(weekdayNum == 3){
        return @"星期二";
    }else if(weekdayNum == 4){
        return @"星期三";
    }else if(weekdayNum == 5){
        return @"星期四";
    }else if(weekdayNum == 6){
        return @"星期五";
    }else if(weekdayNum == 7){
        return @"星期六";
    }
    
    return nil;
    
}
@end

