//
//  AppDelegate.h
//  GithubReader
//
//  Created by azu on 2013/04/02.
//  Copyright (c) 2013年 azu. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class WebView;
@class OAuthWindowController;
@class INAppStoreWindow;
@class CustomTitleBar;

@interface AppDelegate : NSObject <NSApplicationDelegate>
@property(weak) IBOutlet CustomTitleBar *titleCustomBarView;
@property(weak) IBOutlet INAppStoreWindow *window;
@property(weak) IBOutlet WebView *webView;

@end
