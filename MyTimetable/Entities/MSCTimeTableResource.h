//
//  MSCTimeTableResource.h
//  MyTimetable
//
//  Created by Никита Б. Зуев on 06.06.13.
//  Copyright (c) 2013 Никита Б. Зуев. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MSCTimeTableResource : NSObject

@property NSString* type;
@property NSArray* supplies;
@property NSArray* consumes;

- (id)initWithAmount: (NSString*) amount
              ofType: (NSString*) aType;

- (NSDecimalNumber*) amount;
- (NSDecimalNumber*) totalSupplies;
- (NSDecimalNumber*) totalConsumes;

@end