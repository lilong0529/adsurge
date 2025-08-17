#import "MainViewController.h"

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Home";
    self.view.backgroundColor = UIColor.whiteColor;

    UILabel *label = [[UILabel alloc] initWithFrame:self.view.bounds];
    label.numberOfLines = 0;
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"AdSurge ExampleApp\nSplash fallback reached.";
    label.textColor = UIColor.darkTextColor;
    label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:label];
}

@end