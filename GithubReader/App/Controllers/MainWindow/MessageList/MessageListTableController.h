//
// Created by azu on 2013/05/04.
//


#import <Foundation/Foundation.h>

@class MessageListTableView;
@class GHNotification;
@class MessageListDataController;
@class FetchAPI;


@interface MessageListTableController : NSViewController <NSTableViewDelegate, NSTableViewDataSource>


@property(weak, nonatomic) IBOutlet MessageListTableView *tableView;

@property(nonatomic, strong) FetchAPI *fetchAPIModel;
@end