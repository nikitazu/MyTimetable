//
//  NSString+DateComponents.h
//  MyTimetable
//
//  Created by Никита Б. Зуев on 26.05.13.
//  Copyright (c) 2013 Никита Б. Зуев. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (DateComponents)

- (NSDateComponents*) dateComponentsWithAmount: (NSInteger)amount;

@end
