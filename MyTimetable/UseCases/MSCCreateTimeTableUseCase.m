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

- (MSCTimeTable*) createWithInput: (MSCTimeTableInput*)input
{
    if (!input) { return nil; }
    
    [input resetNilValuesToDefaults];
    
    MSCTimeTable* table = [[MSCTimeTable alloc] init];
    table.title = input.title;
    
    if ([input.templateType isEqualToString:@"every"]) {
        return [self createFromEveryTemplate: table
                                   withInput: input];
    }
    
    return table;
}

- (MSCTimeTable*) createFromEveryTemplate: (MSCTimeTable*)table
                                withInput: (MSCTimeTableInput*)input
{
    if (input.itemsCount == 0) {
        return table;
    }
    
    if (!input.startAt) {
        return table;
    }
    
    NSMutableArray* items = [NSMutableArray array];
    NSInteger counter = 0;
    
    while (counter < input.itemsCount) {
        [items addObject: [self createTableItemNumber:counter withInput:input]];
        counter = counter + 1;
    }
    
    table.items = items;
    return table;
}

- (MSCTimeTableItem*)createTableItemNumber: (NSInteger)number
                                 withInput: (MSCTimeTableInput*)input
{
    MSCTimeTableItem* item = nil;
    
    NSDateComponents* components = [input.everyType dateComponentsWithAmount:
                                    number * input.everyNth];
    NSDate* atDate = [input.startAt dateByAddingComponents: components];
    
    if (input.valuesCount == 1)
    {
        return [[MSCTimeTableItem alloc] initWithOneValueAt: atDate];
    }
    
    item = [[MSCTimeTableItem alloc] initAt: atDate];
    NSMutableArray* values = [NSMutableArray array];
    if (!input.valuesStartAt) {
        for (int i = 0; i < input.valuesCount; i++) {
            [values addObject: [[MSCTimeTableValue alloc] init]];
        }
    } else {
        for (NSDate* valueAt in input.valuesStartAt) {
            NSDate* valueAtReally = [valueAt dateByAddingComponents: components];
            MSCTimeTableValue* value = [[MSCTimeTableValue alloc]
                                        initAt:valueAtReally];
            [values addObject: value];
        }
    }
    item.values = values;
    
    return item;
}

@end
