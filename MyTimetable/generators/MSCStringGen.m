//
//  MSCStringGen.m
//  MyTimetable
//
//  Created by Никита Б. Зуев on 10.06.13.
//  Copyright (c) 2013 Никита Б. Зуев. All rights reserved.
//

#import "MSCStringGen.h"
#import "MSCNumberGen.h"

@implementation MSCStringGen

+ (NSString*)stringStartingWith: (NSString*)string
{
    long number = [MSCNumberGen number];
    return [NSString stringWithFormat:@"%@%ld", string, number];
}

+ (NSString*)stringStartingWith: (NSString *)string
             withNumberLessThan: (NSUInteger)max
{
    long number = [MSCNumberGen numberLessThan:max];
    return [NSString stringWithFormat:@"%@%ld", string, number];
}

@end
