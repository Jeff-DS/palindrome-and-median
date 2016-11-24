//
//  medianFinder.h
//  Objective-C practice
//
//  Created by Jeff Spingeld on 11/23/16.
//  Copyright © 2016 Jeff Spingeld. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "listItem.h"

@interface medianFinder : NSObject

@property (strong, nonatomic) listItem *head;

-(void)addNum:(int)num;
-(double)findMedian;

@end
