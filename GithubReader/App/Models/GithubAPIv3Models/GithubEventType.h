//
// Created by azu on 2013/03/17.
//


#import <Foundation/Foundation.h>

// http://developer.github.com/v3/activity/events/types/
extern const struct GithubEventTypes {
    __unsafe_unretained NSString *CommitCommentEvent;
    __unsafe_unretained NSString *CreateEvent;
    __unsafe_unretained NSString *DeleteEvent;
    __unsafe_unretained NSString *DownloadEvent;
    __unsafe_unretained NSString *FollowEvent;
    __unsafe_unretained NSString *ForkEvent;
    __unsafe_unretained NSString *ForkApplyEvent;
    __unsafe_unretained NSString *GistEvent;
    __unsafe_unretained NSString *GollumEvent;
    __unsafe_unretained NSString *IssueCommentEvent;
    __unsafe_unretained NSString *IssuesEvent;
    __unsafe_unretained NSString *MemberEvent;
    __unsafe_unretained NSString *PublicEvent;
    __unsafe_unretained NSString *PullRequestEvent;
    __unsafe_unretained NSString *PullRequestReviewCommentEvent;
    __unsafe_unretained NSString *PushEvent;
    __unsafe_unretained NSString *TeamAddEvent;
    __unsafe_unretained NSString *WatchEvent;
} githubEventTypes;

@interface GithubEventType : NSObject
@end