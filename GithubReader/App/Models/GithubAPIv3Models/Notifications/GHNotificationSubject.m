//
//  GHNotificationSubject.m
//
//  Created by   on 2013/05/06
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "GHNotificationSubject.h"


@interface GHNotificationSubject ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation GHNotificationSubject

@synthesize latestCommentUrl = _latestCommentUrl;
@synthesize title = _title;
@synthesize url = _url;
@synthesize type = _type;


+ (GHNotificationSubject *)modelObjectWithDictionary:(NSDictionary *)dict
{
    GHNotificationSubject *instance = [[GHNotificationSubject alloc] initWithDictionary:dict];
    return instance;
}

- (id)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.latestCommentUrl = [self objectOrNilForKey:@"latest_comment_url" fromDictionary:dict];
            self.title = [self objectOrNilForKey:@"title" fromDictionary:dict];
            self.url = [self objectOrNilForKey:@"url" fromDictionary:dict];
            self.type = [self objectOrNilForKey:@"type" fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.latestCommentUrl forKey:@"latest_comment_url"];
    [mutableDict setValue:self.title forKey:@"title"];
    [mutableDict setValue:self.url forKey:@"url"];
    [mutableDict setValue:self.type forKey:@"type"];

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

    self.latestCommentUrl = [aDecoder decodeObjectForKey:@"latestCommentUrl"];
    self.title = [aDecoder decodeObjectForKey:@"title"];
    self.url = [aDecoder decodeObjectForKey:@"url"];
    self.type = [aDecoder decodeObjectForKey:@"type"];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_latestCommentUrl forKey:@"latestCommentUrl"];
    [aCoder encodeObject:_title forKey:@"title"];
    [aCoder encodeObject:_url forKey:@"url"];
    [aCoder encodeObject:_type forKey:@"type"];
}


@end
