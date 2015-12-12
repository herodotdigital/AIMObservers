//
//  AIMObserver.h
//  Wajbah
//
//  Created by Maciej Gad on 29.07.2015.
//  Copyright (c) 2015 All in Mobile. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 helper class for KVO, used as alternative for `[obj addObserver:self forKeyPath:keyPath options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld|NSKeyValueObservingOptionInitial context:NULL];`, it is guaranteed that observer is removed when object is deallocated
*/
@interface AIMObserver : NSObject

/**
 observed object `obj` for `keyPath` and call block passed as `onChange` parameter, *remember to use `weak` pointer to `self` within this block*
 @param obj obj 
 @param keyPath key path 
 @param onChange on change
*/
+ (instancetype)observed:(NSObject *)obj keyPath:(NSString *)keyPath onChange:(void(^)(NSDictionary *change))onChange;

@end
