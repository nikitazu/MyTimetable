//
//  MSCTestNSArray+Aggregates.m
//  MyTimetable
//
//  Created by Никита Б. Зуев on 06.06.13.
//  Copyright (c) 2013 Никита Б. Зуев. All rights reserved.
//

#import "MSCTestNSArray+Aggregates.h"
#import "NSArray+Aggregates.h"

@implementation MSCTestNSArray_Aggregates

- (void) testDecimalNumberBySum
{
    NSArray* values = @[[NSDecimalNumber decimalNumberWithString:@"10.05"],
                        [NSDecimalNumber decimalNumberWithString:@".15"],
                        [NSDecimalNumber decimalNumberWithString:@"0"],
                        [NSDecimalNumber decimalNumberWithString:@"1"]];
    
    NSDecimalNumber* sum = [NSDecimalNumber decimalNumberWithString:@"11.20"];
    NSDecimalNumber* realSum = [values decimalNumberSum];
    
    STAssertNotNil(realSum, @"sum should not be nil");
    STAssertTrue([sum isEqualToNumber: realSum], @"sum should be 11.20");
}

@end
