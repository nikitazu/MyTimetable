//
//  MSCKeyValue.m
//  MyTimetable
//
//  Created by Никита Б. Зуев on 07.06.13.
//  Copyright (c) 2013 Никита Б. Зуев. All rights reserved.
//

#import "MSCKeyValue.h"

@implementation MSCKeyValue

@synthesize key;
@synthesize value;


+ (MSCKeyValue*) kvWithKey: (NSString*)aKey
                  andValue: (id)aValue
{
    MSCKeyValue* kv = [[MSCKeyValue alloc] init];
    if (kv) {
        kv.key = aKey;
        kv.value = aValue;
    }
    return kv;
}

- (NSString*) storageName
{
    return self.key;
}

- (BOOL) isEqualTo:(id)object
{
    return
        [self.key isEqualTo: [object key]] &&
        [self.value isEqualTo: [object value]];
}

@end
