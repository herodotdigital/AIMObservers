//
//  ViewController.m
//  Example
//
//  Created by Maciej Gad on 11.12.2015.
//  Copyright © 2015 All in Mobile. All rights reserved.
//

#import "ViewController.h"
#import "AIMNotificationObserver.h"
#import "AIMObserver.h"

@interface ViewController ()
@property (strong, nonatomic) AIMNotificationObserver *observer;
@property (strong, nonatomic) AIMObserver *kvoObserver;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    __weak __typeof(self) weakSelf = self;
    UIColor *color1 = [UIColor cyanColor];
    UIColor *color2 = [UIColor yellowColor];
    self.view.backgroundColor = color1;
    [self.button setTitleColor:color1 forState:UIControlStateNormal];
    
    self.observer = [AIMNotificationObserver observeName:@"changeBackground" onChange:^(NSNotification *notification) {
        if ([weakSelf.view.backgroundColor isEqual:color1]) {
            [UIView animateWithDuration:0.5 animations:^{
                weakSelf.view.layer.backgroundColor = color2.CGColor;
            }];
            
        } else {
            [UIView animateWithDuration:0.5 animations:^{
                weakSelf.view.layer.backgroundColor = color1.CGColor;
            }];
        }
    }];
    
    self.kvoObserver = [AIMObserver observed:self.view.layer keyPath:@"backgroundColor" onChange:^(NSDictionary *change) {
        UIColor *textColor = [weakSelf.button titleColorForState:UIControlStateNormal];
        if ([textColor isEqual:color1]) {
            textColor = color2;
        } else {
            textColor = color1;
        }
        [weakSelf.button setTitleColor:textColor forState:UIControlStateNormal];
    }];
}


- (IBAction)chnageBackgroundAction:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"changeBackground" object:nil];
}

@end
