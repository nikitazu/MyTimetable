//
//  NSArray+Aggregates.m
//  MyTimetable
//
//  Created by Никита Б. Зуев on 06.06.13.
//  Copyright (c) 2013 Никита Б. Зуев. All rights reserved.
//

#import "NSArray+Aggregates.h"

@implementation NSArray (Aggregates)

- (NSDecimalNumber*) decimalNumberSum
{
    NSDecimalNumber* total = [NSDecimalNumber decimalNumberWithString:@"0.00"];
    for (NSDecimalNumber* amt in self) {
        total = [total decimalNumberByAdding:amt];
    }
    return total;
}

@end
