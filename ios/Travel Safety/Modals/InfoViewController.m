//
//  InfoViewController.m
//  Travel Safety
//
//  Created by Philip Bale on 3/8/16.
//  Copyright © 2016 Philip Bale. All rights reserved.
//

#import "InfoViewController.h"
#import "ReviewMiniCell.h"
#import "TravelSafetyAPI.h"
#import "Feedback.h"

@interface InfoViewController ()

@end

@implementation InfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.miniReviewTableView.delegate = self;
    self.miniReviewTableView.dataSource = self;
    // Do any additional setup after loading the view from its nib.
    [self.cityName setText:self.currentPlace.formattedAddress];
    if (self.cityName.text == nil) {
        self.cityName.text = @"Metz, France";
    }
    
    self.feedbackArray = [[NSArray alloc] init];
    
    [TravelSafetyAPI fetchFeedbackWithCompletion:^(BOOL success, NSArray *feedback) {
        if (success) {
            self.feedbackArray = feedback;
            dispatch_async(dispatch_get_main_queue(), ^{
                [self refreshUIFromFeedback];
            });
        }
    }];
}

- (void)refreshUIFromFeedback
{
    [self.feedbackTable reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.feedbackArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ReviewMiniCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ReviewMiniCell"];
    if (!cell)
    {
        [self.miniReviewTableView registerNib:[UINib nibWithNibName:@"ReviewMiniCell" bundle:nil] forCellReuseIdentifier:@"ReviewMiniCell"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"ReviewMiniCell"];
    }
    
    Feedback *feedback = [self.feedbackArray objectAtIndex:indexPath.row];
    cell.reviewNameLabel.text = @"Tom Agger";
    
    NSNumber *total = [NSNumber numberWithDouble:(feedback.safety + feedback.cleanliness + feedback.comfort) / 3.0];
    cell.reviewRightLabel.text = [NSString stringWithFormat:@"%.1f/5", [total floatValue]];
    cell.reviewText.text = feedback.info;
    
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150;
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
