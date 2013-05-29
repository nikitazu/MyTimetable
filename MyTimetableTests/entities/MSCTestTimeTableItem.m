//
//  MSCTestTimeTableItem.m
//  MyTimetable
//
//  Created by Никита Б. Зуев on 29.05.13.
//  Copyright (c) 2013 Никита Б. Зуев. All rights reserved.
//

#import "MSCTestTimeTableItem.h"
#import "MSCTimeTableItem.h"
#import "MSCTimeTableValue.h"

@implementation MSCTestTimeTableItem
{
    NSDateFormatter* format;
}

- (void)setUp
{
    format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"dd.MM.yyyy"];
    [super setUp];
}

- (void)initWithOneItemAt
{
    MSCTimeTableItem* item = [[MSCTimeTableItem alloc] initWithOneValueAt:
                              [format dateFromString:@"10.10.2010"]];
    
    STAssertNotNil(item, @"constructor should create item");
    STAssertTrue([[format stringFromDate: item.at] isEqualToString: @"10.10.2010"],
                 @"at should be properly initialized");
    STAssertNotNil(item.values, @"values should be initialized");
    STAssertTrue(item.values.count == 1, @"item shoud have one value");
    
    MSCTimeTableValue* value = item.values[0];
    STAssertTrue(value.at == item.at,
                 @"value at should equal to its items at");
}

@end
