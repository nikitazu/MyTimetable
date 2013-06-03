//
//  MSCTimeTableInput.m
//  MyTimetable
//
//  Created by Никита Б. Зуев on 03.06.13.
//  Copyright (c) 2013 Никита Б. Зуев. All rights reserved.
//

#import "MSCTimeTableInput.h"

@implementation MSCTimeTableInput

@synthesize title;
@synthesize templateType;
@synthesize everyType;
@synthesize itemsCount;
@synthesize valuesCount;
@synthesize startAt;
@synthesize valuesStartAt;
@synthesize everyNth;

- (id)init
{
    self = [super init];
    if (self) {
        [self resetNilValuesToDefaults];
    }
    return self;
}

- (void) resetNilValuesToDefaults
{
    if (!self.title) {
        self.title = @"MyTable";
    }
    if (!self.everyType) {
        self.everyType = @"day";
    }
    if (self.itemsCount < 0) {
        itemsCount = 0;
    }
    if (self.everyNth < 1) {
        self.everyNth = 1;
    }
    if (self.valuesCount < 1) {
        self.valuesCount = 1;
    }
}

@end
