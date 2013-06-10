//
//  MSCFindViewsPresenter.m
//  MyTimetable
//
//  Created by Никита Б. Зуев on 10.06.13.
//  Copyright (c) 2013 Никита Б. Зуев. All rights reserved.
//

#import "MSCFindViewsPresenter.h"
#import "MSCView.h"
#import "MSCTimeTable.h"

@implementation MSCFindViewsPresenter

- (NSArray*)present: (NSArray*)views
{
    NSMutableArray* result = [NSMutableArray array];
    for (MSCView* view in views) {
        NSTreeNode* viewNode = [NSTreeNode treeNodeWithRepresentedObject: view];
        
        for (NSString* tableKey in view.tables) {
            MSCTimeTable* table = [view.tables objectForKey:tableKey];
            NSTreeNode* tableNode = [NSTreeNode treeNodeWithRepresentedObject: table];
            [viewNode.mutableChildNodes addObject: tableNode];
        }
        
        [result addObject: viewNode];
    }
    return result;
}

@end
