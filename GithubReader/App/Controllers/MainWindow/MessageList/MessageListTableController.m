//
// Created by azu on 2013/05/04.
//


#import "MessageListTableController.h"
#import "MessageListTableView.h"
#import "MessageCellView.h"
#import "MessageListDataController.h"
#import "GHNotification.h"
#import "GHNotificationSubject.h"
#import "NotificationConstant.h"
#import "GHNotificationRepository.h"


@interface MessageListTableController ()
@property(nonatomic, strong) MessageListDataController *dataController;
@end

@implementation MessageListTableController {

}
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

    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter addObserver:self selector:@selector(reloadMessageList) name:MessageListAttributes.reload object:nil];
    [notificationCenter addObserver:self selector:@selector(handleKeyEvent:) name:MessageListAttributes.keyEvent object:nil];

    return self;
}

- (void)handleKeyEvent:(NSNotification *) notification {
    NSEvent *theEvent = [notification userInfo][@"theEvent"];
    unichar unicodeKey = [[theEvent characters] characterAtIndex:0];
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

- (void)reloadMessageList {
    [self.dataController reloadDataSource];
}

- (void)setTableView:(MessageListTableView *) tableView {
    _tableView = tableView;
    _tableView.dataController = self.dataController;
}

- (void)dealloc {
    [self.dataController removeObserver:self forKeyPath:@"dataList"];
}

- (void)observeValueForKeyPath:(NSString *) keyPath ofObject:(id) object change:(NSDictionary *) change
                       context:(void *) context {
    if ([keyPath isEqualToString:@"dataList"]) {
        [self.tableView reloadData];
    } else if ([keyPath isEqualToString:@"selectedIndex"]) {
        [self loadWebViewFormCurrentData];
    }
}

- (void)loadWebViewFormCurrentData {
    GHNotification *notification = [self.dataController objectInListAtIndex:self.dataController.selectedIndex];
    [self.tableView loadToWebFormGHNotification:notification];
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