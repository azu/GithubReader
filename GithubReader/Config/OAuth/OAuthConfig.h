//
// Created by azu on 2013/03/31.
//


#import <Foundation/Foundation.h>


@interface OAuthConfig : NSObject

+ (NSString *)accessToken;

+ (void)setAccessToken:(NSString *) accessToken;
@end