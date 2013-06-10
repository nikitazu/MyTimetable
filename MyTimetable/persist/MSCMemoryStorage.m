//
//  MSCMemoryStorage.m
//  MyTimetable
//
//  Created by Никита Б. Зуев on 06.06.13.
//  Copyright (c) 2013 Никита Б. Зуев. All rights reserved.
//


/*
 
 - on storage
  - tables
   - t1
   - t2
   - t3 (new)
  - views
   - v1 (tables/t1 + tables/t2)
   - v2 (tables/t2 + tables/archive/t4)
  - tables/archive
   - t4
   - t5
  - views/archive
   - v3 (tables/archive/t4 + tables/archive/t5)
 
 - on display (new)
  - timetables
   - tables
    - t3
 
 - on display (cur)
  - timetables
   - all
    - t1
    - t2
   - v1
    - t1
    - t2
   - v2
    - t3
    - t4
 
 - on display (old)
  - timetables
   - all
    - t4
    - t5
   - v3
    - t4
    - t5
 
 */

#import "MSCMemoryStorage.h"

@implementation MSCMemoryStorage
{
    NSMutableDictionary* _catalogs;
}

- (id)init
{
    self = [super init];
    if (self) {
        _catalogs = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (id) initEmpty
{
    self = [super init];
    if (self) {
        _catalogs = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (NSString*)currentCatalog
{
    return @"new";
}

- (NSArray*)currentItems
{
    id t1 = @{ @"name": @"T1" };
    id t2 = @{ @"name": @"T2" };
    id t3 = @{ @"name": @"T3" };
    id t4 = @{ @"name": @"T4" };
    
    id va = @{ @"name": @"all" };
    id v1 = @{ @"name": @"v1" };
    id v2 = @{ @"name": @"v2" };

    NSTreeNode* nva = [NSTreeNode treeNodeWithRepresentedObject:va];
    NSTreeNode* nv1 = [NSTreeNode treeNodeWithRepresentedObject:v1];
    NSTreeNode* nv2 = [NSTreeNode treeNodeWithRepresentedObject:v2];
    
    [nva.mutableChildNodes addObject: [NSTreeNode treeNodeWithRepresentedObject:t1]];
    [nva.mutableChildNodes addObject: [NSTreeNode treeNodeWithRepresentedObject:t2]];
    [nva.mutableChildNodes addObject: [NSTreeNode treeNodeWithRepresentedObject:t3]];
    [nva.mutableChildNodes addObject: [NSTreeNode treeNodeWithRepresentedObject:t4]];
    
    [nv1.mutableChildNodes addObject: [NSTreeNode treeNodeWithRepresentedObject:t1]];
    [nv1.mutableChildNodes addObject: [NSTreeNode treeNodeWithRepresentedObject:t2]];
    
    [nv2.mutableChildNodes addObject: [NSTreeNode treeNodeWithRepresentedObject:t1]];
    [nv2.mutableChildNodes addObject: [NSTreeNode treeNodeWithRepresentedObject:t3]];
    
    return @[nva, nv1, nv2];
}


- (id)find: (NSString*)name
        in: (NSString*)catalog
{
    NSDictionary* cat = [_catalogs objectForKey:catalog];
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
    NSMutableDictionary* cat = [_catalogs objectForKey:catalog];
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
    NSMutableDictionary* result = [_catalogs objectForKey: catalog];
    
    if (result == nil) {
        result = [[NSMutableDictionary alloc] init];
        [_catalogs setObject:result
                      forKey:catalog];
    }
    
    return result;
}

- (NSArray*)listItemsIn: (NSString*)catalog
{
    NSDictionary* cat = [_catalogs objectForKey:catalog];
    if (cat == nil) {
        return nil;
    }
    return [cat allValues];
}

@end
