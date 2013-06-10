//
//  MSCTimeTableInputGen.h
//  MyTimetable
//
//  Created by Никита Б. Зуев on 10.06.13.
//  Copyright (c) 2013 Никита Б. Зуев. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MSCTimeTableInput.h"

@interface MSCTimeTableInputGen : NSObject

+ (MSCTimeTableInput*)generate;
+ (NSArray*)generateWithCounterOf: (NSUInteger)max;

@end
