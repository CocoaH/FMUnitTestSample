//
//  NSDate+Intervals.m
//  FMFramework
//
//  Created by Florian Mielke on 19.05.13.
//  Copyright (c) 2013 madeFM. All rights reserved.
//

#import "NSDate+Intervals.h"


@implementation NSDate (Intervals)


- (NSInteger)daysToDate:(NSDate *)anotherDate
{
    if (anotherDate == nil) {
        return NSNotFound;
    }
    
    NSDateComponents *dateComponents = [[NSCalendar currentCalendar] components:NSDayCalendarUnit fromDate:self toDate:anotherDate options:0];
    return [dateComponents day];
}


@end
