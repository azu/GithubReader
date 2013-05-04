//
// Created by azu on 2013/05/04.
//


#import "MessageListTableView.h"
#import "GHNotification.h"
#import "GithubAPI.h"
#import "GHRepoComments.h"
#import "GHNotificationSubject.h"
#import "MessageListDataController.h"


@implementation MessageListTableView {

}


- (BOOL)acceptsFirstResponder {
    return YES;
}

- (void)loadToWebFormGHNotification:(GHNotification *) ghNotification {
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    [GithubAPI getAPI:ghNotification.subject.latestCommentUrl parameters:nil success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        GHRepoComments *repoComments = [GHRepoComments modelObjectWithDictionary:JSON];
        [notificationCenter postNotificationName:@"AZWebViewLoad" object:nil userInfo:@{
            @"URL" : repoComments.htmlUrl
        }];
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id o) {
        NSLog(@"error = %@", error);
    }];
}


- (void)keyDown:(NSEvent *) theEvent {
    unichar unicodeKey = [[theEvent characters] characterAtIndex:0];
    switch (unicodeKey) {
        case 'j':
            [self moveToNextRow];
            break;
        case 'k':
            [self moveToPrevRow];
            break;
        default:
            [super keyDown:theEvent];
            break;
    }
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
    self.dataController.selectedIndex = newRow;
}

@end