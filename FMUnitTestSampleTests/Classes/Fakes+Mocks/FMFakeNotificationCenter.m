//
//  FMFakeNotificationCenter.m
//  FMTestFramework
//
//  Created by Florian Mielke on 14.04.13.
//  Copyright (c) 2013 madeFM. All rights reserved.
//

#import "FMFakeNotificationCenter.h"


@interface FMFakeNotificationCenter ()

@property (nonatomic, strong) NSMutableDictionary *observers;
@property (nonatomic, strong) NSMutableArray *notifications;

@end



@implementation FMFakeNotificationCenter


#pragma mark -
#pragma mark Initialization

- (id)init
{
    self = [super init];

    if (self)
    {
        _observers = [NSMutableDictionary dictionary];
        _notifications = [NSMutableArray array];
    }
    
    return self;
}


- (void)addObserver:(id)observer selector:(SEL)aSelector name:(NSString *)aName object:(id)anObject
{
    [[self observers] setObject:observer forKey:aName];
}


- (void)removeObserver:(id)observer
{
    [[[self observers] copy] enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {

        if ([obj isEqual:observer]) {
            [[self observers] removeObjectForKey:key];
        }
        
    }];
}


- (void)removeObserver:(id)observer name:(NSString *)aName object:(id)obj
{
    [self removeObserver:observer];
}


- (BOOL)hasObject:(id)observer forNotification:(NSString *)aName
{
    return [[[self observers] objectForKey:aName] isEqual:observer];
}


- (void)postNotification:(NSNotification *)notification
{
    [[self notifications] addObject:notification];
}


- (BOOL)didReceiveNotification:(NSString *)name fromObject:(id)obj
{
    for (NSNotification *note in [self notifications])
    {
        if ([[note name] isEqualToString:name] && [[note object] isEqual:obj]) {
            return YES;
        }
    }
    
    return NO;
}


@end
