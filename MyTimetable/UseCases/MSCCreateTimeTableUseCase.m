//
//  MSCCreateTimeTableUseCase.m
//  MyTimetable
//
//  Created by Никита Б. Зуев on 20.05.13.
//  Copyright (c) 2013 Никита Б. Зуев. All rights reserved.
//

#import "MSCCreateTimeTableUseCase.h"
#import "NSDate+AddRemove.h"

@implementation MSCCreateTimeTableUseCase

- (MSCTimeTable*) createWithInput: (NSDictionary*)input
{
    if (!input) { return nil; }
    
    MSCTimeTable* table = [[MSCTimeTable alloc] init];
    table.title = [input valueForKey:@"title"];
    if (!table.title) {
        table.title = @"MyTable";
    }
    
    NSString* template = [input valueForKey:@"template"];
    
    if ([template isEqualToString:@"everyday"]) {
        return [self createFromEverydayTemplate: table withInput: input];
    }
    
    return table;
}

- (MSCTimeTable*) createFromEverydayTemplate: (MSCTimeTable*)table
                                   withInput: (NSDictionary*)input
{
    NSMutableArray* items = [NSMutableArray array];
    
    NSInteger itemsCount = [[input valueForKey:@"itemsCount"] longValue];
    NSDate* startAt = [input valueForKey:@"startAt"];
    NSInteger counter = 0;
    
    while (counter < itemsCount) {
        MSCTimeTableItem* item = [[MSCTimeTableItem alloc] init];
        item.done = NO;
        item.at = [startAt dateByAddingDays: counter];
        [items addObject: item];
        counter = counter + 1;
    }
    
    table.items = items;
    return table;
}

@end
