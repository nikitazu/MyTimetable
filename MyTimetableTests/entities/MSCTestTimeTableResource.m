//
//  MSCTestTimeTableResource.m
//  MyTimetable
//
//  Created by Никита Б. Зуев on 10.06.13.
//  Copyright (c) 2013 Никита Б. Зуев. All rights reserved.
//

#import "MSCTimeTableResource.h"
#import <SenTestingKit/SenTestingKit.h>

@interface MSCTestTimeTableResource : SenTestCase

@end

@implementation MSCTestTimeTableResource
{
    MSCTimeTableResource* resource;
    MSCTimeTableSupply* supply;
    MSCTimeTableSupply* addSupply;
    MSCTimeTableSupply* consume;
}

- (void)setUp
{
    [super setUp];
    
    supply = [MSCTimeTableSupply supplyWithString:@"10"];
    addSupply = [MSCTimeTableSupply supplyWithString:@"5"];
    consume = [MSCTimeTableSupply supplyWithString:@"9"];
    
    resource = [[MSCTimeTableResource alloc] initWithAmount: supply
                                                     ofType:@"2 tablets"];
}

- (void)tearDown
{
    [super tearDown];
    
    supply = nil;
    addSupply = nil;
    consume = nil;
    resource = nil;
}

- (void) testSupplyWithAmount
{
    NSDecimalNumber* result = [NSDecimalNumber decimalNumberWithString:@"15.00"];
    [resource supply:addSupply];
    STAssertTrue([resource.amount isEqualToNumber: result],
                 @"resource amount should increase by 5");
}

- (void) testConsumeByAmount
{
    NSDecimalNumber* result = [NSDecimalNumber decimalNumberWithString:@"1"];
    [resource consume: consume];
    STAssertTrue([resource.amount isEqualToNumber: result],
                 @"resource amount should decrease by 9");
}

- (void) testTotalSupplies
{
    NSDecimalNumber* result = [NSDecimalNumber decimalNumberWithString:@"15.00"];
    [resource supply:addSupply];
    STAssertTrue([resource.totalSupplies isEqualToNumber: result],
                 @"resource total supplies should be 15");
}

- (void) testTotalConsumes
{
    [resource consume: consume];
    STAssertTrue([resource.totalConsumes isEqualToNumber: consume.amount],
                 @"resource total consumes should be 1");
}

- (void) testConsumeNormalAmount
{
    MSCTimeTableSupply* nconsume = [resource normalConsume];
    STAssertNil(nconsume, @"consume without normalConsumeAmount should be nil");
    
    resource.normalConsumeAmount = [NSDecimalNumber decimalNumberWithString:@"1.00"];
    nconsume = [resource normalConsume];
    
    STAssertNotNil(nconsume, @"normal consume initialized");
    STAssertNotNil(nconsume.amount, @"normal consume amount initialized");
    
    NSDecimalNumber* result = [NSDecimalNumber decimalNumberWithString:@"9.00"];
    [resource consume: nconsume];
    
    STAssertTrue([resource.amount isEqualToNumber: result],
                 @"resource amount should decrease by normal amount");
}

@end
