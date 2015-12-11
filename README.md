# Observers
Notification observers used by AIM team

The notification observer should be used as alternative for `[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getNotification:) name:name object:sender]`. It is guaranteed that observer is removed when the object is deallocated.

#Usage

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

#Example
In the example, AIMNotificationObserver is used to change the background of the main view, as respond to a notification (pretty lame usage, but in real life application, you could use notification in a much more complicated way). 

<img src="https://github.com/AllinMobile/Observers/raw/master/example.gif" width="280">
