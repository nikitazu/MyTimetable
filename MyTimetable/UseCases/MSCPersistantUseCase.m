//
//  MSCPetsistantUseCase.m
//  MyTimetable
//
//  Created by Никита Б. Зуев on 06.06.13.
//  Copyright (c) 2013 Никита Б. Зуев. All rights reserved.
//

#import "MSCPersistantUseCase.h"
#import "MSCMemoryStorage.h"

@implementation MSCPersistantUseCase

- (id<MSCStorage>) storage
{
    return [MSCMemoryStorage singleton];
}

@end
