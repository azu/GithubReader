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

- (void)fetchFromGHNotification:(GHNotification *) ghNotification {
    NSString *latestCommentURL = ghNotification.subject.latestCommentUrl;
    NSLog(@"latestCommentURL = %@", latestCommentURL);
    __weak typeof(self) that = self;
    if (that.cacheTable[latestCommentURL] != nil) {
        return;
    }
    [GithubAPI getAPI:latestCommentURL parameters:nil success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        GHRepoComments *repoComments = [GHRepoComments modelObjectWithDictionary:JSON];
        that.cacheTable[latestCommentURL] = repoComments.htmlUrl;
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id o) {
        NSLog(@"error = %@", error);
    }];
}

- (void)loadToWebFromGHNotification:(GHNotification *) ghNotification {
    NSString *latestCommentURL = ghNotification.subject.latestCommentUrl;
    if (self.cacheTable[latestCommentURL] != nil) {
        [NotificationChannel postName:AppNotificationAttributes.WebViewLoad object:nil userInfo:@{
            @"URL" : self.cacheTable[latestCommentURL]
        }];
        return;
    }
    // APIを叩いて取得する
    [GithubAPI getAPI:latestCommentURL parameters:nil success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        GHRepoComments *repoComments = [GHRepoComments modelObjectWithDictionary:JSON];
        [NotificationChannel postName:AppNotificationAttributes.WebViewLoad object:nil userInfo:@{
            @"URL" : repoComments.htmlUrl
        }];
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id o) {
        NSLog(@"error = %@", error);
    }];
}

@end