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
}

- (void)setUp
{
    [super setUp];
    resource = [[MSCTimeTableResource alloc] initWithAmount: @"10.00"
                                                     ofType: @"2 tablets"];
    uc = [[MSCUseResourceUseCase alloc] init];
}

- (void)tearDown
{
    resource = nil;
    uc = nil;
    [super tearDown];
}

- (void) testSupplyWithAmount
{
    NSDecimalNumber* amount = [NSDecimalNumber decimalNumberWithString:@"05.00"];
    NSDecimalNumber* result = [NSDecimalNumber decimalNumberWithString:@"15.00"];
    
    [uc supply:resource withAmount: amount];
    
    STAssertTrue([resource.amount isEqualToNumber: result],
                 @"resource amount should increase by 5");
    
    STAssertTrue([resource.totalSupplies isEqualToNumber: result],
                 @"resource total supplies should be 15");
}

- (void) testConsumeByAmount
{
    NSDecimalNumber* amount = [NSDecimalNumber decimalNumberWithString:@"0.50"];
    NSDecimalNumber* result = [NSDecimalNumber decimalNumberWithString:@"9.50"];
    
    [uc consume:resource byAmount: amount];
    
    STAssertTrue([resource.amount isEqualToNumber: result],
                 @"resource amount should decrease by 0.5");
    
    STAssertTrue([resource.totalConsumes isEqualToNumber: amount],
                 @"resource total supplies should be 0.5");
}

@end
