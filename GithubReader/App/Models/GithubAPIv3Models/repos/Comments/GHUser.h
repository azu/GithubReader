//
//  GHUser.h
//
//  Created by   on 2013/05/04
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface GHUser : NSObject <NSCoding>

@property (nonatomic, strong) NSString *login;
@property (nonatomic, assign) double userIdentifier;
@property (nonatomic, strong) NSString *avatarUrl;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *gravatarId;

+ (GHUser *)modelObjectWithDictionary:(NSDictionary *)dict;
- (id)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
