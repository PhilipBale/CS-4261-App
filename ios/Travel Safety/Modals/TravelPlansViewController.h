//
//  TravelPlansViewController.h
//  Travel Safety
//
//  Created by Philip Bale on 4/19/16.
//  Copyright © 2016 Philip Bale. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModalViewController.h"

@interface TravelPlansViewController : ModalViewController

@property (weak, nonatomic) IBOutlet UITextField *date1TextField;
@property (weak, nonatomic) IBOutlet UITextField *date2TextField;
@property (weak, nonatomic) IBOutlet UITextField *date3TextField;
@property (weak, nonatomic) IBOutlet UITextField *date4TextField;

@end
