//
//  Feedback.m
//  Travel Safety
//
//  Created by Philip Bale on 3/29/16.
//  Copyright © 2016 Philip Bale. All rights reserved.
//

#import "Feedback.h"

@implementation Feedback


+ (Feedback *)feedbackFromDictionary:(NSDictionary *)dictionary
{
    Feedback *feedback = [[Feedback alloc] init];
    feedback.uuid = [[dictionary objectForKey:@"id"] integerValue];
    feedback.safety = [[dictionary objectForKey:@"safety"] integerValue];
    feedback.cleanliness = [[dictionary objectForKey:@"cleanliness"] integerValue];
    feedback.comfort = [[dictionary objectForKey:@"comfort"] integerValue];
    feedback.info = [dictionary objectForKey:@"info"];
    feedback.recommend = [[dictionary objectForKey:@"recommend"] integerValue];
    feedback.createdAt = [dictionary objectForKey:@"created_at"];
    return feedback;
}


@end
