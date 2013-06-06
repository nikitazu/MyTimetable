//
//  MSCTimeTableResource.m
//  MyTimetable
//
//  Created by Никита Б. Зуев on 06.06.13.
//  Copyright (c) 2013 Никита Б. Зуев. All rights reserved.
//

#import "MSCTimeTableResource.h"

@implementation MSCTimeTableResource

@synthesize type;
@synthesize supplies;
@synthesize consumes;

- (id)initWithAmount: (MSCTimeTableSupply*) amount
              ofType: (NSString*) aType
{
    self = [super init];
    if (self) {
        type = aType;
        supplies = @[ amount ];
        consumes = nil;
    }
    return self;
}

- (NSDecimalNumber*) amount
{
    NSDecimalNumber* totalSupplies = [self sum: self.supplies];
    if (totalSupplies == nil) {
        return nil;
    }
    
    NSDecimalNumber* totalConsumes = [self sum: self.consumes];
    if (totalConsumes == nil) {
        return totalSupplies;
    }
    
    return [totalSupplies decimalNumberBySubtracting: totalConsumes];
}

- (NSDecimalNumber*) totalSupplies
{
    return [self sum: self.supplies];
}

- (NSDecimalNumber*) totalConsumes
{
    return [self sum: self.consumes];
}

- (NSDecimalNumber*) sum: (NSArray*) amounts
{
    NSDecimalNumber* total = [NSDecimalNumber decimalNumberWithString:@"0.00"];
    for (MSCTimeTableSupply* amt in amounts) {
        total = [total decimalNumberByAdding: amt.amount];
    }
    return total;
}

@end
