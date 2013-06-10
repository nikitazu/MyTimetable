//
//  MSCTimeTable.m
//  MyTimetable
//
//  Created by Никита Б. Зуев on 20.05.13.
//  Copyright (c) 2013 Никита Б. Зуев. All rights reserved.
//

#import "MSCTimeTable.h"
#import "MSCTimeTableItem.h"

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

- (BOOL)done
{
    if (self.items == nil) {
        return NO;
    }
    
    for (MSCTimeTableItem* item in self.items) {
        if (!item.done) {
            return NO;
        }
    }
    return YES;
}

- (BOOL)started
{
    if (self.items == nil) {
        return NO;
    }
    
    for (MSCTimeTableItem* item in self.items) {
        if (item.started) {
            return YES;
        }
    }
    return NO;
}

@end
