//
// Created by azu on 2013/05/05.
//


#import "NotificationChannel.h"


const struct AppNotificationAttributes AppNotificationAttributes = {
    .OAuth = @"AppNotification.OAuth",
    .WebViewLoad = @"AppNotification.WebViewLoad"
};


const struct MessageListAttributes MessageListAttributes = {
    .reload = @"MessageList.reload",
    .keyEvent = @"MessageList.keyEvent",
    .loadIdentifier = @"MessageList.loadIdentifier"
};

@implementation NotificationChannel {

}

+ (void)addObserver:(id)observer name:(NSString *) name selector:(SEL)selector object:(NSString *) object {
    [[NSNotificationCenter defaultCenter] addObserver:observer selector:selector name:name object:object];
}
+ (void)postName:(NSString *) name object:(NSString *) object userInfo:(NSDictionary *) userInfo {
    [[NSNotificationCenter defaultCenter] postNotificationName:name object:object userInfo:userInfo];
}

@end