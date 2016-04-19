//
//  LoginViewController.m
//  Travel Safety
//
//  Created by Philip Bale on 4/19/16.
//  Copyright © 2016 Philip Bale. All rights reserved.
//

#import "LoginViewController.h"
#import "MapViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"MapViewShowPhilip"])
    {
        MapViewController *mvc = [segue destinationViewController];
        mvc.usePhilip = true;
    }
}
- (IBAction)loginAsPhilip:(id)sender {
    [self performSegueWithIdentifier:@"MapViewShowPhilip" sender:self];
    
    
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
