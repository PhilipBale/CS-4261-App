//
//  ReviewMiniCell.h
//  Travel Safety
//
//  Created by Philip Bale on 3/9/16.
//  Copyright © 2016 Philip Bale. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReviewMiniCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *reviewNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *reviewRightLabel;
@property (weak, nonatomic) IBOutlet UITextView *reviewText;

@end
