//
//  MSCTestTimeTable.m
//  MyTimetable
//
//  Created by Никита Б. Зуев on 10.06.13.
//  Copyright (c) 2013 Никита Б. Зуев. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "MSCTimeTable.h"
#import "MSCTimeTableItem.h"

@interface MSCTestTimeTable : SenTestCase

@end


@implementation MSCTestTimeTable
{
    MSCTimeTable* table;
    MSCTimeTableItem* item1;
    MSCTimeTableItem* item2;
}

- (void)setUp
{
    [super setUp];
    table = [[MSCTimeTable alloc] init];
    item1 = [[MSCTimeTableItem alloc] initWithOneValueAt:[NSDate date]];
    item2 = [[MSCTimeTableItem alloc] initWithOneValueAt:[NSDate date]];
}

- (void)tearDown
{
    table = nil;
    item1 = nil;
    item2 = nil;
    [super tearDown];
}

- (void)testDone
{
    STAssertFalse(table.done, @"table should not be done without done items");
    
    table.items = @[item1, item2];
    STAssertFalse(table.done, @"table with undone items should not be done");
    
    [item1 setAllDone];
    STAssertFalse(table.done, @"table with not all done items should not be done");
    
    [item2 setAllDone];
    STAssertTrue(table.done, @"table with all items done should be done");
}

- (void)testStarted
{
    STAssertFalse(table.started, @"table without items should not be started");
    
    table.items = @[item1, item2];
    STAssertFalse(table.started, @"until atleast one items is started table is not started");
    
    [item1 setAllDone];
    STAssertTrue(table.started, @"table should be started");
}

@end
