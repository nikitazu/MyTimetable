//
//  MSCTestCreateViewUseCase.m
//  MyTimetable
//
//  Created by Никита Б. Зуев on 07.06.13.
//  Copyright (c) 2013 Никита Б. Зуев. All rights reserved.
//

#import "MSCTestCreateViewUseCase.h"
#import "MSCCreateViewUseCase.h"
#import "MSCCreateTimeTableUseCase.h"
#import "Context.h"

@implementation MSCTestCreateViewUseCase
{
    MSCCreateViewUseCase* createView;
    MSCViewInput* viewInput;
    
    MSCCreateTimeTableUseCase* createTable;
    MSCTimeTableInput* tableInput1;
    MSCTimeTableInput* tableInput2;
    
    NSDateFormatter* format;
}

- (void)setUp
{
    [super setUp];
    [[Context singleton] reset];
    createView = [[MSCCreateViewUseCase alloc] init];
    viewInput = [[MSCViewInput alloc] init];
    createTable = [[MSCCreateTimeTableUseCase alloc] init];
    tableInput1 = [[MSCTimeTableInput alloc] init];
    tableInput2 = [[MSCTimeTableInput alloc] init];
    format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"dd.MM.yyyy"];
}

- (void)tearDown
{
    createView = nil;
    createTable = nil;
    tableInput1 = nil;
    tableInput2 = nil;
    format = nil;
    
    [super tearDown];
}

- (void)testCreateViewWithInput
{
    tableInput1.title = @"Table1";
    tableInput2.title = @"Table2";
    
    MSCTimeTable* t1 = [createTable createWithInput:tableInput1];
    MSCTimeTable* t2 = [createTable createWithInput:tableInput2];
    
    [viewInput.tables addObject:t1];
    [viewInput.tables addObject:t2];
    
    MSCView* view = [createView createViewWithInput:viewInput];
    
    STAssertNotNil(view, @"view should not be nil");
    STAssertTrue([view.title isEqualToString:@"MyView"],
                 @"view title should be MyView");
    
    STAssertNotNil(view.tables, @"view tables collection should be initialized");
    STAssertTrue(view.tables.count == 2, @"view tables count should be 2");
}

@end
