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
    
    for (id item in result.items) {
        STAssertTrue([item isKindOfClass: [MSCTimeTableItem class]],
                     @"Item should be MSCTimeTableItem");
        
        STAssertFalse([item done], @"items should be undone at init");
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
    STAssertTrue(result.items.count == 0, @"not items should be created");
}

- (void)testEveryOddDay
{
    STFail(@"todo");
}

- (void)testEveryWeek
{
    STFail(@"todo");
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
