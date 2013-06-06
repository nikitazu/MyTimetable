//
//  MSCStorageItem.h
//  MyTimetable
//
//  Created by Никита Б. Зуев on 06.06.13.
//  Copyright (c) 2013 Никита Б. Зуев. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MSCStorageItem <NSObject>

/// @storageName should be unique inside catalog
- (NSString*) storageName;

@end
