//
// Created by azu on 2013/05/05.
//


#import "MainSplitView.h"
#import "NotificationConstant.h"


@implementation MainSplitView {

}
- (BOOL)acceptsFirstResponder {
    return YES;
}
- (void)keyDown:(NSEvent *) theEvent {
    [[NSNotificationCenter defaultCenter] postNotificationName:MessageListAttributes.keyEvent object:nil userInfo:@{
        @"theEvent" : theEvent
    }];
}

@end