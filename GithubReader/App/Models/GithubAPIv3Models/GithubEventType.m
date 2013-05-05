//
// Created by azu on 2013/03/17.
//


#import "GithubEventType.h"

const struct GithubEventTypes githubEventTypes = {
    .CommitCommentEvent = @"commit_comment",
    .CreateEvent = @"create",
    .DeleteEvent = @"delete",
    .DownloadEvent = @"download",
    .FollowEvent = @"follow",
    .ForkEvent = @"fork",
    .ForkApplyEvent = @"fork_apply",
    .GistEvent = @"gist",
    .GollumEvent = @"gollum",
    .IssueCommentEvent = @"issue_comment",
    .IssuesEvent  = @"issues",
    .MemberEvent = @"member",
    .PublicEvent = @"public",
    .PullRequestEvent = @"pull_request",
    .PullRequestReviewCommentEvent = @"pull_request_review_comment",
    .PushEvent =@"push",
    .TeamAddEvent = @"team_add",
    .WatchEvent = @"watch"
};

@implementation GithubEventType {

}
@end