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
    if ([self.currentPlace.formattedAddress containsString:@"Atlanta"]) {
        [self.cityName setText:@"Atlanta, GA"];
    }
    if (self.cityName.text == nil) {
        self.cityName.text = @"Metz, France";
    }
    
    [self.starSelectView setStarsClickable:NO];
    
    self.feedbackArray = [[NSArray alloc] init];
    self.toDisplayArray = [[NSMutableArray alloc] init];
    
    if ([self.cityName.text containsString:@"Metz"] || [self.currentPlace.formattedAddress containsString:@"Metz"])
    {
        [self.touristSafetyIndexLabel setText:@"Tourist Safety Index: 82/100"];
        [self.crimeIndexLabel setText:@"Crime Index: 29/100"];
        return;
    } else {
        [self.touristSafetyIndexLabel setText:@"Tourist Safety Index: 63/100"];
        [self.crimeIndexLabel setText:@"Crime Index: 41/100"];
    }
    
    [TravelSafetyAPI fetchFeedbackWithCompletion:^(BOOL success, NSArray *feedback) {
        if (success) {
            self.feedbackArray = feedback;
            for (Feedback *feedback in self.feedbackArray)
            {
                if ([[feedback info] length] > 0)
                {
                    [self.toDisplayArray addObject:feedback];
                }
            }
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self refreshUIFromFeedback];
            });
        }
    }];
}

- (void)refreshUIFromFeedback
{
    [self.feedbackTable reloadData];
    NSInteger total = 0;
    NSInteger positive = 0;
    
    for (Feedback *feedbackItem in self.feedbackArray)
    {
        NSInteger subTotal = feedbackItem.cleanliness + feedbackItem.comfort + feedbackItem.friendliness + feedbackItem.beauty + feedbackItem.transportation;
        if (subTotal / 5 > 2) {
            positive++;
        }
        total += feedbackItem.safety + feedbackItem.cleanliness + feedbackItem.comfort;
    }
    
    total = total / (5 * [self.feedbackArray count]);
    
    if (total == 1) {
        [self.starSelectView star1Touched:self];
    } else if (total == 2) {
        [self.starSelectView star2Touched:self];
    } else if (total == 3) {
        [self.starSelectView star3Touched:self];
    } else if (total == 4) {
        [self.starSelectView star4Touched:self];
    } else if (total == 5) {
        [self.starSelectView star5Touched:self];
    }
    
    self.recommendLabel.text = [NSString stringWithFormat:@"%li of %li people recommend", positive, [self.feedbackArray count]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.toDisplayArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ReviewMiniCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ReviewMiniCell"];
    if (!cell)
    {
        [self.miniReviewTableView registerNib:[UINib nibWithNibName:@"ReviewMiniCell" bundle:nil] forCellReuseIdentifier:@"ReviewMiniCell"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"ReviewMiniCell"];
    }
    
    Feedback *feedback = [self.toDisplayArray objectAtIndex:indexPath.row];
    cell.reviewNameLabel.text = [feedback.user fullName];

    NSNumber *total = [NSNumber numberWithDouble:(feedback.cleanliness + feedback.comfort + feedback.friendliness + feedback.beauty + feedback.transportation) / 5.0];
    cell.reviewRightLabel.text = [NSString stringWithFormat:@"%.1f/5", [total floatValue]];
    cell.reviewText.text = feedback.info;
    
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
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
