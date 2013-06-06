//
//  MSCMemoryStorage.m
//  MyTimetable
//
//  Created by Никита Б. Зуев on 06.06.13.
//  Copyright (c) 2013 Никита Б. Зуев. All rights reserved.
//

#import "MSCMemoryStorage.h"

@implementation MSCMemoryStorage
{
    NSMutableDictionary* catalogs;
}

- (id)init
{
    self = [super init];
    if (self) {
        catalogs = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (id)find: (NSString*)name
        in: (NSString*)catalog
{
    NSDictionary* cat = [catalogs objectForKey:catalog];
    if (cat == nil) {
        return nil;
    }
    
    return [cat objectForKey: name];
}

- (void)add: (id<MSCStorageItem>)item
         to: (NSString*)catalog
{
    NSMutableDictionary* cat = [self ensureCatalogExists: catalog];
    [cat setObject:item
            forKey:[item storageName]];
}

- (void)remove: (NSString*)name
          from: (NSString*)catalog
{
    NSMutableDictionary* cat = [catalogs objectForKey:catalog];
    if (cat != nil) {
        [cat removeObjectForKey: name];
    }
}

/*- (void)replace: (id<MSCStorageItem>)item
             in: (NSString*)catalog
{
    // todo
}*/

- (void)move: (NSString*)name
        from: (NSString*)oldCatalog
          to: (NSString*)newCatalog
{
    id<MSCStorageItem> item = [self find: name in: oldCatalog];
    if (item == nil) {
        return;
    }
    
    [self add: item to: newCatalog];
    [self remove:item.storageName from:oldCatalog];
}

- (NSMutableDictionary*)ensureCatalogExists: (NSString*)catalog
{
    NSMutableDictionary* result = [catalogs objectForKey: catalog];
    
    if (result == nil) {
        result = [[NSMutableDictionary alloc] init];
        [catalogs setObject:result
                     forKey:catalog];
    }
    
    return result;
}

@end
