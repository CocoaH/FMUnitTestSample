//
//  FMBankAccount.h
//  FMUnitTestSample
//
//  Created by Florian Mielke on 19.05.13.
//  Copyright (c) 2013 madeFM. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * A bank account class represents real world bank accounts and behaviors.
 */
@interface FMBankAccount : NSObject

/**
 * The account's balance.
 * @note Will be reset (to 0) when try to set negative value.
 */
@property (nonatomic, strong) NSNumber *balance;

/**
 * Returns the date of the last balancing. Nil if the account was never balanced.
 */
@property (nonatomic, strong, readonly) NSDate *dateOfLastBalancing;

/**
 * The account's name.
 */
@property (nonatomic, copy) NSString *name;

/**
 * Calling this method reduces the current balance by a calculated fee.
 * @return Boolean YES if account was balanced, otherwise NO.
 */
- (BOOL)balancingAccount;

/**
 * Returns the fee for the current balance (5% of the balance).
 * @return NSNumber The fee to charge.
 */
- (NSNumber *)balancingFee;

/**
 * Returns a Boolean that indicates whether the receiver is valid for balancing or not.
 * @return Boolean YES if last balancing is older than 20 days, otherwise NO.
 */
- (BOOL)isValidForBalancing;

@end
