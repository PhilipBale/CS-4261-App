//
//  Feedback.h
//  Travel Safety
//
//  Created by Philip Bale on 3/29/16.
//  Copyright © 2016 Philip Bale. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Feedback : NSObject

@property NSInteger uuid;
@property NSInteger userId;
@property NSInteger safety;
@property NSInteger cleanliness;
@property NSInteger comfort;
@property NSString *info;
@property NSInteger recommend;
@property NSString *createdAt;

+ (Feedback *)feedbackFromDictionary:(NSDictionary *)dictionary;


@end
