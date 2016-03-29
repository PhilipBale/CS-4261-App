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



+ (void)postFeedback:(NSInteger)safety cleanliness:(NSInteger)cleanliness comfort:(NSInteger)comfort info:(NSString *)info recommend:(NSInteger)recommend completion:(void (^)(BOOL))completion
{
    
    NSDictionary *params = @{@"feedback":@{@"safety":@(safety), @"cleanliness":@(cleanliness),@"comfort":@(comfort),@"info":info, @"recommend":@(recommend)}};
    [[HTTPManager sharedManager] POST:kApiPostFeedbackPath parameters:params success:^(NSDictionary *responseObject)
     {
         NSLog(@"Failed parse persisted");
         
         if (completion) completion(YES);
     } failure:^(NSError *error) {
         if (completion) completion(NO);
     }];
    
}

+ (void)fetchFeedbackWithCompletion:(void (^)(BOOL))completion
{
    
}


@end
