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
        STAssertFalse(item.done, @"items should be undone at init");
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
        STAssertFalse(item.done, @"items should be undone at init");
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
        STAssertFalse(item.done, @"items should be undone at init");
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
    STFail(@"todo");
}

- (void)testAtWorkdays
{
    STFail(@"todo");
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
    STFail(@"todo");
}

- (void)testEveryXdayYtimesPerDay
{
    STFail(@"todo");
}

- (void)testEveryXdayYtimesPerDayAtCertainTime
{
    STFail(@"todo");
}

@end
