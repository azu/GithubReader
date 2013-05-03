//
//  MessageListTableController.m
//  GithubReader
//
//  Created by azu on 2013/05/03.
//  Copyright (c) 2013年 azu. All rights reserved.
//

#import "MessageListTableController.h"
#import "MessageCellView.h"

@interface MessageListTableController ()
@property(nonatomic, strong) NSArray *items;
@end

@implementation MessageListTableController
- (id)init {
    self = [super init];
    if (self == nil) {
        return nil;
    }

    return self;
}

- (NSArray *)items {
    return @[@"a", @"f", @"f"];
}


#pragma mark - NSTableViewDataSource

- (NSInteger)numberOfRowsInTableView:(NSTableView *) tableView {
    return [[self items] count];
}


- (void)updateCell:(MessageCellView *) cell atColumn:(NSTableColumn *) tableColumn row:(NSInteger) row {

    cell.titleTextField.stringValue = @"test";
}

- (NSView *)tableView:(NSTableView *) tableView viewForTableColumn:(NSTableColumn *) tableColumn row:(NSInteger) row {
    NSView *customView = [tableView makeViewWithIdentifier:NSStringFromClass([MessageCellView class]) owner:self];
    [self updateCell:(MessageCellView *)customView atColumn:tableColumn row:row];

    return customView;
}

- (void)tableView:(NSTableView *) tableView setObjectValue:(id) object forTableColumn:(NSTableColumn *) tableColumn
              row:(NSInteger) row {
}

@end
