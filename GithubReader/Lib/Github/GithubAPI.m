//
// Created by azu on 2013/03/31.
//


#import <AFNetworking/AFHTTPRequestOperation.h>
#import "GithubAPI.h"
#import "AFJSONRequestOperation.h"
#import "OAuthConfig.h"


@implementation GithubAPI {

}


#pragma mark - Singleton methods

static GithubAPI *_sharedManager = nil;

+ (GithubAPI *)sharedClient {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURL *baseURL = [NSURL URLWithString:@"https://api.github.com/"];
        GithubAPI *client = [[GithubAPI alloc] initWithBaseURL:baseURL];
        _sharedManager = client;
    });
    return _sharedManager;
}

- (id)copyWithZone:(NSZone *) zone {
    return self;
}

+ (void)getAPI:(NSString *) endPointPath parameters:(NSDictionary *) parameters
       success:(void (^)(NSURLRequest *request, NSHTTPURLResponse *response, id JSON)) success
       failure:(void (^)(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON)) failure {
    [self method:@"GET" API:endPointPath parameters:parameters success:success failure:failure];
}

+ (void)postAPI:(NSString *) endPointPath parameters:(NSDictionary *) parameters
        success:(void (^)(NSURLRequest *request, NSHTTPURLResponse *response, id JSON)) success
        failure:(void (^)(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON)) failure {
    [self method:@"POST" API:endPointPath parameters:parameters success:success failure:failure];
}
#pragma mark - internal
+ (void)method:(NSString *) method API:(NSString *) endPointPath parameters:(NSDictionary *) parameters
       success:(void (^)(NSURLRequest *request, NSHTTPURLResponse *response, id JSON)) success
       failure:(void (^)(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON)) failure {
    if (![OAuthConfig hasAccessToken]) {
        NSLog(@"Please Login Github.");
        return;
    }
    NSString *accessTokenFiled = [NSString stringWithFormat:@"token %@", [OAuthConfig accessToken]];
    [[self sharedClient] setDefaultHeader:@"Authorization" value:accessTokenFiled];
    NSMutableURLRequest *request = [[self sharedClient] requestWithMethod:method path:endPointPath parameters:parameters];
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:success failure:failure];
    [operation start];
}
@end