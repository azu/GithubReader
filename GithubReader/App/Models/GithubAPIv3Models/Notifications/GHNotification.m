//
//  GHNotification.m
//
//  Created by   on 2013/03/17
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "GHNotification.h"
#import "GHNotificationRepository.h"
#import "GHNotificationSubject.h"


@interface GHNotification ()

- (id)objectOrNilForKey:(id) aKey fromDictionary:(NSDictionary *) dict;

@end

@implementation GHNotification

@synthesize reason = _reason;
@synthesize unread = _unread;
@synthesize internalBaseClassIdentifier = _internalBaseClassIdentifier;
@synthesize repository = _repository;
@synthesize subscriptionUrl = _subscriptionUrl;
@synthesize subject = _subject;
@synthesize lastReadAt = _lastReadAt;
@synthesize updatedAt = _updatedAt;
@synthesize url = _url;


+ (GHNotification *)modelObjectWithDictionary:(NSDictionary *) dict {
    GHNotification *instance = [[GHNotification alloc] initWithDictionary:dict];
    return instance;
}

- (id)initWithDictionary:(NSDictionary *) dict {
    self = [super init];

    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
        self.reason = [self objectOrNilForKey:@"reason" fromDictionary:dict];
        self.unread = [[dict objectForKey:@"unread"] boolValue];
        self.internalBaseClassIdentifier = [self objectOrNilForKey:@"id" fromDictionary:dict];
        self.repository = [GHNotificationRepository modelObjectWithDictionary:[dict objectForKey:@"repository"]];
        self.subscriptionUrl = [self objectOrNilForKey:@"subscription_url" fromDictionary:dict];
        self.subject = [GHNotificationSubject modelObjectWithDictionary:[dict objectForKey:@"subject"]];
        self.lastReadAt = [self objectOrNilForKey:@"last_read_at" fromDictionary:dict];
        self.updatedAt = [self objectOrNilForKey:@"updated_at" fromDictionary:dict];
        self.url = [self objectOrNilForKey:@"url" fromDictionary:dict];

    }

    return self;

}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.reason forKey:@"reason"];
    [mutableDict setValue:[NSNumber numberWithBool:self.unread] forKey:@"unread"];
    [mutableDict setValue:self.internalBaseClassIdentifier forKey:@"id"];
    [mutableDict setValue:[self.repository dictionaryRepresentation] forKey:@"repository"];
    [mutableDict setValue:self.subscriptionUrl forKey:@"subscription_url"];
    [mutableDict setValue:[self.subject dictionaryRepresentation] forKey:@"subject"];
    [mutableDict setValue:self.lastReadAt forKey:@"last_read_at"];
    [mutableDict setValue:self.updatedAt forKey:@"updated_at"];
    [mutableDict setValue:self.url forKey:@"url"];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id) aKey fromDictionary:(NSDictionary *) dict {
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *) aDecoder {
    self = [super init];

    self.reason = [aDecoder decodeObjectForKey:@"reason"];
    self.unread = [aDecoder decodeBoolForKey:@"unread"];
    self.internalBaseClassIdentifier = [aDecoder decodeObjectForKey:@"internalBaseClassIdentifier"];
    self.repository = [aDecoder decodeObjectForKey:@"repository"];
    self.subscriptionUrl = [aDecoder decodeObjectForKey:@"subscriptionUrl"];
    self.subject = [aDecoder decodeObjectForKey:@"subject"];
    self.lastReadAt = [aDecoder decodeObjectForKey:@"lastReadAt"];
    self.updatedAt = [aDecoder decodeObjectForKey:@"updatedAt"];
    self.url = [aDecoder decodeObjectForKey:@"url"];
    return self;
}

- (void)encodeWithCoder:(NSCoder *) aCoder {

    [aCoder encodeObject:_reason forKey:@"reason"];
    [aCoder encodeBool:_unread forKey:@"unread"];
    [aCoder encodeObject:_internalBaseClassIdentifier forKey:@"internalBaseClassIdentifier"];
    [aCoder encodeObject:_repository forKey:@"repository"];
    [aCoder encodeObject:_subscriptionUrl forKey:@"subscriptionUrl"];
    [aCoder encodeObject:_subject forKey:@"subject"];
    [aCoder encodeObject:_lastReadAt forKey:@"lastReadAt"];
    [aCoder encodeObject:_updatedAt forKey:@"updatedAt"];
    [aCoder encodeObject:_url forKey:@"url"];
}


@end
