//
//  GHNotificationRepository.m
//
//  Created by   on 2013/05/06
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "GHNotificationRepository.h"
#import "GHNotificationOwner.h"


@interface GHNotificationRepository ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation GHNotificationRepository

@synthesize owner = _owner;
@synthesize repositoryDescription = _repositoryDescription;
@synthesize repositoryIdentifier = _repositoryIdentifier;
@synthesize fork = _fork;
@synthesize htmlUrl = _htmlUrl;
@synthesize fullName = _fullName;
@synthesize privateProperty = _privateProperty;
@synthesize name = _name;
@synthesize url = _url;


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
            self.owner = [GHNotificationOwner modelObjectWithDictionary:[dict objectForKey:@"owner"]];
            self.repositoryDescription = [self objectOrNilForKey:@"description" fromDictionary:dict];
            self.repositoryIdentifier = [[dict objectForKey:@"id"] doubleValue];
            self.fork = [[dict objectForKey:@"fork"] boolValue];
            self.htmlUrl = [self objectOrNilForKey:@"html_url" fromDictionary:dict];
            self.fullName = [self objectOrNilForKey:@"full_name" fromDictionary:dict];
            self.privateProperty = [[dict objectForKey:@"private"] boolValue];
            self.name = [self objectOrNilForKey:@"name" fromDictionary:dict];
            self.url = [self objectOrNilForKey:@"url" fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.owner dictionaryRepresentation] forKey:@"owner"];
    [mutableDict setValue:self.repositoryDescription forKey:@"description"];
    [mutableDict setValue:[NSNumber numberWithDouble:self.repositoryIdentifier] forKey:@"id"];
    [mutableDict setValue:[NSNumber numberWithBool:self.fork] forKey:@"fork"];
    [mutableDict setValue:self.htmlUrl forKey:@"html_url"];
    [mutableDict setValue:self.fullName forKey:@"full_name"];
    [mutableDict setValue:[NSNumber numberWithBool:self.privateProperty] forKey:@"private"];
    [mutableDict setValue:self.name forKey:@"name"];
    [mutableDict setValue:self.url forKey:@"url"];

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

    self.owner = [aDecoder decodeObjectForKey:@"owner"];
    self.repositoryDescription = [aDecoder decodeObjectForKey:@"repositoryDescription"];
    self.repositoryIdentifier = [aDecoder decodeDoubleForKey:@"repositoryIdentifier"];
    self.fork = [aDecoder decodeBoolForKey:@"fork"];
    self.htmlUrl = [aDecoder decodeObjectForKey:@"htmlUrl"];
    self.fullName = [aDecoder decodeObjectForKey:@"fullName"];
    self.privateProperty = [aDecoder decodeBoolForKey:@"privateProperty"];
    self.name = [aDecoder decodeObjectForKey:@"name"];
    self.url = [aDecoder decodeObjectForKey:@"url"];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_owner forKey:@"owner"];
    [aCoder encodeObject:_repositoryDescription forKey:@"repositoryDescription"];
    [aCoder encodeDouble:_repositoryIdentifier forKey:@"repositoryIdentifier"];
    [aCoder encodeBool:_fork forKey:@"fork"];
    [aCoder encodeObject:_htmlUrl forKey:@"htmlUrl"];
    [aCoder encodeObject:_fullName forKey:@"fullName"];
    [aCoder encodeBool:_privateProperty forKey:@"privateProperty"];
    [aCoder encodeObject:_name forKey:@"name"];
    [aCoder encodeObject:_url forKey:@"url"];
}


@end
