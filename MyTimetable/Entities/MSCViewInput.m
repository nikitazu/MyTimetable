//
//  MSCViewInput.m
//  MyTimetable
//
//  Created by Никита Б. Зуев on 07.06.13.
//  Copyright (c) 2013 Никита Б. Зуев. All rights reserved.
//

#import "MSCViewInput.h"

@implementation MSCViewInput

@synthesize title;
@synthesize tables;

- (id)init
{
    self = [super init];
    if (self) {
        self.title = @"MyView";
        self.tables = [NSMutableArray array];
    }
    return self;
}

@end
