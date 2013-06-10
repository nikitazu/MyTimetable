//
//  Context.h
//  MyTimetable
//
//  Created by Никита Б. Зуев on 07.06.13.
//  Copyright (c) 2013 Никита Б. Зуев. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MSCStorage.h"

@interface Context : NSObject

+ (Context*) singleton;

@property id<MSCStorage> storage;
@property id state;

- (void) reset;

@end
