//
//  MSCKeyValueUseCase.m
//  MyTimetable
//
//  Created by Никита Б. Зуев on 10.06.13.
//  Copyright (c) 2013 Никита Б. Зуев. All rights reserved.
//

#import "MSCKeyValueUseCase.h"
#import "MSCKeyValue.h"

@implementation MSCKeyValueUseCase

- (id)init
{
    self = [super init];
    if (self) {
        self.catalog = @"kv";
    }
    return self;
}

- (void) setValue: (NSString*) aValue forKey: (NSString*) aKey
{
    MSCKeyValue* kv = [MSCKeyValue kvWithKey: aKey andValue: aValue];
    [self addItem: kv];
}

- (NSString*) valueForKey: (NSString*) key
{
    if (key == nil) {
        return nil;
    }
    
    return [[self.storage find:key in:self.catalog] value];
}

@end
