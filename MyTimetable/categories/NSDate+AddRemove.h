//
//  NSDate+AddRemove.h
//  MyTimetable
//
//  Created by Никита Б. Зуев on 25.05.13.
//  Copyright (c) 2013 Никита Б. Зуев. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (AddRemove)

- (NSDate*) dateByAddingDays: (NSInteger)days;
- (NSDate*) dateByAddingWeeks: (NSInteger)weeks;
- (NSDate*) dateByAddingMonths: (NSInteger)months;
- (NSDate*) dateByAddingYears: (NSInteger)years;

- (NSDate*) tomorrow;

@end
