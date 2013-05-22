//
//  FMFakeNotificationCenter.h
//  FMTestFramework
//
//  Created by Florian Mielke on 14.04.13.
//  Copyright (c) 2013 madeFM. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 * A fake class to fake the behavior of NSNotificationCenter.
 */
@interface FMFakeNotificationCenter : NSObject

- (void)addObserver:(id)observer selector:(SEL)aSelector name:(NSString *)aName object:(id)anObject;

- (void)removeObserver:(id)observer;

- (void)postNotification:(NSNotification *)notification;

- (void)removeObserver:(id)observer name: (NSString *)aName object:(id)obj;

- (BOOL)hasObject:(id)observer forNotification:(NSString *)aName;

- (BOOL)didReceiveNotification:(NSString *)name fromObject:(id)obj;

@end
