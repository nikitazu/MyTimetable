//
//  MSCKeyValue.h
//  MyTimetable
//
//  Created by Никита Б. Зуев on 07.06.13.
//  Copyright (c) 2013 Никита Б. Зуев. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MSCStorageItem.h"

@interface MSCKeyValue : NSObject <MSCStorageItem>

+ (MSCKeyValue*) kvWithKey: (NSString*)aKey
                  andValue: (id)aValue;

@property NSString* key;
@property id value;

@end
