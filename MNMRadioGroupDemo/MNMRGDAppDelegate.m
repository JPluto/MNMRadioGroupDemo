/*
 * Copyright (c) 2012 Mario Negro Martín
 * 
 * Permission is hereby granted, free of charge, to any person obtaining
 * a copy of this software and associated documentation files (the
 * "Software"), to deal in the Software without restriction, including
 * without limitation the rights to use, copy, modify, merge, publish,
 * distribute, sublicense, and/or sell copies of the Software, and to
 * permit persons to whom the Software is furnished to do so, subject to
 * the following conditions:
 * 
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
 * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
 * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
 * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE. 
 */

#import "MNMRGDAppDelegate.h"
#import "MNMRGDViewController.h"

@implementation MNMRGDAppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;

#pragma mark -
#pragma mark Memory management

/**
 * Deallocates memory
 */
- (void)dealloc {
    [_window release];
    _window = nil;
    
    [_viewController release];
    _viewController = nil;
    
    [super dealloc];
}

#pragma mark -
#pragma mark UIApplicationDelegate

/**
 * Tells the delegate when the application has launched and may have additional launch options to handle.
 *
 * @param application: The delegating application object.
 * @param launchOptions: A dictionary indicating the reason the application was launched (if any).
 * @return NO if the application cannot handle the URL resource, otherwise return YES.
 */
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    self.viewController = [[[MNMRGDViewController alloc] initWithNibName:@"MNMRGDViewController" bundle:nil] autorelease];
    self.window.rootViewController = self.viewController;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end