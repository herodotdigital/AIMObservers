//
//  AIMNotificationObserver.h
//
//  Created by Maciej Gad on 05.08.2015.
//  Copyright (c) 2015 All in Mobile. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 notification observer used as alternative for `[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getNotification:) name:name object:sender]`, it is guaranteed that observer is removed when object is deallocated  
*/
@interface AIMNotificationObserver : NSObject



/**
 observe notification for name, call block passed as `onChange` parameter, *remember to use `weak` pointer to `self` within this block*
 @param name name 
 @param onChange block called for each notification 
*/
+ (instancetype)observeName:(NSString *)name onChange:(void(^)(NSNotification *notification))onChange;

/**
 observe notification for name and specified sender, call block passed as `onChange` parameter, *remember to use `weak` pointer to `self` within this block*
 @param name name 
 @param sender sender 
 @param onChange block called for each notification  
*/
+ (instancetype)observeName:(NSString *)name sender:(id)sender onChange:(void(^)(NSNotification *notification))onChange;

- (instancetype)init NS_UNAVAILABLE;


@end
