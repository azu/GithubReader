//
// Created by azu on 2013/03/31.
//


#import <AFNetworking/AFHTTPRequestOperation.h>
#import "GithubAPI.h"
#import "OAuthConfig.h"


@implementation GithubAPI {

}


#pragma mark - Singleton methods

static GithubAPI *_sharedManager = nil;

+ (GithubAPI *)sharedClient {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURL *baseURL = [NSURL URLWithString:@"https://api.github.com/"];
        GithubAPI *client = [[self alloc] initWithBaseURL:baseURL];
        _sharedManager = client;
    });
    return _sharedManager;
}

- (id)copyWithZone:(NSZone *) zone {
    return self;
}

+ (void)getAPI:(NSString *) endPointPath parameters:(NSDictionary *) parameters
       success:(void (^)(AFHTTPRequestOperation *operation, id responseObject)) success
       failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error)) failure {
    [self method:@"GET" API:endPointPath parameters:parameters success:success failure:failure];
}

+ (void)postAPI:(NSString *) endPointPath parameters:(NSDictionary *) parameters
        success:(void (^)(AFHTTPRequestOperation *operation, id responseObject)) success
        failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error)) failure {
    [self method:@"POST" API:endPointPath parameters:parameters success:success failure:failure];
}
#pragma mark - internal
+ (void)method:(NSString *) method API:(NSString *) endPointPath parameters:(NSDictionary *) parameters
       success:(void (^)(AFHTTPRequestOperation *operation, id responseObject)) success
       failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error)) failure {
    if (![OAuthConfig hasAccessToken]) {
        NSLog(@"Please Login Github.");
        return;
    }
    NSString *accessTokenFiled = [NSString stringWithFormat:@"token %@", [OAuthConfig accessToken]];
    AFHTTPRequestOperationManager *manager = [self sharedClient];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:accessTokenFiled forHTTPHeaderField:@"Authorization"];
    if ([method isEqualToString:@"POST"]) {
        [manager POST:endPointPath parameters:parameters success:success failure:failure];
    } else {
        [manager GET:endPointPath parameters:parameters success:success failure:failure];
    }

}
@end