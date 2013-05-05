//
// Created by azu on 2013/05/05.
//


#import "MessageListDataController.h"
#import "GithubAPI.h"
#import "NSArray+Funcussion.h"
#import "GHNotification.h"


@interface MessageListDataController ()
@end

@implementation MessageListDataController {

}

- (NSUInteger)countInList {
    return [self.dataList count];
}

- (GHNotification *)objectInListAtIndex:(NSUInteger) theIndex {
    return [self.dataList objectAtIndex:theIndex];
}

- (void)reloadDataSource {
    __weak typeof (self) that = self;
    [[GithubAPI sharedClient].operationQueue cancelAllOperations];
    [GithubAPI getAPI:@"/notifications" parameters:@{
        @"all" : @YES
    } success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        NSArray *JSONResponse = JSON;
        that.dataList = [JSONResponse mapWithIndex:^id(id obj, NSUInteger idx) {
            return [GHNotification modelObjectWithDictionary:obj];
        }];
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id o) {
        NSLog(@"error = %@", error);
    }];
}


@end