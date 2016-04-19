//
//  ProfileViewController.m
//  Travel Safety
//
//  Created by Philip Bale on 4/13/16.
//  Copyright © 2016 Philip Bale. All rights reserved.
//

#import "ProfileViewController.h"
#import "TravelSafetyApi.h"
#import "ReviewMiniCell.h"
#import "TravelPlansViewController.h"

@interface ProfileViewController () <ModalViewControllerDelegate>

@property (nonatomic, strong) TravelPlansViewController *travelPlansViewController;

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.miniReviewTableView.delegate = self;
    self.miniReviewTableView.dataSource = self;
    
    
    self.feedbackArray = [[NSMutableArray alloc] init];
    self.toDisplayArray = [[NSMutableArray alloc] init];
    
    [TravelSafetyAPI fetchFeedbackWithCompletion:^(BOOL success, NSArray *feedbackRawArray) {
        if (success) {
            for (Feedback *feedback in feedbackRawArray)
            {
                if ([[feedback user] uuid] == self.user.uuid)
                {
                    [self.feedbackArray addObject:feedback];
                    
                    if ([[feedback info] length] > 0)
                    {
                        [self.toDisplayArray addObject:feedback];
                    }
                }
            }
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self refreshUIFromFeedback];
                [self.miniReviewTableView reloadData];
            });
        }
    }];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.nameLabel.text = [self.user fullName];
    self.emailLabel.text = [self.user email];
}

- (void)refreshUIFromFeedback
{
    NSInteger total = 0;
    NSInteger positive = 0;
    
    if ([self.feedbackArray count] == 0) return;
    
    for (Feedback *feedbackItem in self.feedbackArray)
    {
        NSInteger subTotal = feedbackItem.cleanliness + feedbackItem.comfort + feedbackItem.friendliness + feedbackItem.beauty + feedbackItem.transportation;
        if (subTotal / 5 > 2) {
            positive++;
        }
        total += feedbackItem.safety + feedbackItem.cleanliness + feedbackItem.comfort;
    }
    
    total = total / (5 * [self.feedbackArray count]);

    
    self.reviewsLabel.text = [NSString stringWithFormat:@"%li/%li positive reviews", positive, [self.feedbackArray count]];
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
    cell.reviewText.text = [NSString stringWithFormat:@"%@\n\n(%@)",feedback.info, feedback.name];
    
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}

- (IBAction)setTravelPlansButtonPressed:(id)sender {
    NSLog(@"Set travel plans button pressed");
    
    NSLog(@"Left button pressed");
    
    self.travelPlansViewController = [[TravelPlansViewController alloc] initWithNibName:@"TravelPlansViewController" bundle:nil];
    [self addChildViewController:self.travelPlansViewController];
    [self.travelPlansViewController setDelegate:self];
    
    
    [self.travelPlansViewController.view setFrame:self.view.bounds];
    
    [self.view addSubview:self.travelPlansViewController.view];
    [self.travelPlansViewController didMoveToParentViewController:self];
}

-(void)exitRequested:(ModalViewController *)controller
{
    [self.travelPlansViewController.view removeFromSuperview];
}

- (IBAction)logoutButtonPressed:(id)sender {
    NSLog(@"Logout button pressed!");
}

@end
