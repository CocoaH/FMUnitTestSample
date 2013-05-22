//
//  FMBankAccountTests.m
//  FMUnitTestSample
//
//  Created by Florian Mielke on 19.05.13.
//  Copyright (c) 2013 madeFM. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "FMBankAccount.h"

#import <OCMock/OCMock.h>


@interface FMBankAccountTests : SenTestCase

@property (nonatomic, strong) FMBankAccount *sut;

@end



@implementation FMBankAccountTests

#pragma mark -
#pragma mark Fixture

- (void)setUp
{
    [super setUp];
    
    FMBankAccount *bankAccount = [[FMBankAccount alloc] init];
    [self setSut:bankAccount];
}


- (void)tearDown
{
    [self setSut:nil];
    
    [super tearDown];
}



#pragma mark -
#pragma mark Initialization

- (void)testAccountIsInitialized
{
    STAssertNotNil([self sut], nil);
}



#pragma mark -
#pragma mark Naming

- (void)testAccountCanHaveAName
{
    // Given
    NSString *businessAccountName = @"My business account";
    
    // When
    [[self sut] setName:businessAccountName];
    
    // Then
    STAssertEqualObjects([[self sut] name], businessAccountName, nil);
}



#pragma mark -
#pragma mark Balance

- (void)testAccountCanHaveABalance
{
    // Given
    NSNumber *positiveBalance = @200;
    
    // When
    [[self sut] setBalance:positiveBalance];
    
    // Then
    STAssertEqualObjects([[self sut] balance], positiveBalance, nil);
}


- (void)testAccountDoesNotAcceptNegativeBalance
{
    // Given
    NSNumber *negativeBalance = @-200;
    
    // When
    [[self sut] setBalance:negativeBalance];
    
    // Then
    STAssertEqualObjects([[self sut] balance], @0, nil);
}



#pragma mark -
#pragma mark Date of last balancing

- (void)testDateOfLastBalancingIsNilByDefault
{
    STAssertNil([[self sut] valueForKey:@"dateOfLastBalancing"], nil);
}


- (void)testAccountCanHaveALastBalancingDate
{
    // Given
    NSDate *sampleDate = [NSDate dateWithTimeIntervalSinceNow:-18000];
    
    // When
    [[self sut] setValue:sampleDate forKey:@"dateOfLastBalancing"];
    
    // Then
    STAssertEqualObjects([[self sut] valueForKey:@"dateOfLastBalancing"], sampleDate, nil);
}



#pragma mark -
#pragma mark Balancing account

- (void)testBalancingAccountReturnsTrueWhenAccountWasBalanced
{
    STAssertTrue([[self sut] balancingAccount], nil);
}


- (void)testBalancingAccountReducesTheCurrentBalanceBy5Percent
{
    // Given
    [[self sut] setBalance:@200];
    
    // When
    [[self sut] balancingAccount];
    
    // Then
    STAssertEqualObjects([[self sut] balance], @190, nil);
}


- (void)testBalancingAccountDoesNotReduceTheCurrentBalanceWhenItsZero
{
    // Given
    [[self sut] setBalance:@0];
    
    // When
    [[self sut] balancingAccount];
    
    // Then
    STAssertEqualObjects([[self sut] balance], @0, nil);
}


- (void)testBalancingAccountDoesUpdateDateOfLastBalance
{
    // Given
    [[self sut] setBalance:@200];

    // When
    [[self sut] balancingAccount];
    
    // Then
    STAssertNotNil([[self sut] valueForKey:@"dateOfLastBalance"], nil);
}


- (void)testBalancingAccountReturnsFalseWhenAccountWasNotBalanced
{
    // Given
    id mockSut = [OCMockObject partialMockForObject:[self sut]];
    [[[mockSut stub] andReturnValue:OCMOCK_VALUE((BOOL){NO})] isValidForBalancing];
    
    // Then
    STAssertFalse([[self sut] balancingAccount], nil);
}



#pragma mark -
#pragma mark Balancing fee

- (void)testBalancingFeeReturns0ByDefault
{
    STAssertEqualObjects([[self sut] balancingFee], @0, nil);
}


- (void)testBalancingFeeReturns5ForAnAccountBalancOf100
{
    // Given
    [[self sut] setBalance:@100];
    
    // Then
    STAssertEqualObjects([[self sut] balancingFee], @5, nil);
}


- (void)testBalancingFeeReturnsPositiveFeeForNegativeBalance
{
    // Given
    id mockSut = [OCMockObject partialMockForObject:[self sut]];
    [[[mockSut stub] andReturn:@-100] balance];
    
    // Then
    STAssertEqualObjects([[self sut] balancingFee], @5, nil);
}



#pragma mark -
#pragma mark Is valid for balancing

- (void)testIsValidForBalancingReturnsTrueWhenNeverBalanced
{
    STAssertTrue([[self sut] isValidForBalancing], nil);
}

- (void)testIsValidForBalancingReturnsTrueForLastBalancing21DaysAgo
{
    // Given
    NSDate *twentyOneDaysBefore = [NSDate dateWithTimeIntervalSinceNow:-1814400];
    
    // When
    [[self sut] setValue:twentyOneDaysBefore forKey:@"dateOfLastBalance"];
    
    // Then
    STAssertTrue([[self sut] isValidForBalancing], nil);
}


- (void)testIsValidForBalancingReturnsFalseForLastBalancing20DaysAgo
{
    // Given
    NSDate *twentyOneDaysBefore = [NSDate dateWithTimeIntervalSinceNow:-1728000];
    
    // When
    [[self sut] setValue:twentyOneDaysBefore forKey:@"dateOfLastBalance"];
    
    // Then
    STAssertFalse([[self sut] isValidForBalancing], nil);
}

@end
