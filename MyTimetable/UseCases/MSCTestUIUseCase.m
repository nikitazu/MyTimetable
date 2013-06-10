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
    NSArray* inputs = [MSCTimeTableInputGen generateWithCounterOf:10];
    NSMutableArray* tables = [NSMutableArray arrayWithCapacity:10];
    for (MSCTimeTableInput* input in inputs) {
        [tables addObject: [_createTable createWithInput: input]];
    }
    
    MSCViewInput* iv1 = [[MSCViewInput alloc] init];
    MSCViewInput* iv2 = [[MSCViewInput alloc] init];
    MSCViewInput* iv3 = [[MSCViewInput alloc] init];
    
    iv1.title = @"View One";
    iv2.title = @"View Two";
    iv3.title = @"View Three";
    
    [iv1.tables addObject:tables[0]];
    [iv1.tables addObject:tables[1]];
    [iv1.tables addObject:tables[2]];
    [iv1.tables addObject:tables[3]];
    
    [iv2.tables addObject:tables[0]];
    [iv2.tables addObject:tables[1]];
    
    [iv3.tables addObject:tables[2]];
    [iv3.tables addObject:tables[3]];
    [iv3.tables addObject:tables[4]];
    [iv3.tables addObject:tables[5]];
    [iv3.tables addObject:tables[6]];
    [iv3.tables addObject:tables[7]];
    [iv3.tables addObject:tables[8]];
    
    [_createView createViewWithInput:iv1];
    [_createView createViewWithInput:iv2];
    [_createView createViewWithInput:iv3];
}

@end
