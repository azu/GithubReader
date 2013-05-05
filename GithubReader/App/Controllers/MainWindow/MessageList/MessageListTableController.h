//
// Created by azu on 2013/05/04.
//


#import <Foundation/Foundation.h>

@class MessageListTableView;
@class GHNotification;
@class MessageListDataController;


@interface MessageListTableController : NSViewController <NSTableViewDelegate, NSTableViewDataSource>


@property(weak, nonatomic) IBOutlet MessageListTableView *tableView;

@end