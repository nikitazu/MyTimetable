//
//  NSString+DateComponents.m
//  MyTimetable
//
//  Created by Никита Б. Зуев on 26.05.13.
//  Copyright (c) 2013 Никита Б. Зуев. All rights reserved.
//

#import "NSString+DateComponents.h"

@implementation NSString (DateComponents)

- (NSDateComponents*) dateComponentsWithAmount: (NSInteger)amount
{
    NSDateComponents* components = [[NSDateComponents alloc] init];
    [components setValue: [NSNumber numberWithInteger: amount] forKey:self];
    return components;
}

@end
