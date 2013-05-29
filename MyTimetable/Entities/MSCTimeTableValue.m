//
//  MSCTimeTableValue.m
//  MyTimetable
//
//  Created by Никита Б. Зуев on 29.05.13.
//  Copyright (c) 2013 Никита Б. Зуев. All rights reserved.
//

#import "MSCTimeTableValue.h"

@implementation MSCTimeTableValue

@synthesize at;
@synthesize done;

- (id)initAt: (NSDate*) aDate
{
    self = [super init];
    if (self) {
        at = aDate;
        done = NO;
    }
    return self;
}

@end
