//
//  MSCCreateViewUseCase.h
//  MyTimetable
//
//  Created by Никита Б. Зуев on 07.06.13.
//  Copyright (c) 2013 Никита Б. Зуев. All rights reserved.
//

#import "MSCPersistantCreatorUseCase.h"
#import "MSCView.h"
#import "MSCViewInput.h"

@interface MSCCreateViewUseCase : MSCPersistantCreatorUseCase

- (MSCView*)createViewWithInput: (MSCViewInput*)input;

@end
