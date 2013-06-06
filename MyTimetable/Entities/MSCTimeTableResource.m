//
//  MSCTimeTableResource.m
//  MyTimetable
//
//  Created by Никита Б. Зуев on 06.06.13.
//  Copyright (c) 2013 Никита Б. Зуев. All rights reserved.
//

#import "MSCTimeTableResource.h"
#import "NSArray+Aggregates.h"

@implementation MSCTimeTableResource

@synthesize type;
@synthesize supplies;
@synthesize consumes;

- (id)initWithAmount: (NSString*) amount
              ofType: (NSString*) aType
{
    self = [super init];
    if (self) {
        type = aType;
        supplies = @[ [NSDecimalNumber decimalNumberWithString: amount] ];
        consumes = nil;
    }
    return self;
}

- (NSDecimalNumber*) amount
{
    NSDecimalNumber* totalSupplies = [self.supplies decimalNumberSum];
    if (totalSupplies == nil) {
        return nil;
    }
    
    NSDecimalNumber* totalConsumes = [self.consumes decimalNumberSum];
    if (totalConsumes == nil) {
        return totalSupplies;
    }
    
    return [totalSupplies decimalNumberBySubtracting: totalConsumes];
}

- (NSDecimalNumber*) totalSupplies
{
    return [self.supplies decimalNumberSum];
}

- (NSDecimalNumber*) totalConsumes
{
    return [self.consumes decimalNumberSum];
}

@end
