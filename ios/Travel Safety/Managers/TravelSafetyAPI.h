//
//  TravelSafetyAPI.h
//  Travel Safety
//
//  Created by Philip Bale on 3/29/16.
//  Copyright © 2016 Philip Bale. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Feedback.h"

@interface TravelSafetyAPI : NSObject

+ (void)loginOrRegisterWithEmail:(NSString *)email password:(NSString *)password name:(NSString *)name completion:(void (^)(BOOL))completion;
+ (void)loginWithToken:(NSString *)token completion:(void (^)(BOOL))completion;

+ (void)postFeedback:(NSInteger)safety cleanliness:(NSInteger)cleanliness comfort:(NSInteger)comfort info:(NSString *)info recommend:(NSInteger)recommend completion:(void (^)(BOOL))completion;

+ (void)fetchFeedbackWithCompletion:(void (^)(BOOL success, NSArray *feedback))completion;

@end
