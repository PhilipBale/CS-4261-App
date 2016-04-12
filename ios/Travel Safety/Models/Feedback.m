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
    feedback.name = [dictionary objectForKey:@"name"];
    feedback.safety = [[dictionary objectForKey:@"safety"] integerValue];
    feedback.cleanliness = [[dictionary objectForKey:@"cleanliness"] integerValue];
    feedback.comfort = [[dictionary objectForKey:@"comfort"] integerValue];
    feedback.friendliness = [[dictionary objectForKey:@"friendliness"] integerValue];
    feedback.beauty = [[dictionary objectForKey:@"beauty"] integerValue];
    feedback.transportation = [[dictionary objectForKey:@"transportation"] integerValue];
    feedback.info = [dictionary objectForKey:@"info"];
    feedback.createdAt = [dictionary objectForKey:@"created_at"];
    return feedback;
}

@end
