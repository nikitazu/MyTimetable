//
//  MSCKeyValueUseCase.h
//  MyTimetable
//
//  Created by Никита Б. Зуев on 10.06.13.
//  Copyright (c) 2013 Никита Б. Зуев. All rights reserved.
//

#import "MSCPersistantCreatorUseCase.h"

@interface MSCKeyValueUseCase : MSCPersistantCreatorUseCase

- (void) setValue: (NSString*) aValue forKey: (NSString*) aKey;
- (NSString*) valueForKey: (NSString*) key;

@end
