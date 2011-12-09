//
//  MortizAppDelegate.m
//  Mortiz
//
//  Created by Brian King on 12/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MortizAppDelegate.h"

@implementation MortizAppDelegate

@synthesize window;

- (void)openURLString:(NSString *)urlString
{
    NSURL *url = [NSURL URLWithString:urlString];
    BOOL can = [[UIApplication sharedApplication] canOpenURL:url];
    if (can)
        [[UIApplication sharedApplication] openURL:url];
}

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions 
{
    [NSClassFromString(@"FrankServer") setDefaultHttpPort:37264];
    
    // Override point for customization after application launch.
    
    // Set the navigation controller as the window's root view controller and display.

 
    UILabel *mortiz = [[[UILabel alloc] initWithFrame:self.window.bounds] autorelease];
    mortiz.textAlignment = UITextAlignmentCenter;
    mortiz.text = @"Mortiz";
    mortiz.font = [UIFont systemFontOfSize:32];
    
    [self.window addSubview:mortiz];
    [self.window makeKeyAndVisible];

    return YES;
}

- (void)refreshBackgroundTimer
{
    UIBackgroundTaskIdentifier backgroundID = [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:^(void) {
        [[UIApplication sharedApplication] endBackgroundTask:backgroundID];
    }];
}

- (void)applicationWillResignActive:(UIApplication *)application {
   
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    //
    // Force the app to run in the background
    // I was hoping to be able to make calls to the app in the background and
    // have openURL: work - it does not.
    //
    [self refreshBackgroundTimer];
    NSUInteger interval = 580; // 20 seconds before expiration
    refreshTimer = [NSTimer scheduledTimerWithTimeInterval:interval target:self selector:@selector(refreshBackgroundTimer) userInfo:nil repeats:YES];
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    [refreshTimer invalidate];
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    NSLog(@"Recieved %@ from %@ (%@)", url, sourceApplication, annotation);

    return YES;
}
#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
	[window release];
	[super dealloc];
}


@end

