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
#import "MSCTimeTableInputGen.h"

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
    
    NSMutableArray* tables;
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
    format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"dd.MM.yyyy"];
    
    
    tables = [NSMutableArray array];
    for (id input in [MSCTimeTableInputGen generateWithCounterOf:5]) {
        [tables addObject: [createTable createWithInput:input]];
    }
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
    format = nil;
    
    [super tearDown];
}

- (void)testOldViews
{
    STFail(@"todo");
}

- (void)testCurrentViews
{
    viewInput1.title = @"View1";
    viewInput2.title = @"View2";
    
    [viewInput1.tables addObject:tables[0]];
    [viewInput1.tables addObject:tables[1]];
    [viewInput2.tables addObject:tables[0]];
    
    MSCView* v1 = [createView createViewWithInput:viewInput1];
    [createView createViewWithInput:viewInput2];
    
    [updateTable markTimeTable:tables[1] atIndex:0];
    
    [kv setValue:@"current" forKey:@"filter"];
    NSArray* views = [findViews findViews];

    STAssertNotNil(views, @"views should be found");
    STAssertTrue(views.count == 1, @"1 view should be found, got: %ld", views.count);
    STAssertTrue([v1 isEqualTo: views[0]], @"view 1 should be found");
}

- (void)testNewViews
{
    viewInput1.title = @"View1";
    viewInput2.title = @"View2";
    
    [viewInput1.tables addObject:tables[0]];
    [viewInput1.tables addObject:tables[1]];
    [viewInput2.tables addObject:tables[0]];
    
    MSCView* v1 = [createView createViewWithInput:viewInput1];
    MSCView* v2 = [createView createViewWithInput:viewInput2];
    
    [updateTable markTimeTable:tables[1] atIndex:0];
    
    [kv setValue:@"new" forKey:@"filter"];
    NSArray* views = [findViews findViews];
    
    STAssertNotNil(views, @"views should be found");
    STAssertTrue(views.count == 2, @"2 views should be found");
    STAssertTrue([v1 isEqualTo: views[0]], @"view 1 should be found");
    STAssertTrue([v2 isEqualTo: views[1]], @"view 2 should be found");
}

@end
