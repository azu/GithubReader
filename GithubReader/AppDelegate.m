//
//  AppDelegate.m
//  GithubReader
//
//  Created by azu on 2013/04/02.
//  Copyright (c) 2013年 azu. All rights reserved.
//

#import <WebKit/WebKit.h>
#import "AppDelegate.h"
#import "OAuthConfig.h"
#import "OAuthGithub.h"
#import "OAuthWindowController.h"
#import "NotificationChannel.h"
#import "INAppStoreWindow.h"
#import "AZGrowlDelegate.h"

@interface AppDelegate ()
@property(nonatomic, strong) OAuthWindowController *oAuthWindowController;
@end

@implementation AppDelegate


- (void)launchOAuthView {

    if (self.oAuthWindowController == nil) {
        self.oAuthWindowController = [[OAuthWindowController alloc] init];
    }
    [self.oAuthWindowController showWindow:self];

}

- (void)applicationDidFinishLaunching:(NSNotification *) aNotification {
    // Insert code here to initialize your application
    if (![OAuthConfig hasAccessToken]) {
        [self launchOAuthView];
    }
}

- (void)awakeFromNib {
    self.window.titleBarHeight = 22.0f;
    self.window.titleBarView = self.titleCustomBarView;

    [GrowlApplicationBridge setGrowlDelegate:[AZGrowlDelegate sharedManager]];

    [[NSAppleEventManager sharedAppleEventManager] setEventHandler:self andSelector:@selector(handleURLEvent:withReplyEvent:) forEventClass:kInternetEventClass andEventID:kAEGetURL];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleOAuthAuthentication:) name:AppNotificationAttributes.OAuth object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleWebViewLoad:) name:AppNotificationAttributes.WebViewLoad object:nil];

}

- (void)handleWebViewLoad:(NSNotification *) notification {
    NSString *URL = notification.userInfo[@"URL"];
    [self.webView setMainFrameURL:URL];

}

- (void)handleOAuthAuthentication:(NSNotification *) notification {
    NSDictionary *userInfo = [notification userInfo];
    BOOL status = [userInfo[@"status"] boolValue];
    if (status) {
        NSLog(@"OAuth Success");
    } else {
        NSLog(@"OAuth Failure");
    }

    [[NSNotificationCenter defaultCenter] postNotificationName:MessageListAttributes.reload object:nil];
    [self.oAuthWindowController close];
}

- (void)handleURLEvent:(NSAppleEventDescriptor *) event withReplyEvent:(NSAppleEventDescriptor *) replyEvent {
    NSString *urlString = [[event paramDescriptorForKeyword:keyDirectObject] stringValue];
    NSURL *url = [NSURL URLWithString:urlString];
    if (![OAuthGithub sharedObject].enable) {
        return;
    }
    [self OAuthorizeWithURL:url];
}

- (void)OAuthorizeWithURL:(NSURL *) url {
    [OAuthGithub sharedObject].enable = NO;
    NSArray *queryComponents = [[url query] componentsSeparatedByString:@"&"];
    NSMutableDictionary *queries = [NSMutableDictionary dictionary];
    for (NSString *component in queryComponents) {
        NSArray *kv = [component componentsSeparatedByString:@"="];
        [queries setObject:[kv objectAtIndex:1] forKey:[kv objectAtIndex:0]];
    }
    [[OAuthGithub sharedObject] oauthWithCode:[queries objectForKey:@"code"] state:[queries objectForKey:@"state"]];
}

@end
