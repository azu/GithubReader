//
// Created by azu on 2013/05/06.
//


#import <SenTestingKit/SenTestingKit.h>

#import "Kiwi.h"
#import "MessageListDataController.h"

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
                it(@"return diff content", ^{
                    NSArray *result = [dataController diffData];
                    [result shouldBeNil];
                });
            });
            context(@"has not old data", ^{
                beforeEach(^{
                    dataController.dataList = @[@"a", @"b", @"c", @"d", @"e"];
                });
                it(@"return diff content", ^{
                    NSArray *result = [dataController diffData];
                    [result shouldBeNil];
                });
            });
            context(@"has both data", ^{
                beforeEach(^{
                    dataController.dataList = @[@"a", @"b", @"c", @"d", @"e"];
                    dataController.old_dataList = @[@"a", @"b", @"c"];
                });
                it(@"return diff content", ^{
                    NSArray *expectDiff = @[@"d", @"e"];
                    NSArray *result = [dataController diffData];
                    [[result should] equal:expectDiff];
                });
            });
        });
    });
}

@end