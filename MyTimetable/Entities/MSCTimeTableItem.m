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

- (id)initAt: (NSDate*)aDate
{
    self = [super init];
    if (self) {
        at = aDate;
    }
    return self;
}

- (BOOL)done
{
    for (MSCTimeTableValue* v in self.values) {
        if (!v.done) {
            return NO;
        }
    }
    return YES;
}

- (BOOL)started
{
    for (MSCTimeTableValue* v in self.values) {
        if (v.done) {
            return YES;
        }
    }
    return NO;
}

- (void)setAllDone
{
    for (MSCTimeTableValue* v in self.values) {
        v.done = YES;
    }
}

- (void)setAllUndone
{
    for (MSCTimeTableValue* v in self.values) {
        v.done = NO;
    }
}

@end
