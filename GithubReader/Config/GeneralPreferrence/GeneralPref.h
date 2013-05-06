//
// Created by azu on 2013/05/06.
//


#import <Foundation/Foundation.h>


@interface GeneralPref : NSObject
// Default : 1min
+ (NSNumber *)refreshInterval;

+ (void)setRefreshInterval:(NSNumber *) value;
@end