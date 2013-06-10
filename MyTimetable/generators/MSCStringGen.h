//
//  MSCStringGen.h
//  MyTimetable
//
//  Created by Никита Б. Зуев on 10.06.13.
//  Copyright (c) 2013 Никита Б. Зуев. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MSCStringGen : NSObject

+ (NSString*)stringStartingWith: (NSString*)string;
+ (NSString*)stringStartingWith: (NSString *)string
             withNumberLessThan: (NSUInteger)max;

@end
