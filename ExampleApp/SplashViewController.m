#import "SplashViewController.h"
#import "ASWaterfallManager.h"
#import "ASAdRequest.h"
#import "ASAdTypes.h"
#import "MainViewController.h"

@interface SplashViewController () <ASWaterfallDelegate, ASAdLoadDelegate>
@property (nonatomic, strong) UILabel *statusLabel;
@property (nonatomic, assign) BOOL finished;
@end

@implementation SplashViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;

    UILabel *label = [[UILabel alloc] initWithFrame:self.view.bounds];
    label.text = @"Loading Splash Ad...";
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = UIColor.darkGrayColor;
    label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:(self.statusLabel = label)];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self startLoadSplash];
}

- (void)startLoadSplash {
    // 使用 Pangle 的开屏位；替换 slotId 为你的真实值
    ASAdRequest *req = [ASAdRequest requestWithPlacementId:@"splash_pangle_001"
                                                   formats:@[@(ASAdFormatSplash)]
                                                    extras:@{ @"slotId": @"your_pangle_splash_slot_id" }];

    // 简单超时保护，避免首屏长时间停留
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (!self.finished) {
            NSLog(@"[Splash] timeout, fallback to main UI");
            [self finishToMain];
        }
    });

    [[ASWaterfallManager shared] loadWithRequest:req delegate:self];
}

#pragma mark - ASWaterfallDelegate

- (void)waterfallManager:(ASWaterfallManager *)mgr didLoadAd:(id)ad {
    if (self.finished) return;
    self.statusLabel.text = @"Ad loaded, presenting...";

    if ([ad respondsToSelector:@selector(presentFromViewController:completion:)]) {
        void (^completion)(BOOL, NSError *) = ^(BOOL success, NSError *error){
            if (!success) {
                NSLog(@"[Splash] present failed: %@", error);
            }
            [self finishToMain];
        };
        IMP imp = [ad methodForSelector:@selector(presentFromViewController:completion:)];
        void (*func)(id, SEL, UIViewController *, void(^)(BOOL, NSError *)) = (void *)imp;
        func(ad, @selector(presentFromViewController:completion:), self, completion);
    } else {
        [self finishToMain];
    }
}

- (void)waterfallManager:(ASWaterfallManager *)mgr didFailWithError:(NSError *)error {
    if (self.finished) return;
    NSLog(@"[Splash] load failed: %@", error);
    self.statusLabel.text = [NSString stringWithFormat:@"Load failed: %@", error.localizedDescription ?: @""];
    [self finishToMain];
}

#pragma mark - ASAdLoadDelegate 兼容

- (void)didFailToLoadWithError:(NSError *)error {
    if (self.finished) return;
    NSLog(@"[Splash] load failed (ASAdLoadDelegate): %@", error);
    self.statusLabel.text = [NSString stringWithFormat:@"Load failed: %@", error.localizedDescription ?: @""];
    [self finishToMain];
}

#pragma mark - Navigation

- (void)finishToMain {
    if (self.finished) return;
    self.finished = YES;

    UIViewController *main = [MainViewController new];
    UIWindow *window = UIApplication.sharedApplication.delegate.window;
    [UIView transitionWithView:window
                      duration:0.25
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:^{
        window.rootViewController = [[UINavigationController alloc] initWithRootViewController:main];
    } completion:nil];
}

@end