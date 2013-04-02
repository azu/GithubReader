//
//  GHNotificationOwner.m
//
//  Created by   on 2013/03/17
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "GHNotificationOwner.h"


@interface GHNotificationOwner ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation GHNotificationOwner

@synthesize ownerIdentifier = _ownerIdentifier;
@synthesize organizationsUrl = _organizationsUrl;
@synthesize receivedEventsUrl = _receivedEventsUrl;
@synthesize followingUrl = _followingUrl;
@synthesize login = _login;
@synthesize subscriptionsUrl = _subscriptionsUrl;
@synthesize avatarUrl = _avatarUrl;
@synthesize url = _url;
@synthesize type = _type;
@synthesize reposUrl = _reposUrl;
@synthesize htmlUrl = _htmlUrl;
@synthesize eventsUrl = _eventsUrl;
@synthesize starredUrl = _starredUrl;
@synthesize gistsUrl = _gistsUrl;
@synthesize gravatarId = _gravatarId;
@synthesize followersUrl = _followersUrl;


+ (GHNotificationOwner *)modelObjectWithDictionary:(NSDictionary *)dict
{
    GHNotificationOwner *instance = [[GHNotificationOwner alloc] initWithDictionary:dict];
    return instance;
}

- (id)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.ownerIdentifier = [[dict objectForKey:@"id"] doubleValue];
            self.organizationsUrl = [self objectOrNilForKey:@"organizations_url" fromDictionary:dict];
            self.receivedEventsUrl = [self objectOrNilForKey:@"received_events_url" fromDictionary:dict];
            self.followingUrl = [self objectOrNilForKey:@"following_url" fromDictionary:dict];
            self.login = [self objectOrNilForKey:@"login" fromDictionary:dict];
            self.subscriptionsUrl = [self objectOrNilForKey:@"subscriptions_url" fromDictionary:dict];
            self.avatarUrl = [self objectOrNilForKey:@"avatar_url" fromDictionary:dict];
            self.url = [self objectOrNilForKey:@"url" fromDictionary:dict];
            self.type = [self objectOrNilForKey:@"type" fromDictionary:dict];
            self.reposUrl = [self objectOrNilForKey:@"repos_url" fromDictionary:dict];
            self.htmlUrl = [self objectOrNilForKey:@"html_url" fromDictionary:dict];
            self.eventsUrl = [self objectOrNilForKey:@"events_url" fromDictionary:dict];
            self.starredUrl = [self objectOrNilForKey:@"starred_url" fromDictionary:dict];
            self.gistsUrl = [self objectOrNilForKey:@"gists_url" fromDictionary:dict];
            self.gravatarId = [self objectOrNilForKey:@"gravatar_id" fromDictionary:dict];
            self.followersUrl = [self objectOrNilForKey:@"followers_url" fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.ownerIdentifier] forKey:@"id"];
    [mutableDict setValue:self.organizationsUrl forKey:@"organizations_url"];
    [mutableDict setValue:self.receivedEventsUrl forKey:@"received_events_url"];
    [mutableDict setValue:self.followingUrl forKey:@"following_url"];
    [mutableDict setValue:self.login forKey:@"login"];
    [mutableDict setValue:self.subscriptionsUrl forKey:@"subscriptions_url"];
    [mutableDict setValue:self.avatarUrl forKey:@"avatar_url"];
    [mutableDict setValue:self.url forKey:@"url"];
    [mutableDict setValue:self.type forKey:@"type"];
    [mutableDict setValue:self.reposUrl forKey:@"repos_url"];
    [mutableDict setValue:self.htmlUrl forKey:@"html_url"];
    [mutableDict setValue:self.eventsUrl forKey:@"events_url"];
    [mutableDict setValue:self.starredUrl forKey:@"starred_url"];
    [mutableDict setValue:self.gistsUrl forKey:@"gists_url"];
    [mutableDict setValue:self.gravatarId forKey:@"gravatar_id"];
    [mutableDict setValue:self.followersUrl forKey:@"followers_url"];

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

    self.ownerIdentifier = [aDecoder decodeDoubleForKey:@"ownerIdentifier"];
    self.organizationsUrl = [aDecoder decodeObjectForKey:@"organizationsUrl"];
    self.receivedEventsUrl = [aDecoder decodeObjectForKey:@"receivedEventsUrl"];
    self.followingUrl = [aDecoder decodeObjectForKey:@"followingUrl"];
    self.login = [aDecoder decodeObjectForKey:@"login"];
    self.subscriptionsUrl = [aDecoder decodeObjectForKey:@"subscriptionsUrl"];
    self.avatarUrl = [aDecoder decodeObjectForKey:@"avatarUrl"];
    self.url = [aDecoder decodeObjectForKey:@"url"];
    self.type = [aDecoder decodeObjectForKey:@"type"];
    self.reposUrl = [aDecoder decodeObjectForKey:@"reposUrl"];
    self.htmlUrl = [aDecoder decodeObjectForKey:@"htmlUrl"];
    self.eventsUrl = [aDecoder decodeObjectForKey:@"eventsUrl"];
    self.starredUrl = [aDecoder decodeObjectForKey:@"starredUrl"];
    self.gistsUrl = [aDecoder decodeObjectForKey:@"gistsUrl"];
    self.gravatarId = [aDecoder decodeObjectForKey:@"gravatarId"];
    self.followersUrl = [aDecoder decodeObjectForKey:@"followersUrl"];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_ownerIdentifier forKey:@"ownerIdentifier"];
    [aCoder encodeObject:_organizationsUrl forKey:@"organizationsUrl"];
    [aCoder encodeObject:_receivedEventsUrl forKey:@"receivedEventsUrl"];
    [aCoder encodeObject:_followingUrl forKey:@"followingUrl"];
    [aCoder encodeObject:_login forKey:@"login"];
    [aCoder encodeObject:_subscriptionsUrl forKey:@"subscriptionsUrl"];
    [aCoder encodeObject:_avatarUrl forKey:@"avatarUrl"];
    [aCoder encodeObject:_url forKey:@"url"];
    [aCoder encodeObject:_type forKey:@"type"];
    [aCoder encodeObject:_reposUrl forKey:@"reposUrl"];
    [aCoder encodeObject:_htmlUrl forKey:@"htmlUrl"];
    [aCoder encodeObject:_eventsUrl forKey:@"eventsUrl"];
    [aCoder encodeObject:_starredUrl forKey:@"starredUrl"];
    [aCoder encodeObject:_gistsUrl forKey:@"gistsUrl"];
    [aCoder encodeObject:_gravatarId forKey:@"gravatarId"];
    [aCoder encodeObject:_followersUrl forKey:@"followersUrl"];
}


@end
