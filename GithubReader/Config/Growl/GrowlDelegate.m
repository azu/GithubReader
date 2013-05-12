//
// Created by azu on 2013/05/06.
//


#import "GrowlDelegate.h"


@implementation GrowlDelegate {

}
- (id)init {
    self = [super init];
    if (self == nil) {
        return nil;
    }

    [GrowlApplicationBridge setGrowlDelegate:self];

    return self;
}

- (void)growlNotificationWasClicked:(id) clickContext {
    NSLog(@"clickContext = %@", clickContext);
    [NSApp activateIgnoringOtherApps:YES];
}

@end