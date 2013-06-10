//
//  MSCTestView.m
//  MyTimetable
//
//  Created by Никита Б. Зуев on 10.06.13.
//  Copyright (c) 2013 Никита Б. Зуев. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "MSCView.h"
#import "MSCTimeTable.h"
#import "MSCTimeTableItem.h"

@interface MSCTestView : SenTestCase

@end


@implementation MSCTestView
{
    MSCView* view;
    MSCTimeTable* table;
    MSCTimeTableItem* item1;
    MSCTimeTableItem* item2;
}


- (void)setUp
{
    [super setUp];
    view = [[MSCView alloc] init];
    table = [[MSCTimeTable alloc] init];
    item1 = [[MSCTimeTableItem alloc] initWithOneValueAt:[NSDate date]];
    item2 = [[MSCTimeTableItem alloc] initWithOneValueAt:[NSDate date]];
}

- (void)tearDown
{
    view = nil;
    table = nil;
    item1 = nil;
    item2 = nil;
    [super tearDown];
}

- (void)testDefaultValues
{
    STAssertNotNil(view.tables, @"tables dictionary should be initialized");
    STAssertNotNil(view.title, @"title should be provided default value");
}

- (void)testCurrent
{
    STAssertFalse(view.current, @"view without tables should not be current");
    
    [view.tables setObject:table forKey:@"foo"];
    STAssertFalse(view.current, @"view with not started tables should not be current");
    
    table.items = @[item1, item2];
    [item1 setAllDone];
    
    STAssertTrue(view.current, @"view with started tables should be current");
}

- (void)testIsNew
{
    STAssertTrue(view.isNew, @"view is new without tables");
    
    [view.tables setObject:table forKey:@"foo"];
    STAssertTrue(view.isNew, @"view is new with tables not started");
    
    table.items = @[item1, item2];
    STAssertTrue(view.isNew, @"view is new with tables with items not started");
    
    [item1 setAllDone];
    STAssertFalse(view.isNew, @"view is not new with tables started");
}

@end
