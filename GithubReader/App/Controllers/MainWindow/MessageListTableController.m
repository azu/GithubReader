//
//  MessageListTableController.m
//  GithubReader
//
//  Created by azu on 2013/05/03.
//  Copyright (c) 2013年 azu. All rights reserved.
//

#import "MessageListTableController.h"
#import "MessageCellView.h"
#import "GithubAPI.h"
#import "GHNotification.h"
#import "NSArray+Funcussion.h"
#import "GHNotificationSubject.h"
#import "GHNotificationRepository.h"
#import "GHRepoComments.h"

@interface MessageListTableController ()
@property(nonatomic, strong) NSArray *dateSource;
@end

@implementation MessageListTableController
- (id)init {
    self = [super init];
    if (self == nil) {
        return nil;
    }

    [self reloadDataSource];
    return self;
}

- (void)windowDidLoad {
    [super windowDidLoad];
    [self reloadDataSource];
}

- (void)reloadDataSource {
    __weak typeof (self) that = self;
    [GithubAPI getAPI:@"/notifications" parameters:@{
        @"all" : @YES
    } success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        NSArray *JSONResponse = JSON;
        that.dateSource = [JSONResponse mapWithIndex:^id(id obj, NSUInteger idx) {
            return [GHNotification modelObjectWithDictionary:obj];
        }];
        [that.tableView reloadData];
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id o) {
        NSLog(@"error = %@", error);
    }];
}
#pragma mark - NSTableViewDataSource

- (NSInteger)numberOfRowsInTableView:(NSTableView *) tableView {
    return [self.dateSource count];
}

- (void)updateCell:(MessageCellView *) cell atColumn:(NSTableColumn *) tableColumn row:(NSInteger) row {
    GHNotification *notificationBaseClass = [self.dateSource objectAtIndex:(NSUInteger)row];
    cell.titleTextField.stringValue = notificationBaseClass.subject.title;
}

- (NSView *)tableView:(NSTableView *) tableView viewForTableColumn:(NSTableColumn *) tableColumn row:(NSInteger) row {
    NSView *customView = [tableView makeViewWithIdentifier:NSStringFromClass([MessageCellView class]) owner:self];
    [self updateCell:(MessageCellView *)customView atColumn:tableColumn row:row];
    return customView;
}

- (void)tableView:(NSTableView *) tableView setObjectValue:(id) object forTableColumn:(NSTableColumn *) tableColumn
              row:(NSInteger) row {
    GHNotification *notificationBaseClass = [self.dateSource objectAtIndex:(NSUInteger)row];
}

- (BOOL)tableView:(NSTableView *) tableView shouldSelectRow:(NSInteger) row {

    GHNotification *notificationBaseClass = [self.dateSource objectAtIndex:(NSUInteger)row];
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    [GithubAPI getAPI:notificationBaseClass.subject.latestCommentUrl parameters:nil success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        GHRepoComments *repoComments = [GHRepoComments modelObjectWithDictionary:JSON];
        [notificationCenter postNotificationName:@"AZWebViewLoad" object:nil userInfo:@{
            @"URL" : repoComments.htmlUrl
        }];
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id o) {
        NSLog(@"error = %@", error);
    }];
    return YES;
}


@end
