//
// Created by azu on 2013/05/05.
//


#import <Foundation/Foundation.h>

@class GHNotification;


@interface MessageListDataController : NSObject
@property(nonatomic, strong) NSArray *dataList;
@property(nonatomic) NSUInteger selectedIndex;

- (NSUInteger)countInList;

- (GHNotification *)objectInListAtIndex:(NSUInteger) theIndex;

- (void)reloadDataSource;
@end