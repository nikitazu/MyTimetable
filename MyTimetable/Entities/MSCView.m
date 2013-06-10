//
//  MSCView.m
//  MyTimetable
//
//  Created by Никита Б. Зуев on 07.06.13.
//  Copyright (c) 2013 Никита Б. Зуев. All rights reserved.
//

#import "MSCView.h"

@implementation MSCView

@synthesize title;
@synthesize created;
@synthesize tables;

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

@end
