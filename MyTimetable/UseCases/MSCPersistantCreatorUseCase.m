//
//  MSCPersistantCreatorUseCase.m
//  MyTimetable
//
//  Created by Никита Б. Зуев on 07.06.13.
//  Copyright (c) 2013 Никита Б. Зуев. All rights reserved.
//

#import "MSCPersistantCreatorUseCase.h"

@implementation MSCPersistantCreatorUseCase

@synthesize catalog;

- (void) addItem: (id<MSCStorageItem>)item
{
    if (catalog != nil) {
        [self.storage add:item to:self.catalog];
    }
}

@end
