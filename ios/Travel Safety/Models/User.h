//
//  User.h
//  Travel Safety
//
//  Created by Philip Bale on 4/13/16.
//  Copyright © 2016 Philip Bale. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property NSInteger uuid;
@property NSString *firstName;
@property NSString *lastName;
@property NSString *email;
@property NSString *password;

+ (User *)userFromDictionary:(NSDictionary *)dictionary;


@end
