//
//  MSCUseResourceUseCase.m
//  MyTimetable
//
//  Created by Никита Б. Зуев on 06.06.13.
//  Copyright (c) 2013 Никита Б. Зуев. All rights reserved.
//

#import "MSCUseResourceUseCase.h"

@implementation MSCUseResourceUseCase

- (void) supply: (MSCTimeTableResource*) resource
     withAmount: (NSDecimalNumber*) amount
{
    NSMutableArray* supplies = [NSMutableArray arrayWithArray: resource.supplies];
    [supplies addObject: amount];
    resource.supplies = supplies;
}

- (void) consume: (MSCTimeTableResource*) resource
        byAmount: (NSDecimalNumber*) amount
{
    NSMutableArray* consumes = [NSMutableArray arrayWithArray: resource.consumes];
    [consumes addObject: amount];
    resource.consumes = consumes;
}

@end
