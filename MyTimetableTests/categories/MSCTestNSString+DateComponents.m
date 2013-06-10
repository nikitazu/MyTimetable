//
//  MSCTestNSString+DateComponents.m
//  MyTimetable
//
//  Created by Никита Б. Зуев on 26.05.13.
//  Copyright (c) 2013 Никита Б. Зуев. All rights reserved.
//

#import "NSString+DateComponents.h"
#import <SenTestingKit/SenTestingKit.h>

@interface MSCTestNSString_DateComponents : SenTestCase

@end

@implementation MSCTestNSString_DateComponents

- (void)testDayDateComponentsWithAmount
{
    NSDateComponents* dc = [@"day" dateComponentsWithAmount:1];
    STAssertTrue(dc.day == 1, @"day should be 1");
}

- (void)testWeekDateComponentsWithAmount
{
    NSDateComponents* dc = [@"week" dateComponentsWithAmount:1];
    STAssertTrue(dc.week == 1, @"week should be 1");
}

- (void)testMonthDateComponentsWithAmount
{
    NSDateComponents* dc = [@"month" dateComponentsWithAmount:1];
    STAssertTrue(dc.month == 1, @"month should be 1");
}

- (void)testYearDateComponentsWithAmount
{
    NSDateComponents* dc = [@"year" dateComponentsWithAmount:1];
    STAssertTrue(dc.year == 1, @"year should be 1");
}
@end
