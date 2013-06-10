//
//  MSCTestPersistantCreatorUseCase.m
//  MyTimetable
//
//  Created by Никита Б. Зуев on 07.06.13.
//  Copyright (c) 2013 Никита Б. Зуев. All rights reserved.
//

#import "MSCPersistantCreatorUseCase.h"
#import "MSCKeyValue.h"
#import "Context.h"
#import <SenTestingKit/SenTestingKit.h>

@interface MSCTestPersistantCreatorUseCase : SenTestCase

@end

@implementation MSCTestPersistantCreatorUseCase
{
    MSCPersistantCreatorUseCase* uc;
}

- (void)setUp
{
    [super setUp];
    [[Context singleton] reset];
    uc = [[MSCPersistantCreatorUseCase alloc]init];
}

- (void)tearDown
{
    uc = nil;
    [super tearDown];
}

- (void)testAddItem
{
    MSCKeyValue* item = [MSCKeyValue kvWithKey:@"foo" andValue:@"bar"];
    uc.catalog = @"items";
    [uc addItem: item];
    
    id saved = [uc.storage find:@"foo" in:@"items"];
    STAssertNotNil(saved, @"item should be saved");
    STAssertTrue([item isEqualTo:saved], @"item should equal to saved");
}

@end
