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
@property NSString *name;
@property NSInteger userId;
@property NSInteger safety;
@property NSInteger cleanliness;
@property NSInteger comfort;
@property NSInteger friendliness;
@property NSInteger beauty;
@property NSInteger transportation;
@property NSString *info;
@property NSString *createdAt;

+ (Feedback *)feedbackFromDictionary:(NSDictionary *)dictionary;


@end
