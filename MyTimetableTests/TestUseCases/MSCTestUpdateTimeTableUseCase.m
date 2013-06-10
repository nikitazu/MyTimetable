//
//  MSCTestUpdateTimeTableUseCase.m
//  MyTimetable
//
//  Created by Никита Б. Зуев on 10.06.13.
//  Copyright (c) 2013 Никита Б. Зуев. All rights reserved.
//

#import "MSCTestUpdateTimeTableUseCase.h"
#import "MSCUpdateTimeTableUseCase.h"
#import "MSCCreateTimeTableUseCase.h"

@implementation MSCTestUpdateTimeTableUseCase
{
    MSCCreateTimeTableUseCase* create;
    MSCUpdateTimeTableUseCase* update;
    MSCTimeTableInput* input;
}

- (void)setUp
{
    [super setUp];
    create = [[MSCCreateTimeTableUseCase alloc] init];
    update = [[MSCUpdateTimeTableUseCase alloc] init];
    input = [[MSCTimeTableInput alloc] init];
}

- (void)tearDown
{
    create = nil;
    update = nil;
    input = nil;
}

- (void)testMarkTimeTableAtIndexDone
{
    input.itemsCount = 5;
    input.startAt = [NSDate date];
    
    MSCTimeTable* table = [create createWithInput:input];
    [update markTimeTable:table atIndex:0];
    
    MSCTimeTableItem* item = table.items[0];
    
    STAssertTrue(item.done, @"item should be done");
}


- (void)testMarkTimeTableAtIndexUndone
{
    input.itemsCount = 5;
    input.startAt = [NSDate date];
    MSCTimeTable* table = [create createWithInput:input];
    
    [update markTimeTable:table atIndex:1];
    
    MSCTimeTableItem* item = table.items[1];
    STAssertTrue(item.done, @"item should be done");
    
    [update markTimeTable:table atIndex:1];
    STAssertFalse(item.done, @"item should be undone");
}

- (void)testMarkTimeTableAtIndexOutOfRangeSilentNotFail
{
    input.itemsCount = 5;
    input.startAt = [NSDate date];
    MSCTimeTable* table = [create createWithInput:input];
    [update markTimeTable:table atIndex:5];
    STAssertTrue(YES, @"YES");
}

@end
