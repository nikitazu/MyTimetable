//
//  MSCTestNSDate+AddRemove.m
//  MyTimetable
//
//  Created by Никита Б. Зуев on 25.05.13.
//  Copyright (c) 2013 Никита Б. Зуев. All rights reserved.
//

#import "MSCTestNSDate+AddRemove.h"
#import "NSDate+AddRemove.h"

@implementation MSCTestNSDate_AddRemove
{
    NSDateFormatter* format;
    NSDate* today;
}

- (void)setUp
{
    format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"dd.MM.yyyy"];
    today = [format dateFromString:@"10.10.2010"];
    [super setUp];
}

- (void)testDateByAddingDays
{
    NSDate* nextDay = [today dateByAddingDays:1];
    NSDate* nextWeek = [today dateByAddingDays:7];
    NSDate* nextMonth = [today dateByAddingDays:31];
    NSDate* nextYear = [today dateByAddingDays:365];
    
    STAssertTrue([[format stringFromDate: nextDay] isEqualToString:@"11.10.2010"],
                 @"Next day should be 11.10.2010");
    
    STAssertTrue([[format stringFromDate: nextWeek] isEqualToString:@"17.10.2010"],
                 @"Next week should be 17.10.2010");
    
    STAssertTrue([[format stringFromDate: nextMonth] isEqualToString:@"10.11.2010"],
                 @"Next month should be 10.11.2010");
    
    STAssertTrue([[format stringFromDate: nextYear] isEqualToString:@"10.10.2011"],
                 @"Next year should be 10.10.2011");
}

- (void)testTomorrow
{
    NSDate* tomorrow = [today tomorrow];
    STAssertTrue([[format stringFromDate: tomorrow] isEqualToString:@"11.10.2010"],
                 @"For 10.10.2010 tomorrow should be 11.10.2010");
}

@end
