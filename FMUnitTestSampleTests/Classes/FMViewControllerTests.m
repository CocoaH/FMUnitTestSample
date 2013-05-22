//
//  FMViewControllerTests.m
//  FMUnitTestSample
//
//  Created by Florian Mielke on 19.05.13.
//  Copyright (c) 2013 madeFM. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "FMViewController.h"


@interface FMViewControllerTests : SenTestCase

@property (nonatomic, strong) FMViewController *sut;

@end


@implementation FMViewControllerTests


#pragma mark -
#pragma mark Fixture

- (void)setUp
{
    [super setUp];
    
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:[NSBundle bundleForClass:[self class]]];
    _sut = [mainStoryboard instantiateViewControllerWithIdentifier:FMViewControllerStoryboardIdentifier];
}


- (void)tearDown
{
    [self setSut:nil];
    
    [super tearDown];
}



#pragma mark -
#pragma mark Initialization

- (void)testControllerIsInitialized
{
    STAssertNotNil([self sut], nil);
}



@end
