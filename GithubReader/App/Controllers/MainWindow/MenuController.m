//
// Created by azu on 2013/05/03.
//


#import "MenuController.h"
#import "OAuthWindowController.h"


@interface MenuController ()
@property(nonatomic, strong) OAuthWindowController *oAuthWindowController;
@end

@implementation MenuController {

}
- (IBAction)handleReloadButton:(id) sender {

}

- (IBAction)handleLoginButton:(id) sender {
    if (self.oAuthWindowController == nil) {
        self.oAuthWindowController = [[OAuthWindowController alloc] init];
    }
    [self.oAuthWindowController showWindow:self];
}

@end