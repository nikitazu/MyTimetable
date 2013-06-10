//
//  MSCNumberGen.h
//  MyTimetable
//
//  Created by Никита Б. Зуев on 10.06.13.
//  Copyright (c) 2013 Никита Б. Зуев. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MSCNumberGen : NSObject

+ (long)number;
+ (long)numberLessThan: (NSUInteger)max;
+ (long)numberLessThan: (NSUInteger)max
              MoreThan: (NSUInteger)min;
+ (long)numberWithDigitsOf: (NSUInteger)digits;

@end
