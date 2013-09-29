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
- (id)init {
    self = [super init];
    if (self == nil) {
        return nil;
    }

    _selectedIndex = NSNotFound;
    _prevSelectedIndex = NSNotFound;

    return self;
}

- (NSUInteger)countInList {
    return [self.dataList count];
}

- (void)setSelectedIndex:(NSUInteger) selectedIndex {
    if (_prevSelectedIndex == NSNotFound) {
        _prevSelectedIndex = selectedIndex;
    }else{
        _prevSelectedIndex = _selectedIndex;
    }
    _selectedIndex = selectedIndex;
}

// search id
- (GHNotification *)objectInListForIdentifier:(NSString *) identifier {
    GHNotification *ghNotification = [self.dataList detect:^BOOL(GHNotification *localNotification) {
        if ([localNotification.internalBaseClassIdentifier isEqualToString:identifier]) {
            return YES;
        }
        return NO;
    }];
    return ghNotification;
}


- (NSUInteger)indexOfObject:(GHNotification *) ghNotification {
    return [self.dataList indexOfObject:ghNotification];
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
        return [NSArray array];
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

- (NSIndexSet *)diffIndexSet {
    NSArray *diffDataArray = [self diffData];
    if ([diffDataArray count] == 0) {
        return [NSIndexSet indexSet];
    }
    NSMutableIndexSet *indexSet = [NSMutableIndexSet indexSet];
    for (GHNotification *ghNotification in diffDataArray) {
        if ([self.dataList containsObject:ghNotification]) {
            [indexSet addIndex:[self.dataList indexOfObject:ghNotification]];
        }
    }
    return indexSet;
}

- (BOOL)isChangeSelection {
    GHNotification *selectedGHNotification = [self.old_dataList objectAtIndex:self.prevSelectedIndex];
    GHNotification *newSelectGHNotification = [self.dataList objectAtIndex:self.selectedIndex];
    if (selectedGHNotification != nil && newSelectGHNotification != nil) {
        return ![selectedGHNotification isEqualToNotification:newSelectGHNotification];
    }else {
        return YES;
    }
}

@end