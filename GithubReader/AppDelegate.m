//
//  AppDelegate.m
//  GithubReader
//
//  Created by azu on 2013/04/02.
//  Copyright (c) 2013年 azu. All rights reserved.
//

#import "AppDelegate.h"
#import "OAuthConfig.h"
#import "OAuthGithub.h"
#import "OAuthWindowController.h"

@implementation AppDelegate

- (void)launchMainView {
}

- (void)launchOAuthView {
    OAuthWindowController *oAuthWindowController = [[OAuthWindowController alloc] init];
    [[NSApplication sharedApplication] runModalForWindow:[oAuthWindowController window]];

}

- (void)applicationDidFinishLaunching:(NSNotification *) aNotification {
    // Insert code here to initialize your application
    if ([OAuthConfig accessToken].length > 0) {
        [self launchMainView];
    } else {
        [self launchOAuthView];
    }
}

- (void)awakeFromNib {
    [[NSAppleEventManager sharedAppleEventManager] setEventHandler:self andSelector:@selector(handleURLEvent:withReplyEvent:) forEventClass:kInternetEventClass andEventID:kAEGetURL];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleOAuthAuthentication:) name:@"OAuthAuthentication" object:nil];

}

- (void)handleOAuthAuthentication:(NSNotification *) notification {
    NSDictionary *userInfo = [notification userInfo];
    BOOL status = [userInfo[@"status"] boolValue];
    if (status) {
        NSLog(@"Success");
    }else{

    }
    [[NSApplication sharedApplication] stopModal];
}

// QuickWebView://open/?url=http://eow.alc.co.jp/search?q={query}
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
