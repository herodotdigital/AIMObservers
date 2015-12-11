//
//  ViewController.m
//  Example
//
//  Created by Maciej Gad on 11.12.2015.
//  Copyright © 2015 All in Mobile. All rights reserved.
//

#import "ViewController.h"
#import "AIMNotificationObserver.h"

@interface ViewController ()
@property (strong, nonatomic) AIMNotificationObserver *observer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    __weak __typeof(self) weakSelf = self;
    UIColor *color1 = [UIColor cyanColor];
    UIColor *color2 = [UIColor yellowColor];
    self.view.backgroundColor = color1;
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
}


- (IBAction)chnageBackgroundAction:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"changeBackground" object:nil];
}

@end
