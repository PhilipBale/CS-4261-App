//
//  MapViewController.h
//  Travel Safety
//
//  Created by Philip Bale on 3/8/16.
//  Copyright © 2016 Philip Bale. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleMaps/GoogleMaps.h>

@interface MapViewController : UIViewController

@property (weak, nonatomic) IBOutlet GMSMapView *mapView;

@end
