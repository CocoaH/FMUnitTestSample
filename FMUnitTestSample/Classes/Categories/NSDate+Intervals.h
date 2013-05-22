//
//  NSDate+Intervals.h
//  FMUnitTestSample
//
//  Created by Florian Mielke on 19.05.13.
//  Copyright (c) 2013 madeFM. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSDate (Intervals)

/**
 * Returns the number of days between the receiver and another date.
 * @return NSInteger The number of days.
 */
- (NSInteger)daysToDate:(NSDate *)anotherDate;

@end
