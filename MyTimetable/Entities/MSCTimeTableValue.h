//
//  MSCTimeTableValue.h
//  MyTimetable
//
//  Created by Никита Б. Зуев on 29.05.13.
//  Copyright (c) 2013 Никита Б. Зуев. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MSCTimeTableValue : NSObject

@property NSDate* at;
@property BOOL done;

- (id)initAt: (NSDate*) aDate;

@end
