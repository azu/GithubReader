//
// Created by azu on 2013/05/06.
//


#import "AZGrowlDelegate.h"
#import "NotificationChannel.h"


@implementation AZGrowlDelegate {

}


#pragma mark - Singleton methods

static AZGrowlDelegate *_sharedManager = nil;

+ (AZGrowlDelegate *)sharedManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedManager = [[self alloc] init];
    });
    return _sharedManager;
}

- (id)copyWithZone:(NSZone *) zone {
    return self;
}
- (id)init {
    self = [super init];
    if (self == nil) {
        return nil;
    }
    return self;
}

- (void)growlNotificationWasClicked:(id) clickContext {
    [NSApp activateIgnoringOtherApps:YES];
    id identifier = clickContext;
    [[NSNotificationCenter defaultCenter] postNotificationName:MessageListAttributes.loadIdentifier object:nil userInfo:@{
        MessageListAttributes.loadIdentifier : identifier
    }];

}

@end