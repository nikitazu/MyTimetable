//
//  MSCUpdateTimeTable.m
//  MyTimetable
//
//  Created by Никита Б. Зуев on 10.06.13.
//  Copyright (c) 2013 Никита Б. Зуев. All rights reserved.
//

#import "MSCUpdateTimeTableUseCase.h"
#import "MSCTimeTableItem.h"

@implementation MSCUpdateTimeTableUseCase

- (void)markTimeTable: (MSCTimeTable*)table
              atIndex: (NSUInteger)index
{
    if (table.items.count <= index) {
        return;
    }
    
    MSCTimeTableItem* item = table.items[index];
    if (item.done) {
        [item setAllUndone];
    } else {
        [item setAllDone];
    }
}

@end
