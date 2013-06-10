//
//  MSCFilter.m
//  MyTimetable
//
//  Created by Никита Б. Зуев on 10.06.13.
//  Copyright (c) 2013 Никита Б. Зуев. All rights reserved.
//

#import "MSCFilter.h"

@implementation MSCFilter

- (NSString*) storageName
{
    return @"filter";
}

- (BOOL) isEqualTo:(id)object
{
    return [self.storageName isEqualTo:[object storageName]];
}

@end
