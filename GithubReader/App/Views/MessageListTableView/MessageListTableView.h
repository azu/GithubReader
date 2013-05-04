//
// Created by azu on 2013/05/04.
//


#import <Foundation/Foundation.h>

@class GHNotification;
@class MessageListDataController;


@interface MessageListTableView : NSTableView

@property(nonatomic, strong) MessageListDataController *dataController;

- (void)loadToWebFormGHNotification:(GHNotification *) ghNotification;
@end