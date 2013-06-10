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
#import "MSCTimeTableInputGen.h"

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
    MSCTimeTableInput* it1 = [MSCTimeTableInputGen generate];
    MSCTimeTableInput* it2 = [MSCTimeTableInputGen generate];
    MSCTimeTableInput* it3 = [MSCTimeTableInputGen generate];
    MSCTimeTableInput* it4 = [MSCTimeTableInputGen generate];
    MSCTimeTableInput* it5 = [MSCTimeTableInputGen generate];
    MSCTimeTableInput* it6 = [MSCTimeTableInputGen generate];
    MSCTimeTableInput* it7 = [MSCTimeTableInputGen generate];
    MSCTimeTableInput* it8 = [MSCTimeTableInputGen generate];
    MSCTimeTableInput* it9 = [MSCTimeTableInputGen generate];
    
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
    MSCTimeTable* t5 = [_createTable createWithInput:it5];
    MSCTimeTable* t6 = [_createTable createWithInput:it6];
    MSCTimeTable* t7 = [_createTable createWithInput:it7];
    MSCTimeTable* t8 = [_createTable createWithInput:it8];
    MSCTimeTable* t9 = [_createTable createWithInput:it9];
    
    [iv1.tables addObject:t1];
    [iv1.tables addObject:t2];
    [iv1.tables addObject:t3];
    [iv1.tables addObject:t4];
    [iv2.tables addObject:t1];
    [iv2.tables addObject:t2];
    [iv3.tables addObject:t3];
    [iv3.tables addObject:t4];
    [iv3.tables addObject:t5];
    [iv3.tables addObject:t6];
    [iv3.tables addObject:t7];
    [iv3.tables addObject:t8];
    [iv3.tables addObject:t9];
    
    [_createView createViewWithInput:iv1];
    [_createView createViewWithInput:iv2];
    [_createView createViewWithInput:iv3];
}

@end
