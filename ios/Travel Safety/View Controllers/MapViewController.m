//
//  MapViewController.m
//  Travel Safety
//
//  Created by Philip Bale on 3/8/16.
//  Copyright © 2016 Philip Bale. All rights reserved.
//

#import "MapViewController.h"
#import <CoreLocation/CoreLocation.h>
#import "TravelSafetyAPI.h"

@interface MapViewController ()<CLLocationManagerDelegate>
{

}

@property (nonatomic, strong) GMSPlace *currentPlace;
@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic) CLLocationCoordinate2D currentLocation;

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *email = self.usePhilip ? @"pbale95@gmail.com" : @"";
    [TravelSafetyAPI loginWithEmail:email password:@"" name:@"" completion:^(BOOL success, User *user) {
        if (success) {
            self.user = user;
        }
    }];
    
    if ([CLLocationManager locationServicesEnabled]) {
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.delegate = self;
        [self.locationManager startUpdatingLocation];
    } else {
        NSLog(@"Location services are not enabled");
    }
    
    _resultsViewController = [[GMSAutocompleteResultsViewController alloc] init];
    _resultsViewController.delegate = self;
    
    _searchController = [[UISearchController alloc]
                         initWithSearchResultsController:_resultsViewController];
    _searchController.searchResultsUpdater = _resultsViewController;
    
    _searchController.searchBar.backgroundImage = [[UIImage alloc]init];
    
    [self.searchBarContainer addSubview:_searchController.searchBar];
    
    // When UISearchController presents the results view, present it in
    // this view controller, not one further up the chain.
    self.definesPresentationContext = YES;
    
    self.leftActionButton.layer.cornerRadius = self.leftActionButton.bounds.size.width / 2;
    self.rightActionButton.layer.cornerRadius = self.rightActionButton.bounds.size.width / 2;
    
    self.heatMapView.layer.cornerRadius = self.heatMapView.bounds.size.width /2;
    self.heatMapView.hidden = YES;
    
    [self.modalContainerView setAlpha:0];
 
    
    CLLocationCoordinate2D metz = CLLocationCoordinate2DMake(49.102203, 6.215220);
    
    [[GMSGeocoder geocoder] reverseGeocodeCoordinate:metz completionHandler:^(GMSReverseGeocodeResponse * _Nullable response, NSError * _Nullable error) {
        return;
        for(GMSAddress* addressObj in [response results])
        {
            NSLog(@"coordinate.latitude=%f", addressObj.coordinate.latitude);
            NSLog(@"coordinate.longitude=%f", addressObj.coordinate.longitude);
            NSLog(@"thoroughfare=%@", addressObj.thoroughfare);
            NSLog(@"locality=%@", addressObj.locality);
            NSLog(@"subLocality=%@", addressObj.subLocality);
            NSLog(@"administrativeArea=%@", addressObj.administrativeArea);
            NSLog(@"postalCode=%@", addressObj.postalCode);
            NSLog(@"country=%@", addressObj.country);
            NSLog(@"lines=%@", addressObj.lines);
        }
    }];
    
    
    //self.currentPlace = [GMSPlace new];
    //self.currentPlace.formattedAddress =
    GMSCameraUpdate *updatedCamera = [GMSCameraUpdate setTarget:metz zoom:12];
    [self.mapView animateWithCameraUpdate:updatedCamera];
    self.mapView.delegate = self;
    
    [self updateMapData];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    [self.locationManager stopUpdatingLocation];
    CLLocation *location = [locations lastObject];
    self.currentLocation = location.coordinate;
    
    if (self.currentLocation.latitude == 0)
    {
        GMSCameraUpdate *updatedCamera = [GMSCameraUpdate setTarget:self.currentLocation zoom:12];
        [self.mapView animateWithCameraUpdate:updatedCamera];
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
} 


// Handle the user's selection.
- (void)resultsController:(GMSAutocompleteResultsViewController *)resultsController
 didAutocompleteWithPlace:(GMSPlace *)place {
    [self dismissViewControllerAnimated:YES completion:nil];
    self.currentPlace = place;
    // Do something with the selected place.
    NSLog(@"Place name %@", place.name);
    NSLog(@"Place address %@", place.formattedAddress);
    NSLog(@"Place lat: %f", place.coordinate.latitude);
    NSLog(@"Place long: %f", place.coordinate.longitude);
    NSLog(@"Place attributions %@", place.attributions.string);
    
    GMSCameraUpdate *updatedCamera = [GMSCameraUpdate setTarget:place.coordinate zoom:12];
    [self.mapView animateWithCameraUpdate:updatedCamera];
    
    
    [self changeHeatMapColorForSafety:[place.name containsString:@"Metz"]];

    self.heatMapView.hidden = NO;
}

-(void)changeHeatMapColorForSafety:(BOOL)safe
{
    if (safe) {
        self.heatMapView.backgroundColor = [[UIColor greenColor] colorWithAlphaComponent:.5];
    } else {
        self.heatMapView.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:.5];
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        _searchController.searchBar.frame = self.searchBarContainer.bounds;
    });
}

- (void)updateMapData
{
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
    [self.mapView clear];
    for (Feedback *feedback in self.feedbackArray)
    {
        CLLocationCoordinate2D position = CLLocationCoordinate2DMake([feedback.latitude doubleValue], [feedback.longitude doubleValue]);
        GMSMarker *marker = [GMSMarker markerWithPosition:position];
        marker.title = feedback.user.firstName;
        if ([feedback.info length] > 0) {
            marker.snippet = [NSString stringWithFormat:@"%@/5\n%@", feedback.average, feedback.info];
        } else {
            marker.snippet = [NSString stringWithFormat:@"%@/5\n", feedback.average];
        }
        marker.map = self.mapView;
    }
}

-(BOOL)mapView:(GMSMapView *)mapView didTapMarker:(GMSMarker *)marker {
    [mapView animateToLocation:marker.position];
    
    for (Feedback *feedback in self.feedbackArray)
    {
        if ([feedback.longitude doubleValue] == marker.position.longitude && [feedback.latitude doubleValue] == marker.position.latitude)
        {
            [self changeHeatMapColorForSafety:[feedback safe]];
        }
    }
    
    [self.mapView setSelectedMarker:marker];
    
    return YES;
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
- (IBAction)profileButtonPressed:(id)sender {
    NSLog(@"Profile button pressed");
    ProfileViewController *profileController = [[ProfileViewController alloc] initWithNibName:@"ProfileViewController" bundle:nil];
    
    [profileController setUser:self.user];
    
    [self addChildViewController:profileController];
    [profileController setDelegate:self];
    
    
    [profileController.view setFrame:self.modalContainerView.frame];
    
    [self.view addSubview:profileController.view];
    [profileController didMoveToParentViewController:self];
}

- (IBAction)leftButtonPressed:(id)sender {
    NSLog(@"Left button pressed");
    
    InfoViewController *infoController = [[InfoViewController alloc] initWithNibName:@"InfoViewController" bundle:nil];
    [infoController setCurrentPlace:self.currentPlace];
    [self addChildViewController:infoController];
    [infoController setDelegate:self];
    
    
    [infoController.view setFrame:self.modalContainerView.frame];
    
    [self.view addSubview:infoController.view];
    [infoController didMoveToParentViewController:self];
}
- (IBAction)rightButtonPressed:(id)sender {
    NSLog(@"Right button pressed");
    AddFeedbackViewController *addFeedbackViewController = [[AddFeedbackViewController alloc] initWithNibName:@"AddFeedbackViewController" bundle:nil];
    [addFeedbackViewController setCurrentPlace:self.currentPlace];
    [addFeedbackViewController setCurrentUser:self.user];
    
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
    [self updateMapData];
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
