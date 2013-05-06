//
// Created by azu on 2013/05/06.
//


#import <WebKit/WebKit.h>
#import "CustomTitleBar.h"


@implementation CustomTitleBar {

}
- (void)awakeFromNib {
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc addObserver:self
        selector:@selector(progressStarted:)
        name:WebViewProgressStartedNotification
        object:nil];
    [nc addObserver:self
        selector:@selector(progressFinished:)
        name:WebViewProgressFinishedNotification
        object:nil];
}

- (void)progressStarted:(NSNotification *) notification {
    [self.progressIndicator startAnimation:self];
}

- (void)progressFinished:(NSNotification *) notification {
    [self.progressIndicator stopAnimation:self];
}

@end