//
//  User.m
//  Travel Safety
//
//  Created by Philip Bale on 4/13/16.
//  Copyright © 2016 Philip Bale. All rights reserved.
//

#import "User.h"

@implementation User


- (NSString *)fullName
{
    return [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
}

+ (User *)userFromDictionary:(NSDictionary *)dictionary
{
    User *user = [[User alloc] init];
    user.uuid = [[dictionary objectForKey:@"id"] integerValue]; ;
    user.firstName = [dictionary objectForKey:@"first_name"];
    user.lastName = [dictionary objectForKey:@"last_name"];
    user.email = [dictionary objectForKey:@"email"];
    user.password = [dictionary objectForKey:@"password"];
    return user;
}

@end