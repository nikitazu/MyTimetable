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

- (id)init
{
    self = [super init];
    if (self) {
        self.catalog = @"tables";
    }
    return self;
}

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
    
    [self addItem:table];
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
    NSDateComponents* components = [input.everyType dateComponentsWithAmount:
                                    number * input.everyNth];
    NSDate* atDate = [input.startAt dateByAddingComponents: components];
    
    if (input.valuesCount == 1) {
        return [[MSCTimeTableItem alloc] initWithOneValueAt: atDate];
    }
    
    MSCTimeTableItem* item = [[MSCTimeTableItem alloc] initAt: atDate];
    
    item.values = !input.valuesStartAt ?
        [self createEmptyValues:input.valuesCount] :
        [self createDatedValues:input.valuesStartAt addingComponents:components];
    
    return item;
}

- (NSArray*)createEmptyValues: (NSUInteger)count
{
    NSMutableArray* values = [NSMutableArray array];
    for (int i = 0; i < count; i++) {
        [values addObject: [[MSCTimeTableValue alloc] init]];
    }
    return values;
}

- (NSArray*)createDatedValues: (NSArray*)valuesStartAt
             addingComponents: (NSDateComponents*)components
{
    NSMutableArray* values = [NSMutableArray array];
    for (NSDate* valueAt in valuesStartAt) {
        NSDate* valueAtReally = [valueAt dateByAddingComponents: components];
        MSCTimeTableValue* value = [[MSCTimeTableValue alloc] initAt:valueAtReally];
        [values addObject: value];
    }
    return values;
}

@end
