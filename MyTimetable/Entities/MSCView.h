//
//  MSCView.h
//  MyTimetable
//
//  Created by Никита Б. Зуев on 07.06.13.
//  Copyright (c) 2013 Никита Б. Зуев. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MSCStorageItem.h"

@interface MSCView : NSObject <MSCStorageItem>

@property NSString* title;
@property NSDate* created;
@property NSMutableDictionary* tables;

- (BOOL)current;
- (BOOL)isNew;

@end
