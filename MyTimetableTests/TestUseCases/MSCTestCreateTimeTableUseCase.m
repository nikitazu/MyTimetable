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
}


- (void)setUp
{
    [super setUp];
    
    input = nil;
    result = nil;
    uc = [[MSCCreateTimeTableUseCase alloc] init];
    format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"dd.MM.yyyy"];
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
    input = @{@"template": @"everyday",
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
    input = @{@"template": @"everyday"};
    
    result = [uc createWithInput:input];
    STAssertTrue(result.items.count == 0, @"no items should be created without itemsCount");
}

- (void)testEverydayNoStartAt
{
    input = @{@"template": @"everyday",
              @"itemsCount": @3};
    
    result = [uc createWithInput:input];
    STAssertTrue(result.items.count == 0, @"no items should be created without startAt");
}

- (void)testEvery2ndDay
{
    input = @{@"template": @"everyday",
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
    input = @{@"template": @"everyday",
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
    input = @{@"template": @"everyday",
              @"itemsCount": @3,
              @"startAt": [format dateFromString:@"10.10.2010"],
              @"everyNth": @7};
    
    result = [uc createWithInput:input];
    
    STAssertNotNil(result, @"Created timetable should not be nil");
    STAssertTrue(result.items.count == 3, @"3 items should be created");
    for (MSCTimeTableItem* item in result.items) {
        STAssertFalse(item.done, @"items should be undone at init");
        STAssertNotNil(item.at, @"items at date/time should be initialized");
    }
    
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
    STFail(@"todo");
}

- (void)testEveryYear
{
    STFail(@"todo");
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
    STFail(@"todo");
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
