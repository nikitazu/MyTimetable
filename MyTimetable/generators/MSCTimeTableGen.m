//
//  MSCTimeTableGen.m
//  MyTimetable
//
//  Created by Никита Б. Зуев on 10.06.13.
//  Copyright (c) 2013 Никита Б. Зуев. All rights reserved.
//

#import "MSCTimeTableGen.h"
#import "MSCNumberGen.h"
#import "MSCStringGen.h"
#import "MSCTimeTableItem.h"

@implementation MSCTimeTableGen

+ (MSCTimeTable*) generate
{
    MSCTimeTable* table = [[MSCTimeTable alloc] init];
    table.title = [MSCStringGen stringStartingWith:@"MyTable "
                                withNumberLessThan:100];
    
    long tableItems = [MSCNumberGen numberLessThan:10 MoreThan:2];
    NSMutableArray* items = [NSMutableArray arrayWithCapacity:tableItems];
    for (long i = 0; i < tableItems; i++) {
        MSCTimeTableItem* item = [[MSCTimeTableItem alloc] initWithOneValueAt:
                                  [NSDate date]];
        items[i] = item;
    }
    table.items = items;
    return table;
}

@end
