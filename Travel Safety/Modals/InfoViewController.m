//
//  InfoViewController.m
//  Travel Safety
//
//  Created by Philip Bale on 3/8/16.
//  Copyright © 2016 Philip Bale. All rights reserved.
//

#import "InfoViewController.h"
#import "ReviewMiniCell.h"

@interface InfoViewController ()

@end

@implementation InfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.miniReviewTableView.delegate = self;
    self.miniReviewTableView.dataSource = self;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ReviewMiniCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ReviewMiniCell"];
    if (!cell)
    {
        [self.miniReviewTableView registerNib:[UINib nibWithNibName:@"ReviewMiniCell" bundle:nil] forCellReuseIdentifier:@"ReviewMiniCell"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"ReviewMiniCell"];
    }
    
    
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
