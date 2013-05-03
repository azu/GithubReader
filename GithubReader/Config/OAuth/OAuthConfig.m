//
// Created by azu on 2013/03/31.
//


#import "OAuthConfig.h"


@implementation OAuthConfig {

}

extern const struct OAuthAttributes {
    __unsafe_unretained NSString *accessToken;
} OAuthAttributes;


const struct OAuthAttributes OAuthAttributes = {
    .accessToken = @"OAuthAttributes.accessToken",
};

+ (NSString *)accessToken {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults objectForKey:OAuthAttributes.accessToken];
}

+ (void)setAccessToken:(NSString *) accessToken {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:accessToken forKey:OAuthAttributes.accessToken];
    [defaults synchronize];

}

@end