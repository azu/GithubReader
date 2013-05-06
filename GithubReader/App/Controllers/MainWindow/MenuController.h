//
// Created by azu on 2013/05/03.
//


#import <Foundation/Foundation.h>

@class OAuthWindowController;
@class MASPreferencesWindowController;


@interface MenuController : NSObject
@property(nonatomic, strong) MASPreferencesWindowController *preferencesWindow;

- (IBAction)handleReloadButton:(id) sender;

- (IBAction)displayPreferences:(id) sender;
@end