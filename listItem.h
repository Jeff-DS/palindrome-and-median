//
//  listItem.h
//  Objective-C practice
//
//  Created by Jeff Spingeld on 11/23/16.
//  Copyright © 2016 Jeff Spingeld. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface listItem : NSObject

@property (strong, nonatomic) listItem *nextItem;
@property (nonatomic) NSInteger value;

- (instancetype)initWithValue:(int)value nextItem:(listItem *)nextItem;

@end
