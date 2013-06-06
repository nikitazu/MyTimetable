//
//  MSCTimeTable.h
//  MyTimetable
//
//  Created by Никита Б. Зуев on 20.05.13.
//  Copyright (c) 2013 Никита Б. Зуев. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MSCStorageItem.h"

@interface MSCTimeTable : NSObject <MSCStorageItem>

@property NSString* title;
@property NSData* created;
@property NSArray* items;

@end
