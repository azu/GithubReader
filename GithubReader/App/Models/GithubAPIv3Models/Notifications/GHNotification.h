//
//  GHNotification.h
//
//  Created by   on 2013/03/17
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GHNotificationRepository, GHNotificationSubject;

@interface GHNotification : NSObject <NSCoding>

@property (nonatomic, copy) NSString *reason;
@property (nonatomic, assign) BOOL unread;
@property (nonatomic, copy) NSString *internalBaseClassIdentifier;
@property (nonatomic, strong) GHNotificationRepository *repository;
@property (nonatomic, copy) NSString *subscriptionUrl;
@property (nonatomic, strong) GHNotificationSubject *subject;
@property (nonatomic, copy) NSString *lastReadAt;
@property (nonatomic, copy) NSString *updatedAt;
@property (nonatomic, copy) NSString *url;

+ (GHNotification *)modelObjectWithDictionary:(NSDictionary *)dict;
- (id)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

- (BOOL)isEqual:(id) other;

- (BOOL)isEqualToNotification:(GHNotification *) notification;

- (NSUInteger)hash;

@end
