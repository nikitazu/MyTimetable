//
//  MSCUseResourceUseCase.h
//  MyTimetable
//
//  Created by Никита Б. Зуев on 06.06.13.
//  Copyright (c) 2013 Никита Б. Зуев. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MSCTimeTableResource.h"

@interface MSCUseResourceUseCase : NSObject

- (void) supply: (MSCTimeTableResource*) resource
     withAmount: (NSDecimalNumber*) amount;

- (void) consume: (MSCTimeTableResource*) resource
        byAmount: (NSDecimalNumber*) amount;

@end
