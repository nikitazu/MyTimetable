//
//  MSCPersistantCreatorUseCase.h
//  MyTimetable
//
//  Created by Никита Б. Зуев on 07.06.13.
//  Copyright (c) 2013 Никита Б. Зуев. All rights reserved.
//

#import "MSCPersistantUseCase.h"

@interface MSCPersistantCreatorUseCase : MSCPersistantUseCase

@property NSString* catalog;

- (void) addItem: (id<MSCStorageItem>)item;

@end
