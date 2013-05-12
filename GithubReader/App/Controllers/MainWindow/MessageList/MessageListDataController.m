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
// search id
- (GHNotification *)objectInListForIdentifier:(NSString *) identifier {
    GHNotification * ghNotification = [self.dataList detect:^BOOL(GHNotification *localNotification) {
        if ([localNotification.internalBaseClassIdentifier isEqualToString:identifier]) {
            return YES;
        }
        return NO;
    }];
    return ghNotification;
}

- (GHNotification *)objectInListAtIndex:(NSUInteger) theIndex {
    return [self.dataList objectAtIndex:theIndex];
}

- (void)reloadDataSource {
    __weak typeof (self) that = self;
    self.old_dataList = [self.dataList copy];
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

- (NSArray *)diffData {
    if (self.dataList == nil || [self.dataList count] == 0 || self.old_dataList == nil || [self.old_dataList count] == 0) {
        return nil;
    }

    // idの集合
    NSArray *oldIDs = [self.old_dataList valueForKeyPath:@"internalBaseClassIdentifier"];
    NSArray *results = [self.dataList filter:^BOOL(GHNotification *ghNotification) {
        if ([oldIDs containsObject:ghNotification.internalBaseClassIdentifier]) {
            return NO;
        }
        return YES;
    }];
    return results;
}

@end