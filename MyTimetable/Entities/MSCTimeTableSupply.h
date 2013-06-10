//
//  MSCTimeTableSupply.h
//  MyTimetable
//
//  Created by Никита Б. Зуев on 06.06.13.
//  Copyright (c) 2013 Никита Б. Зуев. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MSCTimeTableSupply : NSObject

@property NSDecimalNumber* amount;
@property NSString* comment;

+ (MSCTimeTableSupply*) supplyWithDecimal: (NSDecimalNumber*)decimalNumber;
+ (MSCTimeTableSupply*) supplyWithString: (NSString*)string;

@end
