//
//  AIMNotificationObserver.m
//
//  Created by Maciej Gad on 05.08.2015.
//  Copyright (c) 2015 All in Mobile. All rights reserved.
//

#import "AIMNotificationObserver.h"
/**
 Typedef block for ChangeBlock
 */
typedef void (^ChangeBlock)(NSNotification *);

@interface AIMNotificationObserver ()

@property (strong, nonatomic) NSString *name;
@property (copy, nonatomic) void (^onChange)(NSNotification *notification);
@property (weak, nonatomic) id sender;
@end

@implementation AIMNotificationObserver

+ (instancetype)observeName:(NSString *)name onChange:(ChangeBlock)onChange {
    AIMNotificationObserver *observer = [[self alloc] initWithNotificationName:name sender:nil onChange:onChange];
    return observer;
}

+ (instancetype)observeName:(NSString *)name sender:(id)sender onChange:(ChangeBlock)onChange {
    AIMNotificationObserver *observer = [[self alloc] initWithNotificationName:name sender:sender onChange:onChange];
    return observer;
}

- (instancetype)initWithNotificationName:(NSString *)name sender:(id)sender onChange:(ChangeBlock)onChange {
    self = [super init];
    if (self) {
        self.name = name;
        self.sender = sender;
        self.onChange = onChange;
        [self startObserve];
    }
    return self;
}

- (instancetype)init {
    [NSException raise:@"Invalid method" format:@"use [AIMNotificationObserver observeName:sender:onChange:] instead"];
    return nil;
}

- (void)startObserve {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getNotification:) name:self.name object:self.sender];
}

- (void)getNotification:(NSNotification *)notification {
    if (self.onChange) {
        self.onChange(notification);
    }
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
