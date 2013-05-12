//
// Created by azu on 2013/05/06.
//


#import <SenTestingKit/SenTestingKit.h>

#import "Kiwi.h"
#import "MessageListDataController.h"
#import "GHNotification.h"

@interface MessageListDataControllerSpec : KWSpec

@end

@implementation MessageListDataControllerSpec

+ (void)buildExampleGroups {
    describe(@"MessageListDataController", ^{
        __block MessageListDataController *dataController;
        beforeEach(^{
            dataController = [[MessageListDataController alloc] init];
        });
        describe(@"#diffData", ^{
            context(@"has not data", ^{
                it(@"return empty", ^{
                    NSArray *result = [dataController diffData];
                    [[result should] haveCountOf:0];
                });
            });
            context(@"has not old data", ^{
                beforeEach(^{
                    dataController.dataList = @[
                        [self GHNotificationWithID:@"a"],
                        [self GHNotificationWithID:@"b"]
                    ];
                });
                it(@"return empty", ^{
                    NSArray *result = [dataController diffData];
                    [[result should] haveCountOf:0];
                });
            });
            context(@"has both data", ^{
                GHNotification *newNotification = [self GHNotificationWithID:@"c"];
                beforeEach(^{
                    dataController.dataList = @[
                        [self GHNotificationWithID:@"a"],
                        [self GHNotificationWithID:@"b"],
                        newNotification
                    ];
                    dataController.old_dataList = @[
                        [self GHNotificationWithID:@"a"],
                        [self GHNotificationWithID:@"b"],
                    ];
                });
                it(@"return diff content", ^{
                    NSArray *expectDiff = @[newNotification];
                    NSArray *result = [dataController diffData];
                    [[result should] equal:expectDiff];
                });
            });
        });
        describe(@"#diffIndexSet", ^{
            context(@"has not data", ^{
                it(@"return diff content", ^{
                    NSIndexSet *result = [dataController diffIndexSet];
                    [[result should] haveCountOf:0];
                });
            });
            context(@"has not old data", ^{
                beforeEach(^{
                    dataController.dataList = @[
                        [self GHNotificationWithID:@"a"],
                        [self GHNotificationWithID:@"b"]
                    ];
                });
                it(@"return empty", ^{
                    NSIndexSet *result = [dataController diffIndexSet];
                    [[result should] haveCountOf:0];
                });
            });
            context(@"has both data", ^{
                GHNotification *newNotification = [self GHNotificationWithID:@"c"];
                beforeEach(^{
                    dataController.dataList = @[
                        [self GHNotificationWithID:@"a"],
                        [self GHNotificationWithID:@"b"],
                        newNotification
                    ];
                    dataController.old_dataList = @[
                        [self GHNotificationWithID:@"a"],
                        [self GHNotificationWithID:@"b"],
                    ];
                });
                it(@"return diff indexSet", ^{
                    NSIndexSet *expectIndexSet = [NSIndexSet indexSetWithIndex:[dataController.dataList indexOfObject:newNotification]];
                    NSIndexSet *result = [dataController diffIndexSet];
                    [[result should] equal:expectIndexSet];
                });
            });
        });
    });
}

+ (GHNotification *)GHNotificationWithID:(NSString *) identifier {
    GHNotification *ghNotification = [[GHNotification alloc] init];
    ghNotification.internalBaseClassIdentifier = identifier;

    return ghNotification;
}
@end