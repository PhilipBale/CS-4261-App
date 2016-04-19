//
//  TravelSafetyAPI.h
//  Travel Safety
//
//  Created by Philip Bale on 3/29/16.
//  Copyright © 2016 Philip Bale. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Feedback.h"
#import "User.h"

@interface TravelSafetyAPI : NSObject

+ (void)loginWithEmail:(NSString *)email password:(NSString *)password name:(NSString *)name completion:(void (^)(BOOL success, User *user))completion;

+ (void)postFeedbackWithName:(NSString *)name email:(NSString *)email safety:(NSInteger)safety cleanliness:(NSInteger)cleanliness comfort:(NSInteger)comfort friendliness:(NSInteger)friendliness beauty:(NSInteger)beauty transportation:(NSInteger)transportation latitude:(NSNumber *)latitude longitude:(NSNumber *)longitude info:(NSString *)info completion:(void (^)(BOOL))completion;

+ (void)fetchFeedbackWithCompletion:(void (^)(BOOL success, NSArray *feedback))completion;

@end
