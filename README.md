# AIMObservers
Notifications and KVO observers used by AIM team

`AIMNotificationObserver` is a notification observer that should be used as alternative for `[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getNotification:) name:name object:sender]`.  `AIMObserver` is a KVO observer that should be used as an alternative for  `[obj addObserver:self forKeyPath:keyPath options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld|NSKeyValueObservingOptionInitial context:NULL];`. It is guaranteed that observer is removed when the object is deallocated.

#Usage

NSNotificationCenter observer:

```objective-c

@interface ViewController ()
@property (strong, nonatomic) AIMNotificationObserver *observer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    __weak __typeof(self) weakSelf = self;
    self.observer = [AIMNotificationObserver observeName:@"changeBackground" onChange:^(NSNotification *notification) {
        //use weakSelf to avoid strong reference cycles
        weakSelf.view.backgroundColor = [UIColor red];
    }];
}

@end

```

KVO observer:

```objective-c

@interface ViewController ()
@property (strong, nonatomic) AIMObserver *observer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    __weak __typeof(self) weakSelf = self;
    self.observer = [AIMObserver observed:self.view.layer keyPath:@"backgroundColor" onChange:^(NSDictionary *change) {
        //use weakSelf to avoid strong reference cycles
        [weakSelf.button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    }];
}

@end

```

#Installation

Use the [CocoaPods](http://github.com/CocoaPods/CocoaPods).

Add to your Podfile
>`pod 'AIMObservers'`

and then call

>`pod install`

and import 

>`#import "AIMNotificationObserver.h"`

or

>`#import "AIMObserver.h"`

#Example
In the example, `AIMNotificationObserver` is used to change the background of the main view, as respond to a notification and `AIMObserver` is used to change button text color, when background has changed (pretty lame usage, but in a real life application, you could use notification and KVO in a much more complicated way).

<img src="https://github.com/AllinMobile/Observers/raw/master/example.gif" width="280">
