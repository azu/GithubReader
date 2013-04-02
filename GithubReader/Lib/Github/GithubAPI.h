//
// Created by azu on 2013/03/31.
//


#import <Foundation/Foundation.h>

@class AFHTTPRequestOperation;
@class AFJSONRequestOperation;

@interface GithubAPI : NSObject

+ (void)getAPI:(NSString *) endPointPath parameters:(NSDictionary *) parameters
       success:(void (^)(NSURLRequest *request, NSHTTPURLResponse *response, id JSON)) success
       failure:(void (^)(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON)) failure;

+ (void)postAPI:(NSString *) endPointPath parameters:(NSDictionary *) parameters
        success:(void (^)(NSURLRequest *request, NSHTTPURLResponse *response, id JSON)) success
        failure:(void (^)(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON)) failure;
@end