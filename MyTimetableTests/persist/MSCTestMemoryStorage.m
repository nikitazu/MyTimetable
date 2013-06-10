//
//  MSCTestMemoryStorage.m
//  MyTimetable
//
//  Created by Никита Б. Зуев on 06.06.13.
//  Copyright (c) 2013 Никита Б. Зуев. All rights reserved.
//

#import "MSCMemoryStorage.h"
#import "MSCStorage.h"
#import "MSCKeyValue.h"
#import <SenTestingKit/SenTestingKit.h>

@interface MSCTestMemoryStorage : SenTestCase

@end

@implementation MSCTestMemoryStorage
{
    id<MSCStorage> storage;
    MSCKeyValue* kv;
}

- (void)setUp
{
    [super setUp];
    storage = [[MSCMemoryStorage alloc] init];
    kv = [MSCKeyValue kvWithKey:@"foo" andValue:@"bar"];
}

- (void)tearDown
{
    storage = nil;
    kv = nil;
    [super tearDown];
}

- (void)testAddTo
{
    [storage add: kv to: @"new"];
    id added = [storage find:kv.storageName in:@"new"];
    STAssertNotNil(added, @"added kv should not be nil");
    STAssertTrue([kv isEqualTo: added], @"added kv should be same as created");
}

- (void)testRemoveFrom
{
    [storage add: kv to: @"new"];
    [storage remove:kv.storageName from: @"new"];
    id added = [storage find:kv.storageName in:@"new"];
    STAssertNil(added, @"added kv should be nil, because it is removed");
}

- (void)testMoveFromTo
{
    [storage add: kv to: @"new"];
    [storage move: kv.storageName from: @"new" to: @"old"];
    id added = [storage find:kv.storageName in:@"old"];
    STAssertNotNil(added, @"added kv should not be nil");
    STAssertTrue([kv isEqualTo: added], @"added kv should be same as created");
}

- (void)testListItemsIn
{
    MSCKeyValue* k1 = [MSCKeyValue kvWithKey:@"foo" andValue:@"1"];
    MSCKeyValue* k2 = [MSCKeyValue kvWithKey:@"bar" andValue:@"2"];
    MSCKeyValue* k3 = [MSCKeyValue kvWithKey:@"buz" andValue:@"3"];
    
    [storage add: k1 to: @"foos"];
    [storage add: k2 to: @"foos"];
    [storage add: k3 to: @"foos"];
    
    NSArray* kvs = [storage listItemsIn: @"foos"];
    
    STAssertNotNil(kvs, @"kvs should not be nil");
    STAssertTrue(kvs.count == 3, @"3 tables should be created");
    STAssertTrue([k1 isEqualTo: kvs[0]], @"kv 1 should be found");
    STAssertTrue([k2 isEqualTo: kvs[1]], @"kv 2 should be found");
    STAssertTrue([k3 isEqualTo: kvs[2]], @"kv 3 should be found");
}

@end
