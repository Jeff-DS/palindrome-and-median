//
//  listItem.m
//  Objective-C practice
//
//  Created by Jeff Spingeld on 11/23/16.
//  Copyright © 2016 Jeff Spingeld. All rights reserved.
//

#import "listItem.h"

@implementation listItem

- (instancetype)initWithValue:(int)value nextItem:(listItem *)nextItem
{
    self = [super init];
    if (self) {
        self.value = value;
        self.nextItem = nextItem;
    }
    return self;
}

@end
