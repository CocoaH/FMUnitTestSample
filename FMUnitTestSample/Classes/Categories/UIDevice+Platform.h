//
//  UIDevice+Platform.h
//  FMFramework
//
//  Created by Florian Mielke on 09.04.13.
//  Copyright (c) 2013 madeFM. All rights reserved.
//


/**
 * This category adds methods to UIDevice to determine more information about the current device.
 */
@interface UIDevice (Platform)

/**
 * The device platform identifier.
 * @note Possible examples are @"iPhone1,1" and @"iPod2,1".
 */
- (NSString *)platformIdentifier;

/**
 * The name of the device's platform.
 * @note Possible examples are @”iPhone 4” and @”iPad 2 (WiFi)”.
 */
- (NSString *)platform;

@end
