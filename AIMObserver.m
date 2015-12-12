//
//  AIMObserver.m
//
//  Created by Maciej Gad on 29.07.2015.
//  Copyright (c) 2015 All in Mobile. All rights reserved.
//

#import "AIMObserver.h"
@interface AIMObserver ()

@property (strong, nonatomic) NSObject *observed;
@property (strong, nonatomic) NSString *keyPath;
@property (copy, nonatomic) void (^onChange)(NSDictionary *change);

@end

@implementation AIMObserver

+ (instancetype)observed:(NSObject *)obj keyPath:(NSString *)keyPath onChange:(void(^)(NSDictionary *change))onChange {
    if (!obj || !keyPath || !onChange) {
        return nil;
    }
    return [[AIMObserver alloc] initWithObserved:obj keyPath:keyPath onChange:onChange];
}

- (instancetype)initWithObserved:(NSObject *)obj keyPath:(NSString *)keyPath onChange:(void(^)(NSDictionary *))onChange{
    self = [super init];
    if (self) {
        self.observed = obj;
        self.keyPath = keyPath;
        self.onChange = onChange;
        [self startObserve];
    }
    return self;
}

- (instancetype)init {
    [NSException raise:@"Invalid method" format:@"use [AIMObserver observed:keyPath:onChange:] instead"];
    return nil;
}

- (void)startObserve{
    [self.observed addObserver:self forKeyPath:self.keyPath options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld|NSKeyValueObservingOptionInitial context:NULL];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if (![keyPath isEqualToString:self.keyPath]) {
        return;
    }
    if (!self.onChange) {
        return;
    }
    self.onChange(change);
}

- (void)dealloc {
    [self.observed removeObserver:self forKeyPath:self.keyPath];
}

@end
