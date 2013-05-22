//
//  UIDevicePlatformTests.m
//  FMFramework
//
//  Created by Florian Mielke on 09.04.13.
//  Copyright (c) 2013 madeFM. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "UIDevice+Platform.h"

#import <OCMock/OCMock.h>


@interface UIDevicePlatformTests : SenTestCase

@end


@implementation UIDevicePlatformTests


#pragma mark -
#pragma mark Platform identifier

- (void)testPlatformIdentifierReturnsIdentifierForSimulator
{
    STAssertEqualObjects([[UIDevice currentDevice] platformIdentifier], @"x86_64", nil);
}



#pragma mark -
#pragma mark Platform

- (void)testPlatformReturnsSimulatorString
{
    STAssertEqualObjects([[UIDevice currentDevice] platform], @"Simulator", nil);
}


- (void)testPlattformReturnsiPhoneString
{
    // Given
    id mockDevice = [OCMockObject mockForClass:[UIDevice class]];
    [[[mockDevice stub] andReturn:@"iPhone1,1"] platformIdentifier];
    
    // When
    [[[mockDevice expect] andReturn:@"iPhone 1G"] platform];
    [mockDevice platform];
    
    // Then
    [mockDevice verify];
}


@end
