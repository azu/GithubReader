//
//  MessageListTableController.h
//  GithubReader
//
//  Created by azu on 2013/05/03.
//  Copyright (c) 2013年 azu. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MessageListTableController : NSWindowController<NSTableViewDataSource,NSTableViewDelegate>

@property (weak, nonatomic) IBOutlet NSTableView *tableView;

@end
