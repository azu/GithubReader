//
//  GHRepoComments.h
//
//  Created by   on 2013/05/04
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GHUser;

@interface GHRepoComments : NSObject <NSCoding>

@property (nonatomic, strong) NSString *commitId;
@property (nonatomic, assign) double position;
@property (nonatomic, strong) NSString *path;
@property (nonatomic, assign) double internalBaseClassIdentifier;
@property (nonatomic, strong) NSString *htmlUrl;
@property (nonatomic, strong) NSString *createdAt;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, assign) double line;
@property (nonatomic, strong) NSString *body;
@property (nonatomic, strong) NSString *updatedAt;
@property (nonatomic, strong) GHUser *user;

+ (GHRepoComments *)modelObjectWithDictionary:(NSDictionary *)dict;
- (id)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
