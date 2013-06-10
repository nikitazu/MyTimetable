//
//  MSCTestNumberGen.m
//  MyTimetable
//
//  Created by Никита Б. Зуев on 10.06.13.
//  Copyright (c) 2013 Никита Б. Зуев. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "MSCNumberGen.h"

@interface MSCTestNumberGen : SenTestCase

@end


@implementation MSCTestNumberGen

- (void)testNumberLessThanMoreThan
{
    for (int i = 0; i < 100; i++) {
        long x = [MSCNumberGen numberLessThan:30 MoreThan:10];
        STAssertTrue(x <= 30, @"should be <= 30, got: %ld", x);
        STAssertTrue(x >= 10, @"should be >= 10, got: %ld", x);
    }
}

- (void)testNumberLessThan
{
    for (int i = 0; i < 100; i++) {
        long x = [MSCNumberGen numberLessThan:20];
        STAssertTrue(x <= 20, @"should be <= 20, got: %ld", x);
        STAssertTrue(x >= 0, @"should be >= 0, got: %ld", x);
    }
}

- (void)testNumber
{
    for (int i = 0; i < 100; i++) {
        long x = [MSCNumberGen number];
        STAssertTrue(x <= 10, @"should be <= 10, got: %ld", x);
        STAssertTrue(x >= 0, @"should be >= 0, got: %ld", x);
    }
}

@end
