//
//  MSCFindViewsUseCase.m
//  MyTimetable
//
//  Created by Никита Б. Зуев on 07.06.13.
//  Copyright (c) 2013 Никита Б. Зуев. All rights reserved.
//

#import "MSCFindViewsUseCase.h"
#import "MSCKeyValueUseCase.h"
#import "MSCView.h"
#import "MSCTimeTable.h"
#import "MSCTimeTableItem.h"

@implementation MSCFindViewsUseCase
{
    MSCKeyValueUseCase* _kv;
}

- (id)init
{
    self = [super init];
    if (self) {
        _kv = [[MSCKeyValueUseCase alloc] init];
    }
    return self;
}

- (NSArray*) findViews
{
    NSString* filter = [_kv valueForKey:@"filter"];
    NSArray* items = [self.storage listItemsIn:@"views"];
    
    if ([filter isEqualToString:@"new"]) {
        return items;
    }
    
    if ([filter isEqualToString:@"current"]) {
        NSMutableArray* result = [NSMutableArray array];
        for (MSCView* view in items) {
            if (view.current) {
                [result addObject:view];
            }
        }
        return result;
    }
    
    return nil;
}

@end
