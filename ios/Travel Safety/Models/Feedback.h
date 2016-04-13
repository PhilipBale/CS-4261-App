//
//  Feedback.h
//  Travel Safety
//
//  Created by Philip Bale on 3/29/16.
//  Copyright © 2016 Philip Bale. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

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
@property NSNumber *latitude;
@property NSNumber *longitude;
@property NSString *createdAt;

@property (nonatomic, strong) User *user;


-(NSNumber *)average;
-(BOOL)safe;

+ (Feedback *)feedbackFromDictionary:(NSDictionary *)dictionary;


@end
