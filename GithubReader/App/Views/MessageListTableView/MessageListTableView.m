//
// Created by azu on 2013/05/04.
//


#import "MessageListTableView.h"
#import "GHNotification.h"
#import "GithubAPI.h"
#import "GHRepoComments.h"
#import "GHNotificationSubject.h"
#import "MessageListDataController.h"
#import "NotificationChannel.h"


@interface MessageListTableView ()

@end

@implementation MessageListTableView {

}

- (BOOL)acceptsFirstResponder {
    return NO;// TODO: alternative...
}


- (void)moveToPrevRow {
    NSInteger selectedRow = [self selectedRow];
    if (selectedRow <= 0) {
        return;
    }
    NSUInteger prevRow = (NSUInteger)selectedRow - 1;
    [self moveToRow:prevRow];
}

- (void)moveToNextRow {
    NSInteger selectedRow = [self selectedRow];
    if (selectedRow >= [self numberOfRows] - 1) {
        return;
    }
    NSUInteger nextRow = (NSUInteger)selectedRow + 1;
    [self moveToRow:nextRow];
}

- (void)moveToRow:(NSUInteger) newRow {
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:newRow];
    [self selectRowIndexes:indexSet byExtendingSelection:NO];
    [self scrollRowToVisible:newRow];
    self.dataController.selectedIndex = newRow;// KVO => MessageListTableController
}

@end