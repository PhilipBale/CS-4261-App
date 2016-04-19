//
//  TravelSafetyAPI.m
//  Travel Safety
//
//  Created by Philip Bale on 3/29/16.
//  Copyright © 2016 Philip Bale. All rights reserved.
//

#import "TravelSafetyAPI.h"
#import "HTTPManager.h"

@implementation TravelSafetyAPI


+ (void)loginWithEmail:(NSString *)email password:(NSString *)password name:(NSString *)name completion:(void (^)(BOOL success, User *user))completion
{
    NSDictionary *params = @{@"email": email};
    
    [[HTTPManager sharedManager] GET:kApiLoginPath parameters:params success:^(NSDictionary *responseObject)
     {
         NSDictionary *result = [responseObject objectForKey:@"user"];
         
         
         User *resultUser = [User userFromDictionary:result];
         
         if (completion) completion(YES, resultUser);
     } failure:^(NSError *error) {
         if (completion) completion(NO, nil);
     }];
}

+ (void)postFeedbackWithName:(NSString *)name email:(NSString *)email safety:(NSInteger)safety cleanliness:(NSInteger)cleanliness comfort:(NSInteger)comfort friendliness:(NSInteger)friendliness beauty:(NSInteger)beauty transportation:(NSInteger)transportation latitude:(NSNumber *)latitude longitude:(NSNumber *)longitude info:(NSString *)info completion:(void (^)(BOOL))completion
{
    
    NSDictionary *params = @{@"feedback":@{@"email":email, @"name":name, @"safety":@(safety), @"cleanliness":@(cleanliness),@"comfort":@(comfort),@"friendliness":@(friendliness),@"beauty":@(beauty),@"transportation":@(transportation), @"latitude":latitude, @"longitude":longitude,@"info":info}};
    [[HTTPManager sharedManager] POST:kApiPostFeedbackPath parameters:params success:^(NSDictionary *responseObject)
     {
         NSLog(@"Failed parse persisted");
         
         if (completion) completion(YES);
     } failure:^(NSError *error) {
         if (completion) completion(NO);
     }];
    
}

+ (void)fetchFeedbackWithCompletion:(void (^)(BOOL success, NSArray *feedback))completion
{
    [[HTTPManager sharedManager] GET:kApiFetchFeedbackPath parameters:nil success:^(NSDictionary *responseObject)
     {
         NSDictionary *results = [responseObject objectForKey:@"feedback"];
         
         NSMutableArray *feedback = [[NSMutableArray alloc] init];
         
         for (NSDictionary *result in results)
         {
             
             Feedback *resultFeedback = [Feedback feedbackFromDictionary:result];
             
             [feedback addObject:resultFeedback];
         }
         
         if (completion) completion(YES, feedback);
     } failure:^(NSError *error) {
         if (completion) completion(NO, nil);
     }];
}


@end
