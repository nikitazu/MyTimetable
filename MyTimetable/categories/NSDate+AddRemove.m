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
    
    NSCalendar* gregorian =
        [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    return [gregorian dateByAddingComponents:components
                                      toDate:self
                                     options:0];
}

- (NSDate*) dateByAddingWeeks: (NSInteger)weeks
{
    NSDateComponents* components = [[NSDateComponents alloc] init];
    [components setWeek:weeks];
    
    NSCalendar* gregorian =
    [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    return [gregorian dateByAddingComponents:components
                                      toDate:self
                                     options:0];
}

- (NSDate*) dateByAddingMonths: (NSInteger)months
{
    NSDateComponents* components = [[NSDateComponents alloc] init];
    [components setMonth:months];
    
    NSCalendar* gregorian =
    [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    return [gregorian dateByAddingComponents:components
                                      toDate:self
                                     options:0];
}

- (NSDate*) dateByAddingYears: (NSInteger)years
{
    NSDateComponents* components = [[NSDateComponents alloc] init];
    [components setYear:years];
    
    NSCalendar* gregorian =
    [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    return [gregorian dateByAddingComponents:components
                                      toDate:self
                                     options:0];
}


- (NSDate*) tomorrow
{
    return [self dateByAddingDays: 1];
}

@end
