//
//  MSCTestTimeTableValue.m
//  MyTimetable
//
//  Created by Никита Б. Зуев on 29.05.13.
//  Copyright (c) 2013 Никита Б. Зуев. All rights reserved.
//

#import "MSCTestTimeTableValue.h"
#import "MSCTimeTableValue.h"

@implementation MSCTestTimeTableValue
{
    NSDateFormatter* format;
}

- (void)setUp
{
    format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"dd.MM.yyyy"];
    [super setUp];
}

- (void) testInitAt
{
    MSCTimeTableValue* value = [[MSCTimeTableValue alloc] initAt:
                                [format dateFromString:@"10.10.2010"]];
    
    STAssertNotNil(value, @"constructor should init");
    STAssertTrue([[format stringFromDate:value.at] isEqualToString:@"10.10.2010"],
                 @"at should be 10.10.2010");
    STAssertFalse(value.done, @"initial state should be undone");
}

@end
