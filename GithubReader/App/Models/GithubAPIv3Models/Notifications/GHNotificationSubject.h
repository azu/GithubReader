//
//  GHNotificationSubject.h
//
//  Created by   on 2013/05/06
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface GHNotificationSubject : NSObject <NSCoding>

@property (nonatomic, strong) NSString *latestCommentUrl;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *type;

+ (GHNotificationSubject *)modelObjectWithDictionary:(NSDictionary *)dict;
- (id)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
