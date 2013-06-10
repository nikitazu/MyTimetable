//
//  MSCTestKeyValueUseCase.m
//  MyTimetable
//
//  Created by Никита Б. Зуев on 10.06.13.
//  Copyright (c) 2013 Никита Б. Зуев. All rights reserved.
//

#import "MSCTestKeyValueUseCase.h"
#import "MSCKeyValueUseCase.h"
#import "Context.h"

@implementation MSCTestKeyValueUseCase
{
    MSCKeyValueUseCase* uc;
}

- (void)setUp
{
    [super setUp];
    [[Context singleton] reset];
    uc = [[MSCKeyValueUseCase alloc] init];
}

- (void)tearDown
{
    uc = nil;
    [super tearDown];
}

- (void)testValueForKeyThatIsNotSet
{
    STAssertNil([uc valueForKey:@"foo"], @"not set value should be nil");
}

- (void)testValueForNil
{
    STAssertNil([uc valueForKey:nil], @"value for nil should be nil");
}

- (void)testSetGet
{
    [uc setValue:@"100500" forKey:@"foo"];
    STAssertTrue([[uc valueForKey:@"foo"] isEqualToString:@"100500"],
                 @"value for foo should be 100500");
    
    [uc setValue:@"000" forKey:@"foo"];
    STAssertTrue([[uc valueForKey:@"foo"] isEqualToString:@"000"],
                 @"value for foo should change to 000");
    
    [uc setValue:@"xxx" forKey:@"bar"];
    STAssertTrue([[uc valueForKey:@"bar"] isEqualToString:@"xxx"],
                 @"value for bar should be xxx");
    
}

@end
