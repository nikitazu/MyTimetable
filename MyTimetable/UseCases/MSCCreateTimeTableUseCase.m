//
//  MSCCreateTimeTableUseCase.m
//  MyTimetable
//
//  Created by Никита Б. Зуев on 20.05.13.
//  Copyright (c) 2013 Никита Б. Зуев. All rights reserved.
//

#import "MSCCreateTimeTableUseCase.h"
#import "NSDate+AddRemove.h"
#import "NSString+DateComponents.h"

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
    
    if ([template isEqualToString:@"every"]) {
        return [self createFromEveryTemplate: table
                                   withInput: input];
    }
    
    return table;
}

- (MSCTimeTable*) createFromEveryTemplate: (MSCTimeTable*)table
                                withInput: (NSDictionary*)input
{
    NSMutableArray* items = [NSMutableArray array];
    
    NSString* everyType = [input valueForKey:@"everyType"];
    if (!everyType) {
        everyType = @"day";
    }
    
    NSInteger itemsCount = [[input valueForKey:@"itemsCount"] longValue];
    if (itemsCount == 0) {
        return table;
    }
    
    NSInteger everyNth = [[input valueForKey:@"everyNth"] longValue];
    if (!(everyNth > 0)) {
        everyNth = 1;
    }
    
    NSDate* startAt = [input valueForKey:@"startAt"];
    if (!startAt) {
        return table;
    }
    
    NSInteger counter = 0;
    
    while (counter < itemsCount) {
        NSDateComponents* components = [everyType dateComponentsWithAmount: counter * everyNth];
        NSDate* atDate = [startAt dateByAddingComponents: components];
        MSCTimeTableItem* item = [[MSCTimeTableItem alloc] initWithOneValueAt: atDate];
        [items addObject: item];
        counter = counter + 1;
    }
    
    table.items = items;
    return table;
}

@end
