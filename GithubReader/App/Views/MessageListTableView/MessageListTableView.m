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
        default:
            [super keyDown:theEvent];
            break;
    }
}

- (void)moveToNextRow {
    NSUInteger nextRow = (NSUInteger)[self selectedRow] + 1;
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:nextRow];
    [self selectRowIndexes:indexSet byExtendingSelection:NO];
    [self scrollRowToVisible:nextRow];
    self.dataController.selectedIndex = nextRow;
}

@end