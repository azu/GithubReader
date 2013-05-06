//
// Created by azu on 2013/05/04.
//


#import <Growl/Growl.h>
#import "MessageListTableController.h"
#import "MessageListTableView.h"
#import "MessageCellView.h"
#import "MessageListDataController.h"
#import "GHNotification.h"
#import "GHNotificationSubject.h"
#import "NotificationChannel.h"
#import "GHNotificationRepository.h"
#import "FetchAPI.h"
#import "GrowlConst.h"
#import "NSArray+Funcussion.h"
#import "GrowlDelegate.h"
#import "GeneralPref.h"
#import "NIKFontAwesomeIconFactory.h"
#import "NIKFontAwesomeIconFactory+OSX.h"


@interface MessageListTableController ()
@property(nonatomic, strong) MessageListDataController *dataController;
@property(nonatomic, strong) NSTimer *refreshTimer;
@end

@implementation MessageListTableController

- (id)initWithCoder:(NSCoder *) coder {
    self = [super initWithCoder:coder];
    if (self == nil) {
        return nil;
    }

    self.dataController = [[MessageListDataController alloc] init];
    self.tableView.dataController = self.dataController;
    [self.dataController reloadDataSource];
    [self.dataController addObserver:self forKeyPath:@"dataList" options:NSKeyValueObservingOptionNew context:nil];
    [self.dataController addObserver:self forKeyPath:@"selectedIndex" options:NSKeyValueObservingOptionNew context:nil];

    // 繰り返しを設定
    [self.refreshTimer fire];
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    [NotificationChannel addObserver:self name:MessageListAttributes.reload selector:@selector(reloadMessageList) object:nil];
    [notificationCenter addObserver:self selector:@selector(handleKeyEvent:) name:MessageListAttributes.keyEvent object:nil];

    return self;
}

- (void)notifyDiffContent {
    __weak typeof (self) that = self;

    [GrowlApplicationBridge setGrowlDelegate:[GrowlDelegate new]];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [[that.dataController diffData] eachWithIndex:^(GHNotification *notification, NSUInteger index) {
            dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, 1ull * NSEC_PER_SEC * index);
            dispatch_after(time, dispatch_get_main_queue(), ^{
                [GrowlConst notifyTitle:notification.repository.fullName description:notification.subject.title];
            });
        }];
    });

}

- (void)handleKeyEvent:(NSNotification *) notification {
    NSEvent *theEvent = [notification userInfo][@"theEvent"];
    // リピートは無視する
    if ([theEvent isARepeat]) {
        return;
    }
    unichar unicodeKey = [[theEvent characters] characterAtIndex:0];
    if (theEvent.modifierFlags & NSCommandKeyMask) {
        switch (unicodeKey) {
            case 'r':
                [self reloadMessageList];
                break;
            default:
                break;
        }
    }
    switch (unicodeKey) {
        case 'j':
            [self.tableView moveToNextRow];
            break;
        case 'k':
            [self.tableView moveToPrevRow];
            break;
        default:
            break;
    }
}

- (NSTimer *)refreshTimer {
    if (_refreshTimer == nil) {
        NSInteger minute = [[GeneralPref refreshInterval] integerValue];
        _refreshTimer = [NSTimer scheduledTimerWithTimeInterval:60 * minute target:self selector:@selector(reloadMessageList) userInfo:nil repeats:YES];
    }
    return _refreshTimer;
}

- (void)reloadMessageList {
    [self.dataController reloadDataSource];
}

- (void)setTableView:(MessageListTableView *) tableView {
    _tableView = tableView;
    _tableView.dataController = self.dataController;
}

- (void)dealloc {
    [self.dataController removeObserver:self forKeyPath:@"dataList"];
    [self.refreshTimer invalidate];
}

- (void)observeValueForKeyPath:(NSString *) keyPath ofObject:(id) object change:(NSDictionary *) change
                       context:(void *) context {
    if ([keyPath isEqualToString:@"dataList"]) {
        [self updateTableView];
    } else if ([keyPath isEqualToString:@"selectedIndex"]) {
        [self loadWebViewFormCurrentData];
    }
}

- (void)updateTableView {
    [self.tableView reloadData];
    [self notifyDiffContent];
}

- (FetchAPI *)fetchAPIModel {
    if (_fetchAPIModel == nil) {
        _fetchAPIModel = [[FetchAPI alloc] init];
    }
    return _fetchAPIModel;
}

// resolve forward notification
- (void)preLoadData {
    NSInteger numberOfFetch = 1;
    NSUInteger currentIndex = self.dataController.selectedIndex;
    NSUInteger nextIndex = currentIndex + 1;
    NSUInteger lastFetchIndex = MAX([self.dataController countInList], currentIndex + numberOfFetch);
    for (NSInteger i = 0; i < numberOfFetch; i++) {
        NSUInteger targetIndex = nextIndex + i;
        if (targetIndex >= lastFetchIndex) {
            return;
        }
        GHNotification *notification = [self.dataController objectInListAtIndex:targetIndex];
        [self.fetchAPIModel fetchFromGHNotification:notification];
    }
}

- (void)loadWebViewFormCurrentData {
    GHNotification *notification = [self.dataController objectInListAtIndex:self.dataController.selectedIndex];
    [self preLoadData];
    [self.fetchAPIModel loadToWebFromGHNotification:notification];
}

#pragma mark - NSTableViewDataSource

- (NSInteger)numberOfRowsInTableView:(NSTableView *) tableView {
    NSUInteger countInList = [self.dataController countInList];
    return countInList;
}


- (void)updateCell:(MessageCellView *) cell atColumn:(NSTableColumn *) tableColumn row:(NSInteger) row {
    GHNotification *notificationBaseClass = [self.dataController objectInListAtIndex:(NSUInteger)row];
    cell.titleTextField.stringValue = notificationBaseClass.repository.fullName;
    cell.toolTip = notificationBaseClass.repository.repositoryDescription;
    cell.subjectTextField.stringValue = notificationBaseClass.subject.title;
    cell.layer.borderWidth = 1.0f;
    cell.layer.borderColor = [NSColor grayColor].CGColor;
    [cell setIconType:notificationBaseClass.subject.type];

}

- (NSView *)tableView:(NSTableView *) tableView viewForTableColumn:(NSTableColumn *) tableColumn row:(NSInteger) row {
    NSView *customView = [tableView makeViewWithIdentifier:NSStringFromClass([MessageCellView class]) owner:self];
    [self updateCell:(MessageCellView *)customView atColumn:tableColumn row:row];
    return customView;
}

- (BOOL)tableView:(NSTableView *) tableView shouldSelectRow:(NSInteger) row {
    [self.dataController setSelectedIndex:(NSUInteger)row];
    return YES;
}

@end