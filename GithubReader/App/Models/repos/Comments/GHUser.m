//
//  GHUser.m
//
//  Created by   on 2013/05/04
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "GHUser.h"


@interface GHUser ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation GHUser

@synthesize login = _login;
@synthesize userIdentifier = _userIdentifier;
@synthesize avatarUrl = _avatarUrl;
@synthesize url = _url;
@synthesize gravatarId = _gravatarId;


+ (GHUser *)modelObjectWithDictionary:(NSDictionary *)dict
{
    GHUser *instance = [[GHUser alloc] initWithDictionary:dict];
    return instance;
}

- (id)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.login = [self objectOrNilForKey:@"login" fromDictionary:dict];
            self.userIdentifier = [[dict objectForKey:@"id"] doubleValue];
            self.avatarUrl = [self objectOrNilForKey:@"avatar_url" fromDictionary:dict];
            self.url = [self objectOrNilForKey:@"url" fromDictionary:dict];
            self.gravatarId = [self objectOrNilForKey:@"gravatar_id" fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.login forKey:@"login"];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userIdentifier] forKey:@"id"];
    [mutableDict setValue:self.avatarUrl forKey:@"avatar_url"];
    [mutableDict setValue:self.url forKey:@"url"];
    [mutableDict setValue:self.gravatarId forKey:@"gravatar_id"];

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

    self.login = [aDecoder decodeObjectForKey:@"login"];
    self.userIdentifier = [aDecoder decodeDoubleForKey:@"userIdentifier"];
    self.avatarUrl = [aDecoder decodeObjectForKey:@"avatarUrl"];
    self.url = [aDecoder decodeObjectForKey:@"url"];
    self.gravatarId = [aDecoder decodeObjectForKey:@"gravatarId"];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_login forKey:@"login"];
    [aCoder encodeDouble:_userIdentifier forKey:@"userIdentifier"];
    [aCoder encodeObject:_avatarUrl forKey:@"avatarUrl"];
    [aCoder encodeObject:_url forKey:@"url"];
    [aCoder encodeObject:_gravatarId forKey:@"gravatarId"];
}


@end
