//
//  MSCTimeTable.m
//  MyTimetable
//
//  Created by Никита Б. Зуев on 20.05.13.
//  Copyright (c) 2013 Никита Б. Зуев. All rights reserved.
//

#import "MSCTimeTable.h"

@implementation MSCTimeTable

@synthesize title;
@synthesize created;
@synthesize items;

- (NSString*) storageName
{
    return self.title;
}

- (BOOL) isEqualTo:(id)object
{
    return [self.storageName isEqualToString: [object storageName]];
}

- (NSString*) description
{
    return [NSString stringWithFormat: @"{table title: %@}", self.title];
}

@end
