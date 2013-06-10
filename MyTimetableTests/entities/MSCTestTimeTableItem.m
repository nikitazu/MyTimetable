//
//  MSCTestTimeTableItem.m
//  MyTimetable
//
//  Created by Никита Б. Зуев on 29.05.13.
//  Copyright (c) 2013 Никита Б. Зуев. All rights reserved.
//

#import "MSCTimeTableItem.h"
#import "MSCTimeTableValue.h"
#import <SenTestingKit/SenTestingKit.h>

@interface MSCTestTimeTableItem : SenTestCase

@end

@implementation MSCTestTimeTableItem
{
    NSDateFormatter* format;
}

- (void)setUp
{
    format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"dd.MM.yyyy"];
    [super setUp];
}

- (void)testInitWithOneItemAt
{
    MSCTimeTableItem* item = [[MSCTimeTableItem alloc] initWithOneValueAt:
                              [format dateFromString:@"10.10.2010"]];
    
    STAssertNotNil(item, @"constructor should create item");
    STAssertTrue([[format stringFromDate: item.at] isEqualToString: @"10.10.2010"],
                 @"at should be properly initialized");
    STAssertNotNil(item.values, @"values should be initialized");
    STAssertTrue(item.values.count == 1, @"item shoud have one value");
    
    MSCTimeTableValue* value = item.values[0];
    STAssertTrue(value.at == item.at,
                 @"value at should equal to its items at");
}

- (void)testInitAt
{
    MSCTimeTableItem* item = [[MSCTimeTableItem alloc] initAt:
                              [format dateFromString:@"10.10.2010"]];
    
    STAssertNotNil(item, @"constructor should create item");
    STAssertTrue([[format stringFromDate: item.at] isEqualToString: @"10.10.2010"],
                 @"at should be properly initialized");
    STAssertNil(item.values, @"values should not be initialized");
}

- (void)testSetAllDone
{
    MSCTimeTableItem* item = [[MSCTimeTableItem alloc] init];
    MSCTimeTableValue* v1 = [[MSCTimeTableValue alloc] init];
    MSCTimeTableValue* v2 = [[MSCTimeTableValue alloc] init];
    MSCTimeTableValue* v3 = [[MSCTimeTableValue alloc] init];
    item.values = @[v1, v2, v3];
    [item setAllDone];
    
    STAssertTrue(v1.done, @"v1 should be done");
    STAssertTrue(v2.done, @"v2 should be done");
    STAssertTrue(v3.done, @"v3 should be done");
    STAssertTrue(item.done, @"item should be done");
}

- (void)testSetAllUndone
{
    MSCTimeTableItem* item = [[MSCTimeTableItem alloc] init];
    MSCTimeTableValue* v1 = [[MSCTimeTableValue alloc] init];
    MSCTimeTableValue* v2 = [[MSCTimeTableValue alloc] init];
    MSCTimeTableValue* v3 = [[MSCTimeTableValue alloc] init];
    v1.done = YES;
    v2.done = YES;
    v3.done = YES;
    item.values = @[v1, v2, v3];
    [item setAllUndone];
    
    STAssertFalse(v1.done, @"v1 should be undone");
    STAssertFalse(v2.done, @"v2 should be undone");
    STAssertFalse(v3.done, @"v3 should be undone");
    STAssertFalse(item.done, @"item should be undone");
}

- (void)testStarted
{
    MSCTimeTableItem* item = [[MSCTimeTableItem alloc] init];
    MSCTimeTableValue* v1 = [[MSCTimeTableValue alloc] init];
    MSCTimeTableValue* v2 = [[MSCTimeTableValue alloc] init];
    MSCTimeTableValue* v3 = [[MSCTimeTableValue alloc] init];
    item.values = @[v1, v2, v3];
    STAssertFalse(item.started, @"item should not be started now");
    v1.done = YES;
    STAssertTrue(item.started, @"item should be started now");
}

@end
