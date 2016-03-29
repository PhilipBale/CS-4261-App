//
//  HTTPManager.h
//  Travel Safety
//
//  Created by Philip Bale on 3/29/16.
//  Copyright © 2016 Philip Bale. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPRequestOperationManager.h"

extern NSString * const kApiLoginOrRegisterPath;
extern NSString * const kApiLoginWithTokenPath;
extern NSString * const kApiFetchFeedbackPath;
extern NSString * const kApiPostFeedbackPath;

@interface HTTPManager : AFHTTPRequestOperationManager

+ (HTTPManager *)sharedManager;

- (void)GET:(NSString *)URLString parameters:(id)parameters success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;
- (void)POST:(NSString *)URLString parameters:(id)parameters success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;
- (void)setRequestHeadersForAPIToken:(NSString *)apiToken;

@end
