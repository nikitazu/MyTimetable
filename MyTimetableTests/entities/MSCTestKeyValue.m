//
//  MSCTestKeyValue.m
//  MyTimetable
//
//  Created by Никита Б. Зуев on 07.06.13.
//  Copyright (c) 2013 Никита Б. Зуев. All rights reserved.
//

#import "MSCTestKeyValue.h"
#import "MSCKeyValue.h"

@implementation MSCTestKeyValue

- (void)testSameNameAndKey
{
    id k1 = [MSCKeyValue kvWithKey:@"foo" andValue:@"bar"];
    id k2 = [MSCKeyValue kvWithKey:@"foo" andValue:@"bar"];
    
    STAssertTrue([k1 isEqualTo: k2], @"foo/bar == foo/bar");
}

- (void)testSameNameDiffKeys
{
    id k1 = [MSCKeyValue kvWithKey:@"foo" andValue:@"bar 222"];
    id k2 = [MSCKeyValue kvWithKey:@"foo" andValue:@"bar 333"];
    
    STAssertFalse([k1 isEqualTo: k2], @"foo/bar 222 != foo/bar 333");
}

- (void)testDiffNamesDiffKeys
{
    id k1 = [MSCKeyValue kvWithKey:@"xxx" andValue:@"bar 222"];
    id k2 = [MSCKeyValue kvWithKey:@"yyy" andValue:@"bar 333"];
    
    STAssertFalse([k1 isEqualTo: k2], @"xxx/bar 222 != yyy/bar 333");
}

- (void)testDiffNamesSameKey
{
    id k1 = [MSCKeyValue kvWithKey:@"xxx" andValue:@"bar"];
    id k2 = [MSCKeyValue kvWithKey:@"yyy" andValue:@"bar"];
    
    STAssertFalse([k1 isEqualTo: k2], @"xxx/bar != yyy/bar");
}

@end
