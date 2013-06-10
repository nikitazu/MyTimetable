//
//  MSCCatalogsController.m
//  MyTimetable
//
//  Created by Никита Б. Зуев on 06.06.13.
//  Copyright (c) 2013 Никита Б. Зуев. All rights reserved.
//

#import "MSCCatalogsController.h"
#import "MSCTestUIUseCase.h"
#import "MSCFindViewsPresenter.h"
#import "MSCKeyValueUseCase.h"
#import "MSCFindViewsUseCase.h"

@implementation MSCCatalogsController
{
    MSCKeyValueUseCase* _kv;
    MSCFindViewsUseCase* _find;
    MSCFindViewsPresenter* _fvp;
    MSCTestUIUseCase* _testUI;
}

@synthesize views;

- (id)init
{
    self = [super init];
    if (self) {
        _kv = [[MSCKeyValueUseCase alloc] init];
        _find = [[MSCFindViewsUseCase alloc] init];
        _fvp = [[MSCFindViewsPresenter alloc] init];
        _testUI = [[MSCTestUIUseCase alloc] init];
        [_testUI createTestData];
        [self filterByNew: nil];
    }
    return self;
}


- (IBAction)filterByNew:(id)sender
{
    [_kv setValue:@"new" forKey:@"filter"];
    self.views = [_fvp present:[_find findViews]];
}

- (IBAction)filterByCurrent:(id)sender
{
    [_kv setValue:@"current" forKey:@"filter"];
    self.views = [_fvp present:[_find findViews]];
}

- (IBAction)filterByOld:(id)sender
{
    [_kv setValue:@"old" forKey:@"filter"];
    self.views = [_fvp present:[_find findViews]];
}

@end
