//
//  MSCTestTimeTableSupply.m
//  MyTimetable
//
//  Created by Никита Б. Зуев on 10.06.13.
//  Copyright (c) 2013 Никита Б. Зуев. All rights reserved.
//

#import "MSCTestTimeTableSupply.h"
#import "MSCTimeTableSupply.h"

@implementation MSCTestTimeTableSupply
{
    MSCTimeTableSupply* supply;
}

- (void)setUp
{
    [super setUp];
    supply = [[MSCTimeTableSupply alloc] init];
    supply.amount = [NSDecimalNumber decimalNumberWithString:@"9.05"];
}

- (void)tearDown
{
    supply = nil;
    [super tearDown];
}

- (void)testSupplyWithDecimal
{
    MSCTimeTableSupply* newSupply = [MSCTimeTableSupply supplyWithDecimal:
                                     [NSDecimalNumber decimalNumberWithString:@"9.05"]];
    
    STAssertNotNil(newSupply, @"new supply should be initialized");
    STAssertTrue([supply.amount isEqualToNumber: newSupply.amount],
                 @"new supply amount should be 9.05");
    
    
}

- (void)testSupplyWithString
{
    MSCTimeTableSupply* newSupply = [MSCTimeTableSupply supplyWithString: @"9.05"];
    STAssertNotNil(newSupply, @"new supply should be initialized");
    STAssertTrue([supply.amount isEqualToNumber: newSupply.amount],
                 @"new supply amount should be 9.05");
}

@end
