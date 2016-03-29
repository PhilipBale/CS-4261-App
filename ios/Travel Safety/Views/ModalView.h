//
//  ModalView.h
//  Travel Safety
//
//  Created by Philip Bale on 3/8/16.
//  Copyright © 2016 Philip Bale. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ModalView;

@protocol ModalDelegate

-(void)exitButtonPressed;

@end

@interface ModalView : UIView


@property (nonatomic, strong) UIButton *exitButton;

@property (nonatomic, assign) id<ModalDelegate>  delegate;

@end
