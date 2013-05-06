//
//  GHNotificationRepository.h
//
//  Created by   on 2013/05/06
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GHNotificationOwner;

@interface GHNotificationRepository : NSObject <NSCoding>

@property (nonatomic, strong) GHNotificationOwner *owner;
@property (nonatomic, strong) NSString *repositoryDescription;
@property (nonatomic, assign) double repositoryIdentifier;
@property (nonatomic, assign) BOOL fork;
@property (nonatomic, strong) NSString *htmlUrl;
@property (nonatomic, strong) NSString *fullName;
@property (nonatomic, assign) BOOL privateProperty;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *url;

+ (GHNotificationRepository *)modelObjectWithDictionary:(NSDictionary *)dict;
- (id)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
