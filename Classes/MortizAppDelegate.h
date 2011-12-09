//
//  MortizAppDelegate.h
//  Mortiz
//
//  Created by Brian King on 12/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MortizAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
   
    NSTimer *refreshTimer;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
- (void)openURLString:(NSString *)urlString;
@end

