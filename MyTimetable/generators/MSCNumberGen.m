//
//  MSCNumberGen.m
//  MyTimetable
//
//  Created by Никита Б. Зуев on 10.06.13.
//  Copyright (c) 2013 Никита Б. Зуев. All rights reserved.
//

#import "MSCNumberGen.h"
#import <stdlib.h>

@implementation MSCNumberGen

+ (long)number
{
    return [MSCNumberGen numberLessThan:10];
}

+ (long)numberLessThan: (NSUInteger)max
{
    return [MSCNumberGen numberLessThan:max MoreThan:0];
}

+ (long)numberLessThan: (NSUInteger)max
              MoreThan: (NSUInteger)min
{
    return min + arc4random_uniform((u_int32_t)(max - min));
}

@end
