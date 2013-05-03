//
//  GHNotification.h
//
//  Created by   on 2013/03/17
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GHNotificationRepository, GHNotificationSubject;

@interface GHNotification : NSObject <NSCoding>

@property (nonatomic, strong) NSString *reason;
@property (nonatomic, assign) BOOL unread;
@property (nonatomic, strong) NSString *internalBaseClassIdentifier;
@property (nonatomic, strong) GHNotificationRepository *repository;
@property (nonatomic, strong) NSString *subscriptionUrl;
@property (nonatomic, strong) GHNotificationSubject *subject;
@property (nonatomic, assign) id lastReadAt;
@property (nonatomic, strong) NSString *updatedAt;
@property (nonatomic, strong) NSString *url;

+ (GHNotification *)modelObjectWithDictionary:(NSDictionary *)dict;
- (id)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
