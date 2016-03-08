//
//  ModalViewController.h
//  Travel Safety
//
//  Created by Philip Bale on 3/8/16.
//  Copyright © 2016 Philip Bale. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModalView.h"

@class ModalViewController;

@protocol ModalViewControllerDelegate

-(void)exitRequested:(ModalViewController *)controller;

@end

@interface ModalViewController : UIViewController<ModalDelegate>

@property (nonatomic, assign) id<ModalViewControllerDelegate>  delegate;

@end
