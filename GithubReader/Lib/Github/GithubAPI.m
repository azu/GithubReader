//
// Created by azu on 2013/03/31.
//


#import <AFNetworking/AFHTTPRequestOperation.h>
#import "GithubAPI.h"
#import "AFHTTPClient.h"
#import "AFJSONRequestOperation.h"
#import "OAuthConfig.h"


@implementation GithubAPI {

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
    NSURL *baseURL = [NSURL URLWithString:@"https://api.github.com/"];
    AFHTTPClient *client = [[AFHTTPClient alloc] initWithBaseURL:baseURL];
    [client setDefaultHeader:@"Authorization" value:[NSString stringWithFormat:@"token %@",[OAuthConfig accessToken]]];
    NSMutableURLRequest *request = [client requestWithMethod:method path:endPointPath parameters:parameters];
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:success failure:failure];
    [operation start];
}
@end