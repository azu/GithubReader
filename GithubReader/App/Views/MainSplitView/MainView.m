//
// Created by azu on 2013/05/05.
//


#import "MainView.h"


@implementation MainView {

}
- (BOOL)acceptsFirstResponder {
    return YES;
}
- (void)keyDown:(NSEvent *) theEvent {
    unichar unicodeKey = [[theEvent characters] characterAtIndex:0];
    NSLog(@"unicodeKey = %hu", unicodeKey);
}

@end