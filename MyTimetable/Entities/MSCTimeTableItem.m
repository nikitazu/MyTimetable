//
//  MSCTimeTableItem.m
//  MyTimetable
//
//  Created by Никита Б. Зуев on 20.05.13.
//  Copyright (c) 2013 Никита Б. Зуев. All rights reserved.
//

#import "MSCTimeTableItem.h"
#import "MSCTimeTableValue.h"

@implementation MSCTimeTableItem

@synthesize at;
@synthesize values;

- (id)initWithOneValueAt: (NSDate*)aDate
{
    self = [super init];
    if (self) {
        values = @[[[MSCTimeTableValue alloc] initAt: aDate]];
        at = aDate;
    }
    return self;
}

@end
