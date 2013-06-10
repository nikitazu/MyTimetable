//
//  MSCCatalogsController.h
//  MyTimetable
//
//  Created by Никита Б. Зуев on 06.06.13.
//  Copyright (c) 2013 Никита Б. Зуев. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MSCCatalogsController : NSObject

@property NSArray* views;

- (IBAction)filterByNew:(id)sender;
- (IBAction)filterByCurrent:(id)sender;
- (IBAction)filterByOld:(id)sender;

@end
