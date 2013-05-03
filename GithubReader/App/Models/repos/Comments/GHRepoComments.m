//
//  GHRepoComments.m
//
//  Created by   on 2013/05/04
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "GHRepoComments.h"
#import "GHUser.h"


@interface GHRepoComments ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation GHRepoComments

@synthesize commitId = _commitId;
@synthesize position = _position;
@synthesize path = _path;
@synthesize internalBaseClassIdentifier = _internalBaseClassIdentifier;
@synthesize htmlUrl = _htmlUrl;
@synthesize createdAt = _createdAt;
@synthesize url = _url;
@synthesize line = _line;
@synthesize body = _body;
@synthesize updatedAt = _updatedAt;
@synthesize user = _user;


+ (GHRepoComments *)modelObjectWithDictionary:(NSDictionary *)dict
{
    GHRepoComments *instance = [[GHRepoComments alloc] initWithDictionary:dict];
    return instance;
}

- (id)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.commitId = [self objectOrNilForKey:@"commit_id" fromDictionary:dict];
            self.position = [[dict objectForKey:@"position"] doubleValue];
            self.path = [self objectOrNilForKey:@"path" fromDictionary:dict];
            self.internalBaseClassIdentifier = [[dict objectForKey:@"id"] doubleValue];
            self.htmlUrl = [self objectOrNilForKey:@"html_url" fromDictionary:dict];
            self.createdAt = [self objectOrNilForKey:@"created_at" fromDictionary:dict];
            self.url = [self objectOrNilForKey:@"url" fromDictionary:dict];
            self.line = [[dict objectForKey:@"line"] doubleValue];
            self.body = [self objectOrNilForKey:@"body" fromDictionary:dict];
            self.updatedAt = [self objectOrNilForKey:@"updated_at" fromDictionary:dict];
            self.user = [GHUser modelObjectWithDictionary:[dict objectForKey:@"user"]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.commitId forKey:@"commit_id"];
    [mutableDict setValue:[NSNumber numberWithDouble:self.position] forKey:@"position"];
    [mutableDict setValue:self.path forKey:@"path"];
    [mutableDict setValue:[NSNumber numberWithDouble:self.internalBaseClassIdentifier] forKey:@"id"];
    [mutableDict setValue:self.htmlUrl forKey:@"html_url"];
    [mutableDict setValue:self.createdAt forKey:@"created_at"];
    [mutableDict setValue:self.url forKey:@"url"];
    [mutableDict setValue:[NSNumber numberWithDouble:self.line] forKey:@"line"];
    [mutableDict setValue:self.body forKey:@"body"];
    [mutableDict setValue:self.updatedAt forKey:@"updated_at"];
    [mutableDict setValue:[self.user dictionaryRepresentation] forKey:@"user"];

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

    self.commitId = [aDecoder decodeObjectForKey:@"commitId"];
    self.position = [aDecoder decodeDoubleForKey:@"position"];
    self.path = [aDecoder decodeObjectForKey:@"path"];
    self.internalBaseClassIdentifier = [aDecoder decodeDoubleForKey:@"internalBaseClassIdentifier"];
    self.htmlUrl = [aDecoder decodeObjectForKey:@"htmlUrl"];
    self.createdAt = [aDecoder decodeObjectForKey:@"createdAt"];
    self.url = [aDecoder decodeObjectForKey:@"url"];
    self.line = [aDecoder decodeDoubleForKey:@"line"];
    self.body = [aDecoder decodeObjectForKey:@"body"];
    self.updatedAt = [aDecoder decodeObjectForKey:@"updatedAt"];
    self.user = [aDecoder decodeObjectForKey:@"user"];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_commitId forKey:@"commitId"];
    [aCoder encodeDouble:_position forKey:@"position"];
    [aCoder encodeObject:_path forKey:@"path"];
    [aCoder encodeDouble:_internalBaseClassIdentifier forKey:@"internalBaseClassIdentifier"];
    [aCoder encodeObject:_htmlUrl forKey:@"htmlUrl"];
    [aCoder encodeObject:_createdAt forKey:@"createdAt"];
    [aCoder encodeObject:_url forKey:@"url"];
    [aCoder encodeDouble:_line forKey:@"line"];
    [aCoder encodeObject:_body forKey:@"body"];
    [aCoder encodeObject:_updatedAt forKey:@"updatedAt"];
    [aCoder encodeObject:_user forKey:@"user"];
}


@end
