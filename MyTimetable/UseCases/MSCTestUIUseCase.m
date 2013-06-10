//
//  MSCTestUIUseCase.m
//  MyTimetable
//
//  Created by Никита Б. Зуев on 10.06.13.
//  Copyright (c) 2013 Никита Б. Зуев. All rights reserved.
//

#import "MSCTestUIUseCase.h"
#import "MSCCreateTimeTableUseCase.h"
#import "MSCCreateViewUseCase.h"

@implementation MSCTestUIUseCase
{
    MSCCreateTimeTableUseCase* _createTable;
    MSCCreateViewUseCase* _createView;
}

- (id)init
{
    self = [super init];
    if (self) {
        _createTable = [[MSCCreateTimeTableUseCase alloc] init];
        _createView = [[MSCCreateViewUseCase alloc] init];
    }
    return self;
}

- (void) createTestData
{
    MSCTimeTableInput* it1 = [[MSCTimeTableInput alloc] init];
    MSCTimeTableInput* it2 = [[MSCTimeTableInput alloc] init];
    MSCTimeTableInput* it3 = [[MSCTimeTableInput alloc] init];
    MSCTimeTableInput* it4 = [[MSCTimeTableInput alloc] init];
    
    it1.title = @"Table One";
    it2.title = @"Table Two";
    it3.title = @"Table Three";
    it4.title = @"Table Four";
    
    MSCViewInput* iv1 = [[MSCViewInput alloc] init];
    MSCViewInput* iv2 = [[MSCViewInput alloc] init];
    MSCViewInput* iv3 = [[MSCViewInput alloc] init];
    
    iv1.title = @"View One";
    iv2.title = @"View Two";
    iv3.title = @"View Three";
    
    MSCTimeTable* t1 = [_createTable createWithInput:it1];
    MSCTimeTable* t2 = [_createTable createWithInput:it2];
    MSCTimeTable* t3 = [_createTable createWithInput:it3];
    MSCTimeTable* t4 = [_createTable createWithInput:it4];
    
    [iv1.tables addObject:t1];
    [iv1.tables addObject:t2];
    [iv1.tables addObject:t3];
    [iv1.tables addObject:t4];
    [iv2.tables addObject:t1];
    [iv2.tables addObject:t2];
    [iv3.tables addObject:t3];
    [iv3.tables addObject:t4];
    
    [_createView createViewWithInput:iv1];
    [_createView createViewWithInput:iv2];
    [_createView createViewWithInput:iv3];
}

@end
