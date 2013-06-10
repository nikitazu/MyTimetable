//
//  MSCUpdateTimeTable.h
//  MyTimetable
//
//  Created by Никита Б. Зуев on 10.06.13.
//  Copyright (c) 2013 Никита Б. Зуев. All rights reserved.
//

#import "MSCPersistantUseCase.h"
#import "MSCTimeTable.h"

@interface MSCUpdateTimeTableUseCase : MSCPersistantUseCase

- (void)markTimeTable: (MSCTimeTable*)table atIndex: (NSUInteger)index;

@end
