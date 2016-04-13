//
//  MapViewController.h
//  Travel Safety
//
//  Created by Philip Bale on 3/8/16.
//  Copyright © 2016 Philip Bale. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleMaps/GoogleMaps.h>
#import "InfoViewController.h"
#import "AddFeedbackViewController.h"

@interface MapViewController : UIViewController<GMSAutocompleteResultsViewControllerDelegate, ModalViewControllerDelegate, GMSMapViewDelegate>

@property (weak, nonatomic) IBOutlet GMSMapView *mapView;

@property (nonatomic, strong) GMSAutocompleteResultsViewController *resultsViewController;
@property (nonatomic, strong) UISearchController *searchController;

@property (weak, nonatomic) IBOutlet UIView *searchBarContainer;

@property (weak, nonatomic) IBOutlet UIView *modalContainerView;

@property (weak, nonatomic) IBOutlet UIButton *leftActionButton;
@property (weak, nonatomic) IBOutlet UIButton *rightActionButton;
@property (weak, nonatomic) IBOutlet UIView *heatMapView;

@property (nonatomic, strong) NSArray *feedbackArray;
@property (nonatomic, strong) NSMutableArray *toDisplayArray;

@end