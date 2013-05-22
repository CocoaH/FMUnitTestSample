//
//  NSDateIntervalsTests.m
//  FMFramework
//
//  Created by Florian Mielke on 19.05.13.
//  Copyright (c) 2013 madeFM. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "NSDate+Intervals.h"


@interface NSDateIntervalsTests : SenTestCase

@property (nonatomic, strong) NSDate *sut;

@end



@implementation NSDateIntervalsTests

#pragma mark -
#pragma mark Fixture

- (void)setUp
{
    [super setUp];
    
    NSDate *date = [NSDate dateWithTimeIntervalSinceReferenceDate:0];
    [self setSut:date];
}


- (void)tearDown
{
    [self setSut:nil];
    
    [super tearDown];
}



#pragma mark -
#pragma mark Days to date

- (void)testDaysToDateDoesNotAcceptNilDate
{
    STAssertEquals([[self sut] daysToDate:nil], NSNotFound, nil);
}


- (void)testDaysToDateReturns1DayForDateIn1Day
{
    // Given
    NSDate *futureOneDay = [NSDate dateWithTimeIntervalSinceReferenceDate:86400];
    
    // Then
    STAssertEquals([[self sut] daysToDate:futureOneDay], 1, nil);
}


- (void)testDaysToDateReturns0DaysForReferenceDate
{
    // Given
    NSDate *onReferenceDate = [NSDate dateWithTimeIntervalSinceReferenceDate:7200];
    
    // Then
    STAssertEquals([[self sut] daysToDate:onReferenceDate], 0, nil);
}


- (void)testDaysToDateReturnsMinus5DaysForDateBefore5Days
{
    // Given
    NSDate *pastFiveDays = [NSDate dateWithTimeIntervalSinceReferenceDate:-432000];
    
    // Then
    STAssertEquals([[self sut] daysToDate:pastFiveDays], -5, nil);
}


@end
