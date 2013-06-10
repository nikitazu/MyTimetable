//
//  MSCTimeTableInputGen.m
//  MyTimetable
//
//  Created by Никита Б. Зуев on 10.06.13.
//  Copyright (c) 2013 Никита Б. Зуев. All rights reserved.
//

#import "MSCTimeTableInputGen.h"
#import "MSCNumberGen.h"
#import "MSCStringGen.h"

@implementation MSCTimeTableInputGen

+ (MSCTimeTableInput*)generate
{
    MSCTimeTableInput* input = [[MSCTimeTableInput alloc] init];
    input.title = [MSCStringGen stringStartingWith:@"My gentable "
                                withNumberLessThan:100];
    
    input.itemsCount = [MSCNumberGen numberLessThan:20 MoreThan:5];
    input.valuesCount = [MSCNumberGen numberLessThan:4 MoreThan:1];
    input.startAt = [NSDate date];
    return input;
}

@end
