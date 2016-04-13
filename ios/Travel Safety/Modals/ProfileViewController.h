//
//  ProfileViewController.h
//  Travel Safety
//
//  Created by Philip Bale on 4/13/16.
//  Copyright © 2016 Philip Bale. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModalViewController.h"
#import "User.h"
#import "Feedback.h"

@interface ProfileViewController : ModalViewController<UITableViewDataSource, UITableViewDelegate>


@property (weak, nonatomic) IBOutlet UITableView *miniReviewTableView;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;
@property (weak, nonatomic) IBOutlet UILabel *reviewsLabel;

@property (nonatomic, strong) User *user;


@property (nonatomic, strong) NSMutableArray *feedbackArray;
@property (nonatomic, strong) NSMutableArray *toDisplayArray;

@end
