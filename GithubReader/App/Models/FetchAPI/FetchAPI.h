//
// Created by azu on 2013/05/05.
//


#import <Foundation/Foundation.h>

@class GHNotification;


@interface FetchAPI : NSObject
@property(nonatomic, strong) NSMutableDictionary *cacheTable;

- (void)fetchFromGHNotification:(GHNotification *) ghNotification;

- (void)loadToWebFromGHNotification:(GHNotification *) ghNotification;
@end