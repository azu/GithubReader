//
// Created by azu on 2013/05/05.
//


#import "FetchAPI.h"
#import "NotificationChannel.h"
#import "GHRepoComments.h"
#import "GithubAPI.h"
#import "GHNotification.h"
#import "GHNotificationSubject.h"


@implementation FetchAPI {
}
- (void)fetchFromGHNotification:(GHNotification *) ghNotification
                        success:(void (^)(NSString *htmlURL)) success {
    NSString *latestCommentURL = ghNotification.subject.latestCommentUrl;
    __weak typeof (self) that = self;
    if (that.cacheTable[latestCommentURL] != nil) {
        success(that.cacheTable[latestCommentURL]);
        return;
    }
    [GithubAPI getAPI:latestCommentURL parameters:nil success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        GHRepoComments *repoComments = [GHRepoComments modelObjectWithDictionary:JSON];
        // avoid difference thread access same value
        that.cacheTable[latestCommentURL] = [repoComments.htmlUrl copy];
        success([repoComments.htmlUrl copy]);
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id o) {
        NSLog(@"error = %@", error);
    }];
}

- (void)fetchFromGHNotification:(GHNotification *) ghNotification {
    NSString *latestCommentURL = ghNotification.subject.latestCommentUrl;
    __weak typeof (self) that = self;
    if (that.cacheTable[latestCommentURL] != nil) {
        return;
    }
    [self fetchFromGHNotification:ghNotification success:^(NSString *htmlURL) {
        that.cacheTable[latestCommentURL] = htmlURL;
    }];
}

- (void)loadToWebFromGHNotification:(GHNotification *) ghNotification {
    NSString *latestCommentURL = ghNotification.subject.latestCommentUrl;
    if (self.cacheTable[latestCommentURL] != nil) {
        [NotificationChannel postName:AppNotificationAttributes.WebViewLoad object:nil userInfo:@{
            AppNotificationAttributes.WebViewLoad : self.cacheTable[latestCommentURL]
        }];
        return;
    }
    // APIを叩いて取得する
    [GithubAPI getAPI:latestCommentURL parameters:nil success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        GHRepoComments *repoComments = [GHRepoComments modelObjectWithDictionary:JSON];
        [NotificationChannel postName:AppNotificationAttributes.WebViewLoad object:nil userInfo:@{
            AppNotificationAttributes.WebViewLoad : [repoComments.htmlUrl copy]
        }];
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id o) {
        NSLog(@"error = %@", error);
    }];
}

@end