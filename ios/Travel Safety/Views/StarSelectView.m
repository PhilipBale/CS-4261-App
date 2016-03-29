//
//  StarSelectView.m
//  Travel Safety
//
//  Created by Philip Bale on 3/29/16.
//  Copyright © 2016 Philip Bale. All rights reserved.
//

#import "StarSelectView.h"

@implementation StarSelectView

-(void)awakeFromNib
{
    UIView *subview = [[[UINib nibWithNibName:@"StarSelectView" bundle:nil] instantiateWithOwner:self options:nil] objectAtIndex:0];
    [subview setFrame:self.bounds];
    [self addSubview:subview];
    [self setBackgroundColor:[UIColor clearColor]];
    
    self.goldStar = [UIImage imageNamed:@"gold_star"];
    self.greyStar = [UIImage imageNamed:@"star"];
    
    self.currentValue = 0;
}

- (IBAction)star1Touched:(id)sender {
    [self.star1 setBackgroundImage:self.goldStar forState:UIControlStateNormal];
    [self.star2 setBackgroundImage:self.greyStar forState:UIControlStateNormal];
    [self.star3 setBackgroundImage:self.greyStar forState:UIControlStateNormal];
    [self.star4 setBackgroundImage:self.greyStar forState:UIControlStateNormal];
    [self.star5 setBackgroundImage:self.greyStar forState:UIControlStateNormal];
    
    self.currentValue = 1;
}
- (IBAction)star2Touched:(id)sender {
    [self.star1 setBackgroundImage:self.goldStar forState:UIControlStateNormal];
    [self.star2 setBackgroundImage:self.goldStar forState:UIControlStateNormal];
    [self.star3 setBackgroundImage:self.greyStar forState:UIControlStateNormal];
    [self.star4 setBackgroundImage:self.greyStar forState:UIControlStateNormal];
    [self.star5 setBackgroundImage:self.greyStar forState:UIControlStateNormal];
    self.currentValue = 2;
}
- (IBAction)star3Touched:(id)sender {
    [self.star1 setBackgroundImage:self.goldStar forState:UIControlStateNormal];
    [self.star2 setBackgroundImage:self.goldStar forState:UIControlStateNormal];
    [self.star3 setBackgroundImage:self.goldStar forState:UIControlStateNormal];
    [self.star4 setBackgroundImage:self.greyStar forState:UIControlStateNormal];
    [self.star5 setBackgroundImage:self.greyStar forState:UIControlStateNormal];
    self.currentValue = 3;
}
- (IBAction)star4Touched:(id)sender {
    [self.star1 setBackgroundImage:self.goldStar forState:UIControlStateNormal];
    [self.star2 setBackgroundImage:self.goldStar forState:UIControlStateNormal];
    [self.star3 setBackgroundImage:self.goldStar forState:UIControlStateNormal];
    [self.star4 setBackgroundImage:self.goldStar forState:UIControlStateNormal];
    [self.star5 setBackgroundImage:self.greyStar forState:UIControlStateNormal];
    self.currentValue = 4;
}

- (IBAction)star5Touched:(id)sender {
    [self.star1 setBackgroundImage:self.goldStar forState:UIControlStateNormal];
    [self.star2 setBackgroundImage:self.goldStar forState:UIControlStateNormal];
    [self.star3 setBackgroundImage:self.goldStar forState:UIControlStateNormal];
    [self.star4 setBackgroundImage:self.goldStar forState:UIControlStateNormal];
    [self.star5 setBackgroundImage:self.goldStar forState:UIControlStateNormal];
    self.currentValue = 5;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
