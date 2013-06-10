//
//  MSCCreateTimeTableUseCase.h
//  MyTimetable
//
//  Created by Никита Б. Зуев on 20.05.13.
//  Copyright (c) 2013 Никита Б. Зуев. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MSCPersistantCreatorUseCase.h"
#import "MSCTimeTable.h"
#import "MSCTimeTableItem.h"
#import "MSCTimeTableValue.h"
#import "MSCTimeTableInput.h"

@interface MSCCreateTimeTableUseCase : MSCPersistantCreatorUseCase

- (MSCTimeTable*) createWithInput: (MSCTimeTableInput*)input;

@end
