//
// Created by azu on 2013/05/12.
//


#import "NSString+equalToKeyPath.h"


@implementation NSString (equalToKeyPath)
- (BOOL)isEqualToKeyPath:(SEL) selector {
    NSString *keyPath = NSStringFromSelector(selector);
    if ([self isEqualToString:keyPath]) {
        return YES;
    }
    return NO;
}
@end