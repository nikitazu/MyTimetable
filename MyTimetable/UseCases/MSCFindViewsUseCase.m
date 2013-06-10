//
//  MSCFindViewsUseCase.m
//  MyTimetable
//
//  Created by Никита Б. Зуев on 07.06.13.
//  Copyright (c) 2013 Никита Б. Зуев. All rights reserved.
//

#import "MSCFindViewsUseCase.h"
#import "MSCKeyValueUseCase.h"

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
    if ([filter isEqualToString:@"new"]) {
        return [self.storage listItemsIn:@"views"];
    }
    
    return nil;
}

@end
