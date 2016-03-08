//
//  MapViewController.m
//  Travel Safety
//
//  Created by Philip Bale on 3/8/16.
//  Copyright © 2016 Philip Bale. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _resultsViewController = [[GMSAutocompleteResultsViewController alloc] init];
    _resultsViewController.delegate = self;
    
    _searchController = [[UISearchController alloc]
                         initWithSearchResultsController:_resultsViewController];
    _searchController.searchResultsUpdater = _resultsViewController;
    
    [self.searchBarContainer addSubview:_searchController.searchBar];
    
    // When UISearchController presents the results view, present it in
    // this view controller, not one further up the chain.
    self.definesPresentationContext = YES;
    
    self.leftActionButton.layer.cornerRadius = self.leftActionButton.bounds.size.width / 2;
    self.rightActionButton.layer.cornerRadius = self.rightActionButton.bounds.size.width / 2;
    
    [self.modalContainerView setAlpha:0];
}

// Handle the user's selection.
- (void)resultsController:(GMSAutocompleteResultsViewController *)resultsController
 didAutocompleteWithPlace:(GMSPlace *)place {
    [self dismissViewControllerAnimated:YES completion:nil];
    // Do something with the selected place.
    NSLog(@"Place name %@", place.name);
    NSLog(@"Place address %@", place.formattedAddress);
    NSLog(@"Place attributions %@", place.attributions.string);
    
    GMSCameraUpdate *updatedCamera = [GMSCameraUpdate setTarget:place.coordinate zoom:12];
    [self.mapView animateWithCameraUpdate:updatedCamera];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        _searchController.searchBar.frame = self.searchBarContainer.bounds;
    });
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)resultsController:(GMSAutocompleteResultsViewController *)resultsController
didFailAutocompleteWithError:(NSError *)error {
    //[self dismissViewControllerAnimated:YES completion:nil];
    // TODO: handle the error.
    NSLog(@"Error: %@", [error description]);
}

// Turn the network activity indicator on and off again.
- (void)didRequestAutocompletePredictionsForResultsController:
(GMSAutocompleteResultsViewController *)resultsController {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

- (void)didUpdateAutocompletePredictionsForResultsController:
(GMSAutocompleteResultsViewController *)resultsController {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)leftButtonPressed:(id)sender {
    NSLog(@"Left button pressed");
    
    InfoViewController *infoController = [[InfoViewController alloc] initWithNibName:@"InfoViewController" bundle:nil];
    [self addChildViewController:infoController];
    [infoController setDelegate:self];
    
    
    [infoController.view setFrame:self.modalContainerView.frame];
    [self.view addSubview:infoController.view];
    [infoController didMoveToParentViewController:self];
}
- (IBAction)rightButtonPressed:(id)sender {
    NSLog(@"Right button pressed");
    AddFeedbackViewController *addFeedbackViewController = [[AddFeedbackViewController alloc] initWithNibName:@"AddFeedbackViewController" bundle:nil];
    [self addChildViewController:addFeedbackViewController];
    [addFeedbackViewController setDelegate:self];
    
    
    [addFeedbackViewController.view setFrame:self.modalContainerView.frame];
    [self.view addSubview:addFeedbackViewController.view];
    [addFeedbackViewController didMoveToParentViewController:self];
}

- (IBAction)centerButtonPressed:(id)sender {
    NSLog(@"Center button pressed");
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Emergency Contact"
                                                                   message:nil
                                                            preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *button1 = [UIAlertAction actionWithTitle:@"Call Police" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * action) {
        //code to run once button is pressed
    }];
    UIAlertAction *button2 = [UIAlertAction actionWithTitle:@"Call Ambulance" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        //code to run once button is pressed
    }];
    
    UIAlertAction *button3 = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        //code to run once button is pressed
    }];
    
    [alert addAction:button1];
    [alert addAction:button2];
    [alert addAction:button3];
    [self presentViewController:alert animated:YES completion:nil];
}

-(void)exitRequested:(ModalViewController *)controller
{
    [controller.view removeFromSuperview];
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
