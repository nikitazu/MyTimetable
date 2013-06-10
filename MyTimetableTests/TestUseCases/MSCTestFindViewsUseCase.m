//
//  MSCTestFindViewsUseCase.m
//  MyTimetable
//
//  Created by Никита Б. Зуев on 07.06.13.
//  Copyright (c) 2013 Никита Б. Зуев. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "MSCFindViewsUseCase.h"
#import "MSCCreateTimeTableUseCase.h"
#import "MSCCreateViewUseCase.h"
#import "MSCUpdateTimeTableUseCase.h"
#import "MSCKeyValueUseCase.h"
#import "Context.h"

@interface MSCTestFindViewsUseCase : SenTestCase

@end

@implementation MSCTestFindViewsUseCase
{
    MSCFindViewsUseCase* findViews;
    
    MSCCreateViewUseCase* createView;
    MSCViewInput* viewInput1;
    MSCViewInput* viewInput2;
    
    MSCCreateTimeTableUseCase* createTable;
    MSCUpdateTimeTableUseCase* updateTable;
    MSCTimeTableInput* tableInput1;
    MSCTimeTableInput* tableInput2;
    
    MSCKeyValueUseCase* kv;
    
    NSDateFormatter* format;
}

- (void)setUp
{
    [super setUp];
    [[Context singleton] reset];
    kv = [[MSCKeyValueUseCase alloc]init];
    findViews = [[MSCFindViewsUseCase alloc] init];
    createView = [[MSCCreateViewUseCase alloc] init];
    viewInput1 = [[MSCViewInput alloc] init];
    viewInput2 = [[MSCViewInput alloc] init];
    createTable = [[MSCCreateTimeTableUseCase alloc] init];
    updateTable = [[MSCUpdateTimeTableUseCase alloc] init];
    tableInput1 = [[MSCTimeTableInput alloc] init];
    tableInput2 = [[MSCTimeTableInput alloc] init];
    format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"dd.MM.yyyy"];
}

- (void)tearDown
{
    kv = nil;
    findViews = nil;
    createView = nil;
    viewInput1 = nil;
    viewInput2 = nil;
    createTable = nil;
    updateTable = nil;
    tableInput1 = nil;
    tableInput2 = nil;
    format = nil;
    
    [super tearDown];
}

- (void)testOldViews
{
    STFail(@"todo");
}

- (void)testCurrentViews
{
    tableInput1.title = @"Table1";
    tableInput1.startAt = [NSDate date];
    tableInput1.itemsCount = 2;
    tableInput2.title = @"Table2";
    tableInput2.itemsCount = 2;
    tableInput2.startAt = [NSDate date];
    viewInput1.title = @"View1";
    viewInput2.title = @"View2";
    
    MSCTimeTable* t1 = [createTable createWithInput:tableInput1];
    MSCTimeTable* t2 = [createTable createWithInput:tableInput2];
    
    [viewInput1.tables addObject:t1];
    [viewInput1.tables addObject:t2];
    [viewInput2.tables addObject:t1];
    
    MSCView* v1 = [createView createViewWithInput:viewInput1];
    [createView createViewWithInput:viewInput2];
    
    [updateTable markTimeTable:t2 atIndex:0];
    
    [kv setValue:@"current" forKey:@"filter"];
    NSArray* views = [findViews findViews];

    STAssertNotNil(views, @"views should be found");
    STAssertTrue(views.count == 1, @"1 view should be found, got: %ld", views.count);
    STAssertTrue([v1 isEqualTo: views[0]], @"view 1 should be found");
}

- (void)testNewViews
{
    tableInput1.title = @"Table1";
    tableInput1.startAt = [NSDate date];
    tableInput1.itemsCount = 2;
    tableInput2.title = @"Table2";
    tableInput2.itemsCount = 2;
    tableInput2.startAt = [NSDate date];
    viewInput1.title = @"View1";
    viewInput2.title = @"View2";
    
    MSCTimeTable* t1 = [createTable createWithInput:tableInput1];
    MSCTimeTable* t2 = [createTable createWithInput:tableInput2];
    
    [viewInput1.tables addObject:t1];
    [viewInput1.tables addObject:t2];
    [viewInput2.tables addObject:t1];
    
    MSCView* v1 = [createView createViewWithInput:viewInput1];
    MSCView* v2 = [createView createViewWithInput:viewInput2];
    
    [updateTable markTimeTable:t2 atIndex:0];
    
    [kv setValue:@"new" forKey:@"filter"];
    NSArray* views = [findViews findViews];
    
    STAssertNotNil(views, @"views should be found");
    STAssertTrue(views.count == 2, @"2 views should be found");
    STAssertTrue([v1 isEqualTo: views[0]], @"view 1 should be found");
    STAssertTrue([v2 isEqualTo: views[1]], @"view 2 should be found");
}

@end
