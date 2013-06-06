//
//  MSCStorage.h
//  MyTimetable
//
//  Created by Никита Б. Зуев on 06.06.13.
//  Copyright (c) 2013 Никита Б. Зуев. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MSCStorageItem.h"

@protocol MSCStorage <NSObject>

- (id)find: (NSString*)name
        in: (NSString*)catalog;

- (void)add: (id<MSCStorageItem>)item
         to: (NSString*)catalog;

- (void)remove: (NSString*)name
          from: (NSString*)catalog;

//- (void)replace: (id<MSCStorageItem>)item
//             in: (NSString*)catalog;

- (void)move: (NSString*)name
        from: (NSString*)oldCatalog
          to: (NSString*)newCatalog;

@end
