//
//  Feedback.m
//  Travel Safety
//
//  Created by Philip Bale on 3/29/16.
//  Copyright © 2016 Philip Bale. All rights reserved.
//

#import "Feedback.h"

@implementation Feedback

-(NSNumber *)average
{
    return [NSNumber numberWithDouble:(self.cleanliness + self.comfort + self.friendliness + self.beauty + self.transportation) / 5.0];
}

-(BOOL)safe
{
    return [self.average doubleValue] >= 2.5;
}

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
    feedback.latitude = [dictionary objectForKey:@"latitude"];
    feedback.longitude = [dictionary objectForKey:@"longitude"];
    feedback.createdAt = [dictionary objectForKey:@"created_at"];
    feedback.user = [User userFromDictionary:[dictionary objectForKey:@"user"]];
    return feedback;
}

@end
