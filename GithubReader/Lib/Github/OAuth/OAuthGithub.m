//
//  OAuthGithub.m
//  GithubOAuthExample

#import "OAuthGithub.h"
#import "OAuthGithubKeys.h"
#import "OAuthConfig.h"
#import "NotificationChannel.h"
#import <AFNetworking/AFNetworking.h>

@implementation OAuthGithub

+ (instancetype)sharedObject {

    static dispatch_once_t once_t = 0;
    __strong static id _sharedObject = nil;
    dispatch_once(&once_t, ^{
        _sharedObject = [[self alloc] init];
    });
    return _sharedObject;
}

+ (NSString *)generateState {
    static dispatch_once_t dispatch_once_t = 0;
    __strong static NSString *stateID = nil;
    dispatch_once(&dispatch_once_t, ^{
        stateID = [[NSUUID UUID] UUIDString];
    });
    return stateID;
}

- (void)oauthWithCode:(NSString *) code state:(NSString *) state {

    if (![state isEqualToString:self.state]) {
        NSLog(@"state is not match : %@ == %@", state, self.state);
        [[NSNotificationCenter defaultCenter] postNotificationName:AppNotificationAttributes.OAuth object:nil userInfo:@{
            @"status" : @NO
        }];
        return;
    }

    NSURL *baseURL = [NSURL URLWithString:@"https://github.com/"];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:baseURL];
    NSDictionary *params = @{
        @"code" : code,
        @"client_id" : GithubAppAttributes.clientID,
        @"client_secret" : GithubAppAttributes.clientSecret,
        @"state" : self.state
    };
    [manager POST:@"/login/oauth/access_token" parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {

        NSString *response = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSArray *queryComponents = [response componentsSeparatedByString:@"&"];
        NSMutableDictionary *queries = [NSMutableDictionary dictionary];
        for (NSString *component in queryComponents) {
            NSArray *kv = [component componentsSeparatedByString:@"="];
            [queries setObject:[kv objectAtIndex:1] forKey:[kv objectAtIndex:0]];
        }
        NSString *access_token = [queries objectForKey:@"access_token"];
        [OAuthConfig setAccessToken:access_token];
        [[NSNotificationCenter defaultCenter] postNotificationName:AppNotificationAttributes.OAuth object:nil userInfo:@{
            @"status" : @YES
        }];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"error");
        [[NSNotificationCenter defaultCenter] postNotificationName:AppNotificationAttributes.OAuth object:nil userInfo:@{
            @"status" : @NO
        }];
    }];
}
@end
