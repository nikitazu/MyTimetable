//
//  MSCTestUseResourceUseCase.m
//  MyTimetable
//
//  Created by Никита Б. Зуев on 06.06.13.
//  Copyright (c) 2013 Никита Б. Зуев. All rights reserved.
//

#import "MSCTestUseResourceUseCase.h"
#import "MSCUseResourceUseCase.h"

@implementation MSCTestUseResourceUseCase
{
    MSCTimeTableResource* resource;
    MSCUseResourceUseCase* uc;
    MSCTimeTableSupply* startingSupply;
}

- (void)setUp
{
    [super setUp];
    startingSupply = [[MSCTimeTableSupply alloc] init];
    startingSupply.amount = [NSDecimalNumber decimalNumberWithString:@"10.00"];
    resource = [[MSCTimeTableResource alloc] initWithAmount: startingSupply
                                                     ofType: @"2 tablets"];
    uc = [[MSCUseResourceUseCase alloc] init];
}

- (void)tearDown
{
    startingSupply = nil;
    resource = nil;
    uc = nil;
    [super tearDown];
}

- (void) testSupplyWithAmount
{
    MSCTimeTableSupply* supply = [[MSCTimeTableSupply alloc] init];
    supply.amount = [NSDecimalNumber decimalNumberWithString:@"05.00"];
    NSDecimalNumber* result = [NSDecimalNumber decimalNumberWithString:@"15.00"];
    
    [uc supply:resource withAmount: supply];
    
    STAssertTrue([resource.amount isEqualToNumber: result],
                 @"resource amount should increase by 5");
}

- (void) testConsumeByAmount
{
    MSCTimeTableSupply* consume = [[MSCTimeTableSupply alloc] init];
    consume.amount = [NSDecimalNumber decimalNumberWithString:@"0.50"];
    NSDecimalNumber* result = [NSDecimalNumber decimalNumberWithString:@"9.50"];
    
    NSLog(@"consuming");
    [uc consume:resource byAmount: consume];
    
    STAssertTrue([resource.amount isEqualToNumber: result],
                 @"resource amount should decrease by 0.5");
}

- (void) testTotalSupplies
{
    MSCTimeTableSupply* supply = [[MSCTimeTableSupply alloc] init];
    supply.amount = [NSDecimalNumber decimalNumberWithString:@"05.00"];
    NSDecimalNumber* result = [NSDecimalNumber decimalNumberWithString:@"15.00"];
    
    [uc supply:resource withAmount: supply];
    
    STAssertTrue([resource.totalSupplies isEqualToNumber: result],
                 @"resource total supplies should be 15");
}

- (void) testTotalConsumes
{
    MSCTimeTableSupply* consume = [[MSCTimeTableSupply alloc] init];
    consume.amount = [NSDecimalNumber decimalNumberWithString:@"0.50"];
    
    [uc consume:resource byAmount: consume];
    
    STAssertTrue([resource.totalConsumes isEqualToNumber: consume.amount],
                 @"resource total consumes should be 0.5");
}

@end
