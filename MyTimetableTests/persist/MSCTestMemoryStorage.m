//
//  MSCTestMemoryStorage.m
//  MyTimetable
//
//  Created by Никита Б. Зуев on 06.06.13.
//  Copyright (c) 2013 Никита Б. Зуев. All rights reserved.
//

#import "MSCTestMemoryStorage.h"
#import "MSCCreateTimeTableUseCase.h"
#import "MSCMemoryStorage.h"
#import "MSCStorage.h"

@implementation MSCTestMemoryStorage
{
    id<MSCStorage> storage;
    MSCCreateTimeTableUseCase* uc;
    MSCTimeTableInput* input;
}

- (void)setUp
{
    [super setUp];
    storage = [[MSCMemoryStorage alloc] init];
    uc = [[MSCCreateTimeTableUseCase alloc] init];
    input = [[MSCTimeTableInput alloc] init];
    input.title = @"Hello";
    input.templateType = @"every";
    input.everyType = @"day";
    input.itemsCount = 5;
}

- (void)tearDown
{
    storage = nil;
    uc = nil;
    [super tearDown];
}

- (void)testAddTo
{
    MSCTimeTable* table = [uc createWithInput:input];
    [storage add: table to: @"new"];
    MSCTimeTable* addedTable = [storage find:table.title in:@"new"];
    
    STAssertNotNil(addedTable, @"added table should not be nil");
    STAssertTrue([table isEqualTo: addedTable], @"added table should be same as created");
}

- (void)testRemoveFrom
{
    MSCTimeTable* table = [uc createWithInput:input];
    [storage add: table to: @"new"];
    [storage remove: table.storageName from: @"new"];
    MSCTimeTable* addedTable = [storage find:table.title in:@"new"];
    
    STAssertNil(addedTable, @"added table should be nil, because it is removed");
}

- (void)testMoveFromTo
{
    MSCTimeTable* table = [uc createWithInput:input];
    [storage add: table to: @"new"];
    [storage move: table.storageName from: @"new" to: @"old"];
    
    MSCTimeTable* addedTable = [storage find:table.title in:@"old"];
    
    STAssertNotNil(addedTable, @"added table should not be nil");
    STAssertTrue([table isEqualTo: addedTable], @"added table should be same as created");
}

@end
