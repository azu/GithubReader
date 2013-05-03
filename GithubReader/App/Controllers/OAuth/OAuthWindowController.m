//
//  OAuthWindowController.m
//  GithubReader
//
//  Created by azu on 2013/04/02.
//  Copyright (c) 2013年 azu. All rights reserved.
//

#import "OAuthWindowController.h"
#import "OAuthGithub.h"
#import "OAuthGithubKeys.h"

@interface OAuthWindowController ()

@end

@implementation OAuthWindowController
- (id)init {
    self = [super initWithWindowNibName:@"OAuthWindowController"];
    if (self == nil) {
        return nil;
    }


    return self;
}


- (id)initWithWindow:(NSWindow *) window {
    self = [super initWithWindow:window];
    if (self) {
        // Initialization code here.
    }

    return self;
}

- (void)windowDidLoad {
    [super windowDidLoad];

    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}


- (IBAction)handleOAuthButton:(id) sender {

    NSString *scope = @"notifications";// read only
    NSString *state = [OAuthGithub generateState];
    [OAuthGithub sharedObject].state = state;
    [OAuthGithub sharedObject].enable = YES;
    NSString *urlString = [NSString stringWithFormat:@"https://github.com/login/oauth/authorize?client_id=%@&scope=%@&state=%@",
                                                     GithubAppAttributes.clientID, scope, state];
    NSURL *url = [NSURL URLWithString:urlString];
    [[NSWorkspace sharedWorkspace] openURL:url];
}

@end
