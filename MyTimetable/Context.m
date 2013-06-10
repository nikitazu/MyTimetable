//
//  Context.m
//  MyTimetable
//
//  Created by Никита Б. Зуев on 07.06.13.
//  Copyright (c) 2013 Никита Б. Зуев. All rights reserved.
//

#import "Context.h"
#import "MSCMemoryStorage.h"

@implementation Context

+ (id)singleton
{
    static dispatch_once_t pred = 0;
    __strong static id _sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[self alloc] init]; // <-- my code here
    });
    return _sharedObject;
}

- (id)init
{
    self = [super init];
    if (self) {
        self.storage = [[MSCMemoryStorage alloc] init];
        self.state = nil;
    }
    return self;
}

@synthesize storage;
@synthesize state;

- (void) reset
{
    self.storage = [[MSCMemoryStorage alloc] initEmpty];
    self.state = nil;
}

@end
