//
// Created by azu on 2013/05/06.
//


#import <Foundation/Foundation.h>
#import <Growl/Growl.h>


@interface GrowlDelegate : NSObject <GrowlApplicationBridgeDelegate>
- (void)growlNotificationWasClicked:(id) clickContext;
@end