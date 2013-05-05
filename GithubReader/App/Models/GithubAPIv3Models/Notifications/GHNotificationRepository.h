//
//  GHNotificationRepository.h
//
//  Created by   on 2013/03/17
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GHNotificationOwner;

@interface GHNotificationRepository : NSObject <NSCoding>

@property (nonatomic, assign) BOOL privateProperty;
@property (nonatomic, strong) NSString *gitTagsUrl;
@property (nonatomic, strong) NSString *issuesUrl;
@property (nonatomic, strong) NSString *archiveUrl;
@property (nonatomic, assign) double repositoryIdentifier;
@property (nonatomic, strong) NSString *tagsUrl;
@property (nonatomic, strong) NSString *treesUrl;
@property (nonatomic, strong) NSString *notificationsUrl;
@property (nonatomic, strong) NSString *branchesUrl;
@property (nonatomic, strong) NSString *pullsUrl;
@property (nonatomic, strong) NSString *htmlUrl;
@property (nonatomic, strong) NSString *forksUrl;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *hooksUrl;
@property (nonatomic, strong) NSString *repositoryDescription;
@property (nonatomic, strong) NSString *stargazersUrl;
@property (nonatomic, strong) NSString *issueCommentUrl;
@property (nonatomic, strong) NSString *assigneesUrl;
@property (nonatomic, strong) NSString *languagesUrl;
@property (nonatomic, strong) NSString *fullName;
@property (nonatomic, strong) NSString *commentsUrl;
@property (nonatomic, strong) NSString *subscribersUrl;
@property (nonatomic, strong) NSString *mergesUrl;
@property (nonatomic, strong) NSString *contributorsUrl;
@property (nonatomic, strong) NSString *issueEventsUrl;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *commitsUrl;
@property (nonatomic, strong) NSString *gitCommitsUrl;
@property (nonatomic, strong) NSString *keysUrl;
@property (nonatomic, strong) NSString *labelsUrl;
@property (nonatomic, strong) NSString *gitRefsUrl;
@property (nonatomic, strong) NSString *blobsUrl;
@property (nonatomic, strong) GHNotificationOwner *owner;
@property (nonatomic, strong) NSString *subscriptionUrl;
@property (nonatomic, strong) NSString *milestonesUrl;
@property (nonatomic, strong) NSString *contentsUrl;
@property (nonatomic, strong) NSString *eventsUrl;
@property (nonatomic, strong) NSString *statusesUrl;
@property (nonatomic, strong) NSString *downloadsUrl;
@property (nonatomic, strong) NSString *teamsUrl;
@property (nonatomic, strong) NSString *compareUrl;
@property (nonatomic, strong) NSString *collaboratorsUrl;
@property (nonatomic, assign) BOOL fork;

+ (GHNotificationRepository *)modelObjectWithDictionary:(NSDictionary *)dict;
- (id)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
