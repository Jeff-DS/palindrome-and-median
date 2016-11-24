//
//  medianFinder.m
//  Objective-C practice
//
//  Created by Jeff Spingeld on 11/23/16.
//  Copyright © 2016 Jeff Spingeld. All rights reserved.
//

#import "medianFinder.h"

@implementation medianFinder

// A class with two methods: addNum, which adds an integer to a collection of integers, and findMedian, which returns the median of the collection. Collection is implemented as a linked list.

-(void)addNum:(int)num {
    
    listItem *newItem = [[listItem alloc] initWithValue:num nextItem:nil];
    
    // If the linked list is empty, add the new item as the head. Otherwise, traverse the list and insert the new value before the first value that >= it (if any), else at the end
    if (!self.head) {
        self.head = newItem;
        return;
    }
    
    if (self.head.value >= num) {
        newItem.nextItem = self.head;
        self.head = newItem;
        return;
    }
    
    listItem *currentItem = self.head;
    while (currentItem.nextItem && currentItem.nextItem.value < num) {
        currentItem = currentItem.nextItem;
    }

    if (!currentItem.nextItem) {
        currentItem.nextItem = newItem;
        return;
    } else {
        newItem.nextItem = currentItem.nextItem;
        currentItem.nextItem = newItem;
        return;
    }

}

-(double)findMedian {
    
    // Convert list to array.
    
    NSMutableArray *array = [[NSMutableArray alloc] init];
    listItem *current = self.head;
    while (current.nextItem) {
        [array addObject:[NSNumber numberWithInteger:current.value]];
        current = current.nextItem;
    }
    [array addObject:[NSNumber numberWithInteger:current.value]];
    
    // only one value
    if (!self.head.nextItem) {
        return (double)self.head.value;
    }

    NSUInteger middleIndex = array.count / 2;
    
    // odd count (return the middle value)
    if (array.count % 2 != 0) {
        return [array[middleIndex] doubleValue];
    }
    
    // even count (return the mean of the two middle values)
    return (([array[middleIndex] doubleValue]) + [array[middleIndex-1] doubleValue]) / 2.0;
    
}


@end
