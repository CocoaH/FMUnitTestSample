//
//  FMBankAccount.m
//  FMUnitTestSample
//
//  Created by Florian Mielke on 19.05.13.
//  Copyright (c) 2013 madeFM. All rights reserved.
//

#import "FMBankAccount.h"
#import "NSDate+Intervals.h"


@interface FMBankAccount ()

@property (nonatomic, strong) NSDate *dateOfLastBalance;

@end



@implementation FMBankAccount

#pragma mark -
#pragma mark Balance

- (void)setBalance:(NSNumber *)balance
{
    if (![_balance isEqualToNumber:balance])
    {
        if ([balance compare:@0] == NSOrderedAscending) {
            balance = @0;
        }
        
        _balance = balance;
    }
}



#pragma mark -
#pragma mark Balancing

- (BOOL)balancingAccount
{
    BOOL wasBalanced = NO;
    
    if ([self isValidForBalancing])
    {
        NSNumber *newBalance = @([[self balance] doubleValue] - [[self balancingFee] doubleValue]);
        [self setBalance:newBalance];
        
        [self setDateOfLastBalance:[NSDate date]];
        wasBalanced = YES;
    }
    
    return wasBalanced;
}


- (NSNumber *)balancingFee
{
    double calculatedFee = fabs([[self balance] doubleValue]) * 0.05;

    return @(calculatedFee);
}


- (BOOL)isValidForBalancing
{
    BOOL isValid = ([self dateOfLastBalance] == nil || [[self dateOfLastBalance] daysToDate:[NSDate date]] > 20);
    
    return isValid;
}

@end
