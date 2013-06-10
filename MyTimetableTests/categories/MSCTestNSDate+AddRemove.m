//
//  MSCTestNSDate+AddRemove.m
//  MyTimetable
//
//  Created by Никита Б. Зуев on 25.05.13.
//  Copyright (c) 2013 Никита Б. Зуев. All rights reserved.
//

#import "NSDate+AddRemove.h"
#import <SenTestingKit/SenTestingKit.h>

@interface MSCTestNSDate_AddRemove : SenTestCase

@end


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
    
    STAssertTrue([[format stringFromDate: nextDay] isEqualToString:@"11.10.2010"],
                 @"Next day should be 11.10.2010");
}

- (void)testDateByAddingWeeks
{
    NSDate* nextWeek = [today dateByAddingWeeks:1];
    
    STAssertTrue([[format stringFromDate: nextWeek] isEqualToString:@"17.10.2010"],
                 @"Next week should be 17.10.2010");
}

- (void)testDateByAddingMonths
{
    NSDate* nextMonth = [today dateByAddingMonths:1];
    NSDate* next2ndMonth = [today dateByAddingMonths:2];
    NSDate* next3rdMonth = [today dateByAddingMonths:3];
    
    STAssertTrue([[format stringFromDate: nextMonth] isEqualToString:@"10.11.2010"],
                 @"Next month should be 10.11.2010");
    
    STAssertTrue([[format stringFromDate: next2ndMonth] isEqualToString:@"10.12.2010"],
                 @"2nd next month should be 10.12.2010");
    
    STAssertTrue([[format stringFromDate: next3rdMonth] isEqualToString:@"10.01.2011"],
                 @"3rd next month should be 10.01.2011");
}

- (void)testDateByAddingYears
{
    NSDate* nextYear = [today dateByAddingYears:1];
    
    STAssertTrue([[format stringFromDate: nextYear] isEqualToString:@"10.10.2011"],
                 @"Next year should be 10.10.2011");
}

- (void) testDateByAddingComponents
{
    NSDateComponents* components = [[NSDateComponents alloc] init];
    [components setDay:5];
    
    NSDate* nextDate = [today dateByAddingComponents:components];
    
    STAssertTrue([[format stringFromDate:nextDate] isEqualToString:@"15.10.2010"],
                 @"Next date should be 15.10.2010");
}

- (void)testTomorrow
{
    NSDate* tomorrow = [today tomorrow];
    STAssertTrue([[format stringFromDate: tomorrow] isEqualToString:@"11.10.2010"],
                 @"For 10.10.2010 tomorrow should be 11.10.2010");
}

@end
