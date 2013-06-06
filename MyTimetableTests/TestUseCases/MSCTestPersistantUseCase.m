//
//  MSCTestPersistantUseCase.m
//  MyTimetable
//
//  Created by Никита Б. Зуев on 06.06.13.
//  Copyright (c) 2013 Никита Б. Зуев. All rights reserved.
//

#import "MSCTestPersistantUseCase.h"
#import "MSCPersistantUseCase.h"

@implementation MSCTestPersistantUseCase
{
    MSCPersistantUseCase* uc;
}

- (void)setUp
{
    [super setUp];
    uc = [[MSCPersistantUseCase alloc]init];
}

- (void)tearDown
{
    uc = nil;
    [super tearDown];
}

- (void)testPersistantStorageInit
{
    STAssertNotNil(uc.storage, @"Persistant use case should have initalized storage");
}


@end
