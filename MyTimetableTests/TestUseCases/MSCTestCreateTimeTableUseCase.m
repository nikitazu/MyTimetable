//
//  MSCTestCreateTimeTableUseCase.m
//  MyTimetable
//
//  Created by Никита Б. Зуев on 20.05.13.
//  Copyright (c) 2013 Никита Б. Зуев. All rights reserved.
//

#import "MSCTestCreateTimeTableUseCase.h"
#import "MSCCreateTimeTableUseCase.h"

@implementation MSCTestCreateTimeTableUseCase
{
    NSDictionary* input;
    MSCCreateTimeTableUseCase* uc;
    MSCTimeTable* result;
    NSDateFormatter* format;
    NSDateFormatter* timeFormat;
}


- (void)setUp
{
    [super setUp];
    
    input = nil;
    result = nil;
    uc = [[MSCCreateTimeTableUseCase alloc] init];
    
    format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"dd.MM.yyyy"];
    
    timeFormat = [[NSDateFormatter alloc] init];
    [timeFormat setDateFormat:@"dd.MM.yyyy-HH:mm"];
}

- (void)tearDown
{
    input = nil;
    result = nil;
    uc = nil;
    
    [super tearDown];
}

- (void)testNillInput
{
    result = [uc createWithInput:nil];
    STAssertNil(result, @"For nil input result should be nil");
}

- (void)testNoTitleInput
{
    input = @{};
    result = [uc createWithInput:input];
    STAssertTrue([result.title isEqualToString: @"MyTable"], @"Title not default");
}

- (void)testTitleInput
{
    input = @{@"title": @"Superb table"};
    result = [uc createWithInput:input];
    STAssertTrue([result.title isEqualToString:@"Superb table"], @"Title not set");
}

- (void)testEveryday
{
    input = @{@"template": @"every",
              @"everyType": @"day",
              @"itemsCount": @3,
              @"startAt": [format dateFromString:@"10.10.2010"]};
    
    result = [uc createWithInput:input];
    
    STAssertNotNil(result, @"Created timetable should not be nil");
    STAssertTrue(result.items.count == 3, @"3 items should be created");
    for (MSCTimeTableItem* item in result.items) {
        STAssertNotNil(item.values, @"items values should be initialized");
        STAssertTrue(item.values.count == 1,
                     @"everyday without perItemCount items should have single value");
        STAssertNotNil(item.at, @"items at date/time should be initialized");
    }
    
    MSCTimeTableItem* dayOne = result.items[0];
    MSCTimeTableItem* dayTwo = result.items[1];
    MSCTimeTableItem* dayTre = result.items[2];
    
    NSDate* dateOne = [format dateFromString:@"10.10.2010"];
    NSDate* dateTwo = [format dateFromString:@"11.10.2010"];
    NSDate* dateTre = [format dateFromString:@"12.10.2010"];
    
    STAssertTrue(dayOne.at == dateOne, @"Day one should start at 10.10.2010");
    STAssertTrue(dayTwo.at == dateTwo, @"Day two should start at 11.10.2010");
    STAssertTrue(dayTre.at == dateTre, @"Day three should start at 12.10.2010");
}

- (void)testEverydayNoItemsCount
{
    input = @{@"template": @"every",
              @"everyType": @"day",};
    
    result = [uc createWithInput:input];
    STAssertTrue(result.items.count == 0, @"no items should be created without itemsCount");
}

- (void)testEverydayNoStartAt
{
    input = @{@"template": @"every",
              @"everyType": @"day",
              @"itemsCount": @3};
    
    result = [uc createWithInput:input];
    STAssertTrue(result.items.count == 0, @"no items should be created without startAt");
}

- (void)testEvery2ndDay
{
    input = @{@"template": @"every",
              @"everyType": @"day",
              @"itemsCount": @4,
              @"startAt": [format dateFromString:@"10.10.2010"],
              @"everyNth": @2};
    
    result = [uc createWithInput:input];
    
    STAssertNotNil(result, @"Created timetable should not be nil");
    STAssertTrue(result.items.count == 4, @"4 items should be created");
    for (MSCTimeTableItem* item in result.items) {
        STAssertNotNil(item.values, @"items values should be initialized");
        STAssertTrue(item.values.count == 1,
                     @"everyday without perItemCount items should have single value");
        STAssertNotNil(item.at, @"items at date/time should be initialized");
    }
    
    MSCTimeTableItem* day1 = result.items[0];
    MSCTimeTableItem* day2 = result.items[1];
    MSCTimeTableItem* day3 = result.items[2];
    MSCTimeTableItem* day4 = result.items[3];
    
    NSDate* date1 = [format dateFromString:@"10.10.2010"];
    NSDate* date2 = [format dateFromString:@"12.10.2010"];
    NSDate* date3 = [format dateFromString:@"14.10.2010"];
    NSDate* date4 = [format dateFromString:@"16.10.2010"];
    
    STAssertTrue(day1.at == date1, @"Day 1 should start at 10.10.2010");
    STAssertTrue(day2.at == date2, @"Day 2 should start at 12.10.2010");
    STAssertTrue(day3.at == date3, @"Day 3 should start at 14.10.2010");
    STAssertTrue(day4.at == date4, @"Day 4 should start at 16.10.2010");
}

- (void)testEveryNegativeDay
{
    input = @{@"template": @"every",
              @"everyType": @"day",
              @"itemsCount": @2,
              @"startAt": [format dateFromString:@"10.10.2010"],
              @"everyNth": @-1}; // <--  <=0 should reset to 1
    
    result = [uc createWithInput:input];
    
    STAssertNotNil(result, @"Created timetable should not be nil");
    STAssertTrue(result.items.count == 2, @"2 items should be created");
    for (MSCTimeTableItem* item in result.items) {
        STAssertNotNil(item.values, @"items values should be initialized");
        STAssertTrue(item.values.count == 1,
                     @"everyday without perItemCount items should have single value");
        STAssertNotNil(item.at, @"items at date/time should be initialized");
    }
    
    MSCTimeTableItem* day1 = result.items[0];
    MSCTimeTableItem* day2 = result.items[1];
    
    NSDate* date1 = [format dateFromString:@"10.10.2010"];
    NSDate* date2 = [format dateFromString:@"11.10.2010"];
    
    STAssertTrue(day1.at == date1, @"Day 1 should start at 10.10.2010");
    STAssertTrue(day2.at == date2, @"Day 2 should start at 11.10.2010");
}

- (void)testEveryWeek
{
    input = @{@"template": @"every",
              @"everyType": @"week",
              @"itemsCount": @3,
              @"startAt": [format dateFromString:@"10.10.2010"]};
    
    result = [uc createWithInput:input];
    
    MSCTimeTableItem* day1 = result.items[0];
    MSCTimeTableItem* day2 = result.items[1];
    MSCTimeTableItem* day3 = result.items[2];
    
    NSDate* date1 = [format dateFromString:@"10.10.2010"];
    NSDate* date2 = [format dateFromString:@"17.10.2010"];
    NSDate* date3 = [format dateFromString:@"24.10.2010"];
    
    STAssertTrue(day1.at == date1, @"Week 1 should start at 10.10.2010");
    STAssertTrue(day2.at == date2, @"Week 2 should start at 17.10.2010");
    STAssertTrue(day3.at == date3, @"Week 3 should start at 24.10.2010");
}

- (void)testEveryMonth
{
    input = @{@"template": @"every",
              @"everyType": @"month",
              @"itemsCount": @4,
              @"startAt": [format dateFromString:@"10.10.2010"]};
    
    result = [uc createWithInput:input];
    
    MSCTimeTableItem* day1 = result.items[0];
    MSCTimeTableItem* day2 = result.items[1];
    MSCTimeTableItem* day3 = result.items[2];
    MSCTimeTableItem* day4 = result.items[3];
    
    NSDate* date1 = [format dateFromString:@"10.10.2010"];
    NSDate* date2 = [format dateFromString:@"10.11.2010"];
    NSDate* date3 = [format dateFromString:@"10.12.2010"];
    NSDate* date4 = [format dateFromString:@"10.01.2011"];
    
    STAssertTrue(day1.at == date1, @"Month 1 should start at 10.10.2010");
    STAssertTrue(day2.at == date2, @"Month 2 should start at 10.11.2010");
    STAssertTrue(day3.at == date3, @"Month 3 should start at 10.12.2010");
    STAssertTrue(day4.at == date4, @"Month 4 should start at 10.01.2011");
}

- (void)testEveryYear
{
    input = @{@"template": @"every",
              @"everyType": @"year",
              @"itemsCount": @2,
              @"startAt": [format dateFromString:@"10.10.2010"]};
    
    result = [uc createWithInput:input];
    
    MSCTimeTableItem* day1 = result.items[0];
    MSCTimeTableItem* day2 = result.items[1];
    
    NSDate* date1 = [format dateFromString:@"10.10.2010"];
    NSDate* date2 = [format dateFromString:@"10.10.2011"];
    
    STAssertTrue(day1.at == date1, @"Year 1 should start at 10.10.2010");
    STAssertTrue(day2.at == date2, @"Year 2 should start at 10.10.2011");
}

- (void)testAtWeekends
{
    input = @{@"template": @"every",
              @"everyType": @"week",
              @"itemsCount": @3,
              @"startAt": [format dateFromString:@"02.10.2010"], // saturday
              @"valuesCount": @2,
              @"valuesStartAt": @[[format dateFromString:@"02.10.2010"],   // saturday
                                  [format dateFromString:@"03.10.2010"]]}; // sunday
    
    result = [uc createWithInput:input];
    
    MSCTimeTableItem* week1 = result.items[0];
    MSCTimeTableItem* week2 = result.items[1];
    MSCTimeTableItem* week3 = result.items[2];
    
    STAssertTrue(week1.values.count == 2, @"2 weekends should be created at week 1");
    STAssertTrue(week2.values.count == 2, @"2 weekends should be created at week 2");
    STAssertTrue(week3.values.count == 2, @"2 weekends should be created at week 3");
    
    MSCTimeTableValue* week1day1 = week1.values[0];
    MSCTimeTableValue* week1day2 = week1.values[1];
    
    MSCTimeTableValue* week2day1 = week2.values[0];
    MSCTimeTableValue* week2day2 = week2.values[1];
    
    MSCTimeTableValue* week3day1 = week3.values[0];
    MSCTimeTableValue* week3day2 = week3.values[1];
    
    STAssertTrue([[format stringFromDate:week1day1.at] isEqualToString:@"02.10.2010"],
                 @"week 1 day 1 should be 02.10.2010");
    STAssertTrue([[format stringFromDate:week1day2.at] isEqualToString:@"03.10.2010"],
                 @"week 1 day 2 should be 03.10.2010");
    
    STAssertTrue([[format stringFromDate:week2day1.at] isEqualToString:@"09.10.2010"],
                 @"week 2 day 1 should be 09.10.2010");
    STAssertTrue([[format stringFromDate:week2day2.at] isEqualToString:@"10.10.2010"],
                 @"week 2 day 2 should be 10.10.2010");
    
    STAssertTrue([[format stringFromDate:week3day1.at] isEqualToString:@"16.10.2010"],
                 @"week 3 day 1 should be 16.10.2010");
    STAssertTrue([[format stringFromDate:week3day2.at] isEqualToString:@"17.10.2010"],
                 @"week 3 day 2 should be 17.10.2010");
}

- (void)testEverydayAtCertainTime
{
    input = @{@"template": @"every",
              @"everyType": @"day",
              @"itemsCount": @3,
              @"startAt": [timeFormat dateFromString:@"10.10.2010-11:30"]};
    
    result = [uc createWithInput:input];
    
    MSCTimeTableItem* dayOne = result.items[0];
    MSCTimeTableItem* dayTwo = result.items[1];
    MSCTimeTableItem* dayTre = result.items[2];
    
    NSString* dateOne = [timeFormat stringFromDate:dayOne.at];
    NSString* dateTwo = [timeFormat stringFromDate:dayTwo.at];
    NSString* dateTre = [timeFormat stringFromDate:dayTre.at];
    
    STAssertTrue([dateOne isEqualToString:@"10.10.2010-11:30"],
                 @"Day one should start at 10.10.2010-11:30");
    
    STAssertTrue([dateTwo isEqualToString:@"11.10.2010-11:30"],
                 @"Day two should start at 11.10.2010-11:30");
    
    STAssertTrue([dateTre isEqualToString:@"12.10.2010-11:30"],
                 @"Day three should start at 12.10.2010-11:30");
}

- (void)testEverydayXtimesPerDay
{
    input = @{@"template": @"every",
              @"everyType": @"day",
              @"itemsCount": @3,
              @"valuesCount": @2,
              @"startAt": [format dateFromString:@"10.10.2010"]};
    
    result = [uc createWithInput:input];
    
    MSCTimeTableItem* dayOne = result.items[0];
    MSCTimeTableItem* dayTwo = result.items[1];
    MSCTimeTableItem* dayTre = result.items[2];
    
    STAssertNotNil(dayOne.values, @"day 1 values should not be nil");
    STAssertNotNil(dayTwo.values, @"day 2 values should not be nil");
    STAssertNotNil(dayTre.values, @"day 3 values should not be nil");
    
    STAssertTrue(dayOne.values.count == 2, @"day 1 values count should be 2");
    STAssertTrue(dayTwo.values.count == 2, @"day 2 values count should be 2");
    STAssertTrue(dayTre.values.count == 2, @"day 3 values count should be 2");
    
    for(MSCTimeTableItem* item in result.items) {
        for (MSCTimeTableValue* value in item.values) {
            STAssertNil(value.at, @"value at should be nil");
        }
    }
}


- (void)testEveryXdayYtimesPerDayAtCertainTime
{
    input = @{@"template": @"every",
              @"everyType": @"day",
              @"itemsCount": @3,
              @"startAt": [format dateFromString:@"10.10.2010"],
              @"everyNth": @2,
              @"valuesCount": @2,
              @"valuesStartAt": @[[timeFormat dateFromString:@"10.10.2010-10:00"],
                                  [timeFormat dateFromString:@"10.10.2010-15:00"]]};
    
    result = [uc createWithInput:input];
    
    MSCTimeTableItem* dayOne = result.items[0];
    MSCTimeTableItem* dayTwo = result.items[1];
    MSCTimeTableItem* dayTre = result.items[2];
    
    STAssertNotNil(dayOne.values, @"day 1 values should not be nil");
    STAssertNotNil(dayTwo.values, @"day 2 values should not be nil");
    STAssertNotNil(dayTre.values, @"day 3 values should not be nil");
    
    STAssertTrue(dayOne.values.count == 2, @"day 1 values count should be 2");
    STAssertTrue(dayTwo.values.count == 2, @"day 2 values count should be 2");
    STAssertTrue(dayTre.values.count == 2, @"day 3 values count should be 2");
    
    MSCTimeTableValue* d1v1 = dayOne.values[0];
    MSCTimeTableValue* d1v2 = dayOne.values[1];
    MSCTimeTableValue* d2v1 = dayTwo.values[0];
    MSCTimeTableValue* d2v2 = dayTwo.values[1];
    MSCTimeTableValue* d3v1 = dayTre.values[0];
    MSCTimeTableValue* d3v2 = dayTre.values[1];
    
    NSString* d1v1s = [timeFormat stringFromDate:d1v1.at];
    NSString* d1v2s = [timeFormat stringFromDate:d1v2.at];
    NSString* d2v1s = [timeFormat stringFromDate:d2v1.at];
    NSString* d2v2s = [timeFormat stringFromDate:d2v2.at];
    NSString* d3v1s = [timeFormat stringFromDate:d3v1.at];
    NSString* d3v2s = [timeFormat stringFromDate:d3v2.at];
    
    STAssertTrue([d1v1s isEqualToString:@"10.10.2010-10:00"],
                 @"Day one v1 should start at 10.10.2010-10:00");
    
    STAssertTrue([d1v2s isEqualToString:@"10.10.2010-15:00"],
                 @"Day one v2 should start at 10.10.2010-15:00");
    
    
    STAssertTrue([d2v1s isEqualToString:@"12.10.2010-10:00"],
                 @"Day one v1 should start at 10.10.2010-10:00");
    
    STAssertTrue([d2v2s isEqualToString:@"12.10.2010-15:00"],
                 @"Day one v2 should start at 10.10.2010-15:00");
    
    
    STAssertTrue([d3v1s isEqualToString:@"14.10.2010-10:00"],
                 @"Day one v1 should start at 10.10.2010-10:00");
    
    STAssertTrue([d3v2s isEqualToString:@"14.10.2010-15:00"],
                 @"Day one v2 should start at 10.10.2010-15:00");
}

@end
