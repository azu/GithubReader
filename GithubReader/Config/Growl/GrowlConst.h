//
// Created by azu on 2013/05/06.
//


#import <Foundation/Foundation.h>

extern const struct GrowlAttributes {
    __unsafe_unretained NSString *key;
} GrowlAttributes;


@interface GrowlConst : NSObject
+ (void)notifyTitle:(NSString *) title description:(NSString *) description context:(id) context;
@end