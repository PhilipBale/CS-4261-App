//
//  AddFeedbackViewController.h
//  Travel Safety
//
//  Created by Philip Bale on 3/8/16.
//  Copyright © 2016 Philip Bale. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModalViewController.h"
#import "StarSelectView.h"

@interface AddFeedbackViewController : ModalViewController
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;
@property (weak, nonatomic) IBOutlet UITextView *infoTextView;
@property (weak, nonatomic) IBOutlet UISlider *recommendSlider;

@property (weak, nonatomic) IBOutlet StarSelectView *safetyStars;
@property (weak, nonatomic) IBOutlet StarSelectView *cleanlinessStars;
@property (weak, nonatomic) IBOutlet StarSelectView *comfortStars;

@end
