//
//  InfoViewController.h
//  Travel Safety
//
//  Created by Philip Bale on 3/8/16.
//  Copyright © 2016 Philip Bale. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleMaps/GoogleMaps.h>
#import "ModalViewController.h"
#import "StarSelectView.h"

@interface InfoViewController : ModalViewController<UITableViewDataSource, UITableViewDelegate>


@property (weak, nonatomic) IBOutlet UITableView *miniReviewTableView;
@property (weak, nonatomic) IBOutlet UILabel *cityName;
@property (weak, nonatomic) IBOutlet UITableView *feedbackTable;
@property (weak, nonatomic) IBOutlet UILabel *recommendLabel;
@property (weak, nonatomic) IBOutlet StarSelectView *starSelectView;

@property (nonatomic, strong) GMSPlace *currentPlace;
@property (nonatomic, strong) NSArray *feedbackArray;

@end
