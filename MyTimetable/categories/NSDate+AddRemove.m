//
//  NSDate+AddRemove.m
//  MyTimetable
//
//  Created by Никита Б. Зуев on 25.05.13.
//  Copyright (c) 2013 Никита Б. Зуев. All rights reserved.
//

#import "NSDate+AddRemove.h"

@implementation NSDate (AddRemove)

- (NSDate*) dateByAddingDays: (NSInteger)days
{
    NSDateComponents* components = [[NSDateComponents alloc] init];
    [components setDay:days];
    return [self dateByAddingComponents:components];
}

- (NSDate*) dateByAddingWeeks: (NSInteger)weeks
{
    NSDateComponents* components = [[NSDateComponents alloc] init];
    [components setWeek:weeks];
    return [self dateByAddingComponents:components];
}

- (NSDate*) dateByAddingMonths: (NSInteger)months
{
    NSDateComponents* components = [[NSDateComponents alloc] init];
    [components setMonth:months];
    return [self dateByAddingComponents:components];
}

- (NSDate*) dateByAddingYears: (NSInteger)years
{
    NSDateComponents* components = [[NSDateComponents alloc] init];
    [components setYear:years];
    return [self dateByAddingComponents:components];
}

- (NSDate*) tomorrow
{
    return [self dateByAddingDays: 1];
}

- (NSDate*) dateByAddingComponents: (NSDateComponents*)components
{
    NSCalendar* gregorian =
    [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    return [gregorian dateByAddingComponents:components
                                      toDate:self
                                     options:0];
}

@end
