//
//  AddFeedbackViewController.h
//  Travel Safety
//
//  Created by Philip Bale on 3/8/16.
//  Copyright © 2016 Philip Bale. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleMaps/GoogleMaps.h>
#import "ModalViewController.h"
#import "StarSelectView.h"
#import "User.h"

@interface AddFeedbackViewController : ModalViewController
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;
@property (weak, nonatomic) IBOutlet UITextView *infoTextView;
@property (weak, nonatomic) IBOutlet UISlider *safetySlider;

@property (weak, nonatomic) IBOutlet StarSelectView *cleanlinessStars;
@property (weak, nonatomic) IBOutlet StarSelectView *comfortStars;
@property (weak, nonatomic) IBOutlet StarSelectView *friendlinessStars;
@property (weak, nonatomic) IBOutlet StarSelectView *beautyStars;
@property (weak, nonatomic) IBOutlet StarSelectView *transportationStars;

@property (nonatomic, strong) GMSPlace *currentPlace;
@property (nonatomic, strong) User *currentUser;

@end
