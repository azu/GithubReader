//
// Created by azu on 2013/05/03.
//


#import <MASPreferences/MASPreferencesWindowController.h>
#import "MenuController.h"
#import "OAuthWindowController.h"
#import "MASPreferencesWindowController.h"
#import "GeneralPreferencesViewController.h"


@interface MenuController ()
@property(nonatomic, strong) OAuthWindowController *oAuthWindowController;
@end

@implementation MenuController {
    MASPreferencesWindowController *_preferencesWindow;
}
- (IBAction)handleReloadButton:(id) sender {

}

- (IBAction)handleLoginButton:(id) sender {
    if (self.oAuthWindowController == nil) {
        self.oAuthWindowController = [[OAuthWindowController alloc] init];
    }
    [self.oAuthWindowController showWindow:self];
}

- (IBAction)displayPreferences:(id) sender {
    if (self.preferencesWindow == nil) {
        NSViewController *generalViewController = [[GeneralPreferencesViewController alloc] initWithNibName:@"GeneralPreferencesViewController" bundle:[NSBundle mainBundle]];
        NSArray *views = @[generalViewController];
        NSString *title = @"Preferences";
        self.preferencesWindow = [[MASPreferencesWindowController alloc] initWithViewControllers:views title:title];
    }
    [self.preferencesWindow showWindow:self];
}
@end