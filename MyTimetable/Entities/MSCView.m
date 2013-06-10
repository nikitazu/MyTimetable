//
//  MSCView.m
//  MyTimetable
//
//  Created by Никита Б. Зуев on 07.06.13.
//  Copyright (c) 2013 Никита Б. Зуев. All rights reserved.
//

#import "MSCView.h"
#import "MSCTimeTable.h"

@implementation MSCView

@synthesize title;
@synthesize created;
@synthesize tables;

- (id)init
{
    self = [super init];
    if (self) {
        self.tables = [NSMutableDictionary dictionary];
        self.title = @"MyView";
    }
    return self;
}

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
    return [NSString stringWithFormat: @"{view title: %@ tables: %@ }",
            title, tables, nil];
}

- (BOOL)current
{
    for (NSString* tkey in self.tables) {
        MSCTimeTable* table = [self.tables objectForKey:tkey];
        if (table.started) {
            return YES;
        }
    }
    return NO;
}

- (BOOL)isNew
{
    if (self.tables == nil || self.tables.count == 0) {
        return YES;
    }
    
    for (NSString* tkey in self.tables) {
        MSCTimeTable* table = [self.tables objectForKey:tkey];
        if (!table.started) {
            return YES;
        }
    }
    return NO;
}

@end
