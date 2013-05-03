//
// Created by azu on 2013/03/31.
//


#import <Foundation/Foundation.h>

extern const struct GithubAppAttributes {
    __unsafe_unretained NSString *clientID;
    __unsafe_unretained NSString *clientSecret;
} GithubAppAttributes;

@interface OAuthGithubKeys : NSObject
@end