//
//  MSCTimeTableItem.h
//  MyTimetable
//
//  Created by Никита Б. Зуев on 20.05.13.
//  Copyright (c) 2013 Никита Б. Зуев. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MSCTimeTableItem : NSObject

@property NSDate* at;
@property NSArray* values;

- (id)initWithOneValueAt: (NSDate*)aDate;

@end
