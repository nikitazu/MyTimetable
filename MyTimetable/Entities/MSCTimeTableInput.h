//
//  MSCTimeTableInput.h
//  MyTimetable
//
//  Created by Никита Б. Зуев on 03.06.13.
//  Copyright (c) 2013 Никита Б. Зуев. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MSCTimeTableInput : NSObject

@property NSString* title;
@property NSString* templateType;
@property NSString* everyType;
@property NSNumber* itemsCount;
@property NSNumber* valuesCount;
@property NSDate* startAt;
@property NSArray* valuesStartAt;
@property NSNumber* everyNth;

@end
