//
//  StarSelectView.h
//  Travel Safety
//
//  Created by Philip Bale on 3/29/16.
//  Copyright © 2016 Philip Bale. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StarSelectView : UIView
@property (weak, nonatomic) IBOutlet UIButton *star1;
@property (weak, nonatomic) IBOutlet UIButton *star2;
@property (weak, nonatomic) IBOutlet UIButton *star3;
@property (weak, nonatomic) IBOutlet UIButton *star4;
@property (weak, nonatomic) IBOutlet UIButton *star5;

@property (nonatomic, strong) UIImage *greyStar;
@property (nonatomic, strong) UIImage *goldStar;

@property NSInteger currentValue;

- (IBAction)star1Touched:(id)sender;
- (IBAction)star2Touched:(id)sender;
- (IBAction)star3Touched:(id)sender;
- (IBAction)star4Touched:(id)sender;
- (IBAction)star5Touched:(id)sender;

@property BOOL starsClickable;

@end
