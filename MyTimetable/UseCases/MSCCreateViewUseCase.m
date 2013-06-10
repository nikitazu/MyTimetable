//
//  MSCCreateViewUseCase.m
//  MyTimetable
//
//  Created by Никита Б. Зуев on 07.06.13.
//  Copyright (c) 2013 Никита Б. Зуев. All rights reserved.
//

#import "MSCCreateViewUseCase.h"
#import "MSCTimeTable.h"

@implementation MSCCreateViewUseCase

- (id)init
{
    self = [super init];
    if (self) {
        self.catalog = @"views";
    }
    return self;
}

- (MSCView*)createViewWithInput: (MSCViewInput*)input
{
    MSCView* view = [[MSCView alloc] init];
    view.title = input.title;
    view.tables = [NSMutableDictionary dictionary];
    for (MSCTimeTable* table in input.tables) {
        [view.tables setObject:table forKey:table.title];
    }
    
    [self addItem:view];
    return view;
}

@end
