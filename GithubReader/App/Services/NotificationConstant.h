//
// Created by azu on 2013/05/05.
//


#import <Foundation/Foundation.h>

extern const struct AppNotificationAttributes {
    __unsafe_unretained NSString *OAuth;
    __unsafe_unretained NSString *WebViewLoad;
} AppNotificationAttributes;
extern const struct MessageListAttributes {
    __unsafe_unretained NSString *reload;
    __unsafe_unretained NSString *keyEvent;
} MessageListAttributes;



@interface NotificationConstant : NSObject
@end