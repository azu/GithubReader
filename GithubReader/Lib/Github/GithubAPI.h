//
// Created by azu on 2013/03/31.
//


#import <Foundation/Foundation.h>
#import "AFHTTPRequestOperationManager.h"


@interface GithubAPI : AFHTTPRequestOperationManager

+ (void)getAPI:(NSString *) endPointPath parameters:(NSDictionary *) parameters
       success:(void (^)(AFHTTPRequestOperation *, id)) success
       failure:(void (^)(AFHTTPRequestOperation *, NSError *)) failure;

+ (void)postAPI:(NSString *) endPointPath parameters:(NSDictionary *) parameters
        success:(void (^)(AFHTTPRequestOperation *, id)) success
        failure:(void (^)(AFHTTPRequestOperation *, NSError *)) failure;

+ (GithubAPI *)sharedClient;

@end