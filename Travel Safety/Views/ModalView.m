//
//  ModalView.m
//  Travel Safety
//
//  Created by Philip Bale on 3/8/16.
//  Copyright © 2016 Philip Bale. All rights reserved.
//

#import "ModalView.h"

@implementation ModalView

-(void)awakeFromNib
{
    [super awakeFromNib];
    
    [self setAlpha:.8];
    
    CGFloat buttonWidth = 20;
    self.exitButton = [[UIButton alloc] initWithFrame:CGRectMake(buttonWidth / 2, buttonWidth / 2, buttonWidth, buttonWidth)];
    UIImage *exitIcon = [UIImage imageNamed:@"exit_icon"];
    [self.exitButton setBackgroundImage:exitIcon forState:UIControlStateNormal];
    
    [self.exitButton addTarget:self action:@selector(exitButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview: self.exitButton];
}

-(void)exitButtonPressed
{
    if (self.delegate) {
        [self.delegate exitButtonPressed];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
