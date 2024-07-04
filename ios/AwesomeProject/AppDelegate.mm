#import "AppDelegate.h"

#import <React/RCTBundleURLProvider.h>

#import <BrazeKit/BrazeKit-Swift.h>
#import "BrazeReactBridge.h"

static Braze *_braze = nil;

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  self.moduleName = @"AwesomeProject";
  // You can add your custom initial props in the dictionary below.
  // They will be passed down to the ViewController used by React Native.
  self.initialProps = @{};

   // Setup Braze
  BRZConfiguration *configuration = [[BRZConfiguration alloc] initWithApiKey:@"d781e48b-40b3-4544-9cdc-fff77859d0e7"
                                                                    endpoint:@"sdk.iad-06.braze.com"];
  // Enable logging and customize the configuration here.
  configuration.logger.level = BRZLoggerLevelDebug;
  Braze *braze = [BrazeReactBridge initBraze:configuration];
  AppDelegate.braze = braze;

  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

#pragma mark - AppDelegate.braze


+ (Braze *)braze {
  return _braze;
}

+ (void)setBraze:(Braze *)braze {
  _braze = braze;
}

- (NSURL *)sourceURLForBridge:(RCTBridge *)bridge
{
  return [self bundleURL];
}

- (NSURL *)bundleURL
{
#if DEBUG
  return [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index"];
#else
  return [[NSBundle mainBundle] URLForResource:@"main" withExtension:@"jsbundle"];
#endif
}

@end
