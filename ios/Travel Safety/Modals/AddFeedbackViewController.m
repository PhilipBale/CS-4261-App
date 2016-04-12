//
//  AddFeedbackViewController.m
//  Travel Safety
//
//  Created by Philip Bale on 3/8/16.
//  Copyright © 2016 Philip Bale. All rights reserved.
//

#import "AddFeedbackViewController.h"
#import "TravelSafetyAPI.h"

@interface AddFeedbackViewController ()

@end

@implementation AddFeedbackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.cityLabel setText:self.currentPlace.formattedAddress];
    if (self.cityLabel.text == nil) {
        self.cityLabel.text = @"Metz, France";
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)submitButtonPressed:(id)sender {
    NSLog(@"Safeth slider value: %f", [self.safetySlider value]);
    
    [TravelSafetyAPI postFeedbackWithName:@"" safety:[self.safetySlider value] cleanliness:[self.cleanlinessStars currentValue] comfort:[self.comfortStars currentValue] friendliness:[self.friendlinessStars currentValue] beauty:[self.beautyStars currentValue] transportation:[self.transportationStars currentValue] info:self.infoTextView.text completion:^(BOOL success) {
        if (success) {
            [self exitButtonPressed];
        }
    }];
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
