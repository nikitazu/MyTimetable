//
//  MSCTimeTableSupply.m
//  MyTimetable
//
//  Created by Никита Б. Зуев on 06.06.13.
//  Copyright (c) 2013 Никита Б. Зуев. All rights reserved.
//

#import "MSCTimeTableSupply.h"

@implementation MSCTimeTableSupply

@synthesize amount;
@synthesize comment;

+ (MSCTimeTableSupply*) supplyWithDecimal: (NSDecimalNumber*)decimalNumber
{
    MSCTimeTableSupply* supply = [[MSCTimeTableSupply alloc] init];
    if (supply) {
        supply.amount = decimalNumber;
    }
    return supply;
}

+ (MSCTimeTableSupply*) supplyWithString: (NSString*)string
{
    MSCTimeTableSupply* supply = [[MSCTimeTableSupply alloc] init];
    if (supply) {
        supply.amount = [NSDecimalNumber decimalNumberWithString: string];
    }
    return supply;
}

@end
