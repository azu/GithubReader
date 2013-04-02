//
//  GHNotificationRepository.m
//
//  Created by   on 2013/03/17
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "GHNotificationRepository.h"
#import "GHNotificationOwner.h"


@interface GHNotificationRepository ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation GHNotificationRepository

@synthesize privateProperty = _privateProperty;
@synthesize gitTagsUrl = _gitTagsUrl;
@synthesize issuesUrl = _issuesUrl;
@synthesize archiveUrl = _archiveUrl;
@synthesize repositoryIdentifier = _repositoryIdentifier;
@synthesize tagsUrl = _tagsUrl;
@synthesize treesUrl = _treesUrl;
@synthesize notificationsUrl = _notificationsUrl;
@synthesize branchesUrl = _branchesUrl;
@synthesize pullsUrl = _pullsUrl;
@synthesize htmlUrl = _htmlUrl;
@synthesize forksUrl = _forksUrl;
@synthesize url = _url;
@synthesize hooksUrl = _hooksUrl;
@synthesize repositoryDescription = _repositoryDescription;
@synthesize stargazersUrl = _stargazersUrl;
@synthesize issueCommentUrl = _issueCommentUrl;
@synthesize assigneesUrl = _assigneesUrl;
@synthesize languagesUrl = _languagesUrl;
@synthesize fullName = _fullName;
@synthesize commentsUrl = _commentsUrl;
@synthesize subscribersUrl = _subscribersUrl;
@synthesize mergesUrl = _mergesUrl;
@synthesize contributorsUrl = _contributorsUrl;
@synthesize issueEventsUrl = _issueEventsUrl;
@synthesize name = _name;
@synthesize commitsUrl = _commitsUrl;
@synthesize gitCommitsUrl = _gitCommitsUrl;
@synthesize keysUrl = _keysUrl;
@synthesize labelsUrl = _labelsUrl;
@synthesize gitRefsUrl = _gitRefsUrl;
@synthesize blobsUrl = _blobsUrl;
@synthesize owner = _owner;
@synthesize subscriptionUrl = _subscriptionUrl;
@synthesize milestonesUrl = _milestonesUrl;
@synthesize contentsUrl = _contentsUrl;
@synthesize eventsUrl = _eventsUrl;
@synthesize statusesUrl = _statusesUrl;
@synthesize downloadsUrl = _downloadsUrl;
@synthesize teamsUrl = _teamsUrl;
@synthesize compareUrl = _compareUrl;
@synthesize collaboratorsUrl = _collaboratorsUrl;
@synthesize fork = _fork;


+ (GHNotificationRepository *)modelObjectWithDictionary:(NSDictionary *)dict
{
    GHNotificationRepository *instance = [[GHNotificationRepository alloc] initWithDictionary:dict];
    return instance;
}

- (id)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.privateProperty = [[dict objectForKey:@"private"] boolValue];
            self.gitTagsUrl = [self objectOrNilForKey:@"git_tags_url" fromDictionary:dict];
            self.issuesUrl = [self objectOrNilForKey:@"issues_url" fromDictionary:dict];
            self.archiveUrl = [self objectOrNilForKey:@"archive_url" fromDictionary:dict];
            self.repositoryIdentifier = [[dict objectForKey:@"id"] doubleValue];
            self.tagsUrl = [self objectOrNilForKey:@"tags_url" fromDictionary:dict];
            self.treesUrl = [self objectOrNilForKey:@"trees_url" fromDictionary:dict];
            self.notificationsUrl = [self objectOrNilForKey:@"notifications_url" fromDictionary:dict];
            self.branchesUrl = [self objectOrNilForKey:@"branches_url" fromDictionary:dict];
            self.pullsUrl = [self objectOrNilForKey:@"pulls_url" fromDictionary:dict];
            self.htmlUrl = [self objectOrNilForKey:@"html_url" fromDictionary:dict];
            self.forksUrl = [self objectOrNilForKey:@"forks_url" fromDictionary:dict];
            self.url = [self objectOrNilForKey:@"url" fromDictionary:dict];
            self.hooksUrl = [self objectOrNilForKey:@"hooks_url" fromDictionary:dict];
            self.repositoryDescription = [self objectOrNilForKey:@"description" fromDictionary:dict];
            self.stargazersUrl = [self objectOrNilForKey:@"stargazers_url" fromDictionary:dict];
            self.issueCommentUrl = [self objectOrNilForKey:@"issue_comment_url" fromDictionary:dict];
            self.assigneesUrl = [self objectOrNilForKey:@"assignees_url" fromDictionary:dict];
            self.languagesUrl = [self objectOrNilForKey:@"languages_url" fromDictionary:dict];
            self.fullName = [self objectOrNilForKey:@"full_name" fromDictionary:dict];
            self.commentsUrl = [self objectOrNilForKey:@"comments_url" fromDictionary:dict];
            self.subscribersUrl = [self objectOrNilForKey:@"subscribers_url" fromDictionary:dict];
            self.mergesUrl = [self objectOrNilForKey:@"merges_url" fromDictionary:dict];
            self.contributorsUrl = [self objectOrNilForKey:@"contributors_url" fromDictionary:dict];
            self.issueEventsUrl = [self objectOrNilForKey:@"issue_events_url" fromDictionary:dict];
            self.name = [self objectOrNilForKey:@"name" fromDictionary:dict];
            self.commitsUrl = [self objectOrNilForKey:@"commits_url" fromDictionary:dict];
            self.gitCommitsUrl = [self objectOrNilForKey:@"git_commits_url" fromDictionary:dict];
            self.keysUrl = [self objectOrNilForKey:@"keys_url" fromDictionary:dict];
            self.labelsUrl = [self objectOrNilForKey:@"labels_url" fromDictionary:dict];
            self.gitRefsUrl = [self objectOrNilForKey:@"git_refs_url" fromDictionary:dict];
            self.blobsUrl = [self objectOrNilForKey:@"blobs_url" fromDictionary:dict];
            self.owner = [GHNotificationOwner modelObjectWithDictionary:[dict objectForKey:@"owner"]];
            self.subscriptionUrl = [self objectOrNilForKey:@"subscription_url" fromDictionary:dict];
            self.milestonesUrl = [self objectOrNilForKey:@"milestones_url" fromDictionary:dict];
            self.contentsUrl = [self objectOrNilForKey:@"contents_url" fromDictionary:dict];
            self.eventsUrl = [self objectOrNilForKey:@"events_url" fromDictionary:dict];
            self.statusesUrl = [self objectOrNilForKey:@"statuses_url" fromDictionary:dict];
            self.downloadsUrl = [self objectOrNilForKey:@"downloads_url" fromDictionary:dict];
            self.teamsUrl = [self objectOrNilForKey:@"teams_url" fromDictionary:dict];
            self.compareUrl = [self objectOrNilForKey:@"compare_url" fromDictionary:dict];
            self.collaboratorsUrl = [self objectOrNilForKey:@"collaborators_url" fromDictionary:dict];
            self.fork = [[dict objectForKey:@"fork"] boolValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithBool:self.privateProperty] forKey:@"private"];
    [mutableDict setValue:self.gitTagsUrl forKey:@"git_tags_url"];
    [mutableDict setValue:self.issuesUrl forKey:@"issues_url"];
    [mutableDict setValue:self.archiveUrl forKey:@"archive_url"];
    [mutableDict setValue:[NSNumber numberWithDouble:self.repositoryIdentifier] forKey:@"id"];
    [mutableDict setValue:self.tagsUrl forKey:@"tags_url"];
    [mutableDict setValue:self.treesUrl forKey:@"trees_url"];
    [mutableDict setValue:self.notificationsUrl forKey:@"notifications_url"];
    [mutableDict setValue:self.branchesUrl forKey:@"branches_url"];
    [mutableDict setValue:self.pullsUrl forKey:@"pulls_url"];
    [mutableDict setValue:self.htmlUrl forKey:@"html_url"];
    [mutableDict setValue:self.forksUrl forKey:@"forks_url"];
    [mutableDict setValue:self.url forKey:@"url"];
    [mutableDict setValue:self.hooksUrl forKey:@"hooks_url"];
    [mutableDict setValue:self.repositoryDescription forKey:@"description"];
    [mutableDict setValue:self.stargazersUrl forKey:@"stargazers_url"];
    [mutableDict setValue:self.issueCommentUrl forKey:@"issue_comment_url"];
    [mutableDict setValue:self.assigneesUrl forKey:@"assignees_url"];
    [mutableDict setValue:self.languagesUrl forKey:@"languages_url"];
    [mutableDict setValue:self.fullName forKey:@"full_name"];
    [mutableDict setValue:self.commentsUrl forKey:@"comments_url"];
    [mutableDict setValue:self.subscribersUrl forKey:@"subscribers_url"];
    [mutableDict setValue:self.mergesUrl forKey:@"merges_url"];
    [mutableDict setValue:self.contributorsUrl forKey:@"contributors_url"];
    [mutableDict setValue:self.issueEventsUrl forKey:@"issue_events_url"];
    [mutableDict setValue:self.name forKey:@"name"];
    [mutableDict setValue:self.commitsUrl forKey:@"commits_url"];
    [mutableDict setValue:self.gitCommitsUrl forKey:@"git_commits_url"];
    [mutableDict setValue:self.keysUrl forKey:@"keys_url"];
    [mutableDict setValue:self.labelsUrl forKey:@"labels_url"];
    [mutableDict setValue:self.gitRefsUrl forKey:@"git_refs_url"];
    [mutableDict setValue:self.blobsUrl forKey:@"blobs_url"];
    [mutableDict setValue:[self.owner dictionaryRepresentation] forKey:@"owner"];
    [mutableDict setValue:self.subscriptionUrl forKey:@"subscription_url"];
    [mutableDict setValue:self.milestonesUrl forKey:@"milestones_url"];
    [mutableDict setValue:self.contentsUrl forKey:@"contents_url"];
    [mutableDict setValue:self.eventsUrl forKey:@"events_url"];
    [mutableDict setValue:self.statusesUrl forKey:@"statuses_url"];
    [mutableDict setValue:self.downloadsUrl forKey:@"downloads_url"];
    [mutableDict setValue:self.teamsUrl forKey:@"teams_url"];
    [mutableDict setValue:self.compareUrl forKey:@"compare_url"];
    [mutableDict setValue:self.collaboratorsUrl forKey:@"collaborators_url"];
    [mutableDict setValue:[NSNumber numberWithBool:self.fork] forKey:@"fork"];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.privateProperty = [aDecoder decodeBoolForKey:@"privateProperty"];
    self.gitTagsUrl = [aDecoder decodeObjectForKey:@"gitTagsUrl"];
    self.issuesUrl = [aDecoder decodeObjectForKey:@"issuesUrl"];
    self.archiveUrl = [aDecoder decodeObjectForKey:@"archiveUrl"];
    self.repositoryIdentifier = [aDecoder decodeDoubleForKey:@"repositoryIdentifier"];
    self.tagsUrl = [aDecoder decodeObjectForKey:@"tagsUrl"];
    self.treesUrl = [aDecoder decodeObjectForKey:@"treesUrl"];
    self.notificationsUrl = [aDecoder decodeObjectForKey:@"notificationsUrl"];
    self.branchesUrl = [aDecoder decodeObjectForKey:@"branchesUrl"];
    self.pullsUrl = [aDecoder decodeObjectForKey:@"pullsUrl"];
    self.htmlUrl = [aDecoder decodeObjectForKey:@"htmlUrl"];
    self.forksUrl = [aDecoder decodeObjectForKey:@"forksUrl"];
    self.url = [aDecoder decodeObjectForKey:@"url"];
    self.hooksUrl = [aDecoder decodeObjectForKey:@"hooksUrl"];
    self.repositoryDescription = [aDecoder decodeObjectForKey:@"repositoryDescription"];
    self.stargazersUrl = [aDecoder decodeObjectForKey:@"stargazersUrl"];
    self.issueCommentUrl = [aDecoder decodeObjectForKey:@"issueCommentUrl"];
    self.assigneesUrl = [aDecoder decodeObjectForKey:@"assigneesUrl"];
    self.languagesUrl = [aDecoder decodeObjectForKey:@"languagesUrl"];
    self.fullName = [aDecoder decodeObjectForKey:@"fullName"];
    self.commentsUrl = [aDecoder decodeObjectForKey:@"commentsUrl"];
    self.subscribersUrl = [aDecoder decodeObjectForKey:@"subscribersUrl"];
    self.mergesUrl = [aDecoder decodeObjectForKey:@"mergesUrl"];
    self.contributorsUrl = [aDecoder decodeObjectForKey:@"contributorsUrl"];
    self.issueEventsUrl = [aDecoder decodeObjectForKey:@"issueEventsUrl"];
    self.name = [aDecoder decodeObjectForKey:@"name"];
    self.commitsUrl = [aDecoder decodeObjectForKey:@"commitsUrl"];
    self.gitCommitsUrl = [aDecoder decodeObjectForKey:@"gitCommitsUrl"];
    self.keysUrl = [aDecoder decodeObjectForKey:@"keysUrl"];
    self.labelsUrl = [aDecoder decodeObjectForKey:@"labelsUrl"];
    self.gitRefsUrl = [aDecoder decodeObjectForKey:@"gitRefsUrl"];
    self.blobsUrl = [aDecoder decodeObjectForKey:@"blobsUrl"];
    self.owner = [aDecoder decodeObjectForKey:@"owner"];
    self.subscriptionUrl = [aDecoder decodeObjectForKey:@"subscriptionUrl"];
    self.milestonesUrl = [aDecoder decodeObjectForKey:@"milestonesUrl"];
    self.contentsUrl = [aDecoder decodeObjectForKey:@"contentsUrl"];
    self.eventsUrl = [aDecoder decodeObjectForKey:@"eventsUrl"];
    self.statusesUrl = [aDecoder decodeObjectForKey:@"statusesUrl"];
    self.downloadsUrl = [aDecoder decodeObjectForKey:@"downloadsUrl"];
    self.teamsUrl = [aDecoder decodeObjectForKey:@"teamsUrl"];
    self.compareUrl = [aDecoder decodeObjectForKey:@"compareUrl"];
    self.collaboratorsUrl = [aDecoder decodeObjectForKey:@"collaboratorsUrl"];
    self.fork = [aDecoder decodeBoolForKey:@"fork"];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeBool:_privateProperty forKey:@"privateProperty"];
    [aCoder encodeObject:_gitTagsUrl forKey:@"gitTagsUrl"];
    [aCoder encodeObject:_issuesUrl forKey:@"issuesUrl"];
    [aCoder encodeObject:_archiveUrl forKey:@"archiveUrl"];
    [aCoder encodeDouble:_repositoryIdentifier forKey:@"repositoryIdentifier"];
    [aCoder encodeObject:_tagsUrl forKey:@"tagsUrl"];
    [aCoder encodeObject:_treesUrl forKey:@"treesUrl"];
    [aCoder encodeObject:_notificationsUrl forKey:@"notificationsUrl"];
    [aCoder encodeObject:_branchesUrl forKey:@"branchesUrl"];
    [aCoder encodeObject:_pullsUrl forKey:@"pullsUrl"];
    [aCoder encodeObject:_htmlUrl forKey:@"htmlUrl"];
    [aCoder encodeObject:_forksUrl forKey:@"forksUrl"];
    [aCoder encodeObject:_url forKey:@"url"];
    [aCoder encodeObject:_hooksUrl forKey:@"hooksUrl"];
    [aCoder encodeObject:_repositoryDescription forKey:@"repositoryDescription"];
    [aCoder encodeObject:_stargazersUrl forKey:@"stargazersUrl"];
    [aCoder encodeObject:_issueCommentUrl forKey:@"issueCommentUrl"];
    [aCoder encodeObject:_assigneesUrl forKey:@"assigneesUrl"];
    [aCoder encodeObject:_languagesUrl forKey:@"languagesUrl"];
    [aCoder encodeObject:_fullName forKey:@"fullName"];
    [aCoder encodeObject:_commentsUrl forKey:@"commentsUrl"];
    [aCoder encodeObject:_subscribersUrl forKey:@"subscribersUrl"];
    [aCoder encodeObject:_mergesUrl forKey:@"mergesUrl"];
    [aCoder encodeObject:_contributorsUrl forKey:@"contributorsUrl"];
    [aCoder encodeObject:_issueEventsUrl forKey:@"issueEventsUrl"];
    [aCoder encodeObject:_name forKey:@"name"];
    [aCoder encodeObject:_commitsUrl forKey:@"commitsUrl"];
    [aCoder encodeObject:_gitCommitsUrl forKey:@"gitCommitsUrl"];
    [aCoder encodeObject:_keysUrl forKey:@"keysUrl"];
    [aCoder encodeObject:_labelsUrl forKey:@"labelsUrl"];
    [aCoder encodeObject:_gitRefsUrl forKey:@"gitRefsUrl"];
    [aCoder encodeObject:_blobsUrl forKey:@"blobsUrl"];
    [aCoder encodeObject:_owner forKey:@"owner"];
    [aCoder encodeObject:_subscriptionUrl forKey:@"subscriptionUrl"];
    [aCoder encodeObject:_milestonesUrl forKey:@"milestonesUrl"];
    [aCoder encodeObject:_contentsUrl forKey:@"contentsUrl"];
    [aCoder encodeObject:_eventsUrl forKey:@"eventsUrl"];
    [aCoder encodeObject:_statusesUrl forKey:@"statusesUrl"];
    [aCoder encodeObject:_downloadsUrl forKey:@"downloadsUrl"];
    [aCoder encodeObject:_teamsUrl forKey:@"teamsUrl"];
    [aCoder encodeObject:_compareUrl forKey:@"compareUrl"];
    [aCoder encodeObject:_collaboratorsUrl forKey:@"collaboratorsUrl"];
    [aCoder encodeBool:_fork forKey:@"fork"];
}


@end
