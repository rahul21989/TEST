//
//  RPStoryCardViewController.m
//  TEST
//
//  Created by Rahul on 10/03/16.
//  Copyright © 2016 ROPOSO. All rights reserved.
//

#import "RPStoryCardViewController.h"
#import "RPPreloadDataManager.h"
#import "RPCardTableViewCell.h"
#import "RPStoryCardDetailsViewController.h"

static NSString *cardTableViewCell = @"RPCardTableViewCell";

@interface RPStoryCardViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) IBOutlet UITableView *stodyCardTableView;
@property (nonatomic, strong) NSArray *resultList;
@end

@implementation RPStoryCardViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  //initialize table view  
  self.stodyCardTableView.delegate = self;
  self.stodyCardTableView.dataSource = self;
  [self.stodyCardTableView registerNib:[UINib nibWithNibName:cardTableViewCell bundle:nil] forCellReuseIdentifier:cardTableViewCell];
  self.resultList = [RPPreloadDataManager sharedRPPreloadDataManager].data;
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

#pragma mark - table dataSourch methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  NSInteger resultsCount = [self.resultList count];
  if (resultsCount > 0) {
    return resultsCount;
  }
  return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  
  RPCardTableViewCell *cell = (RPCardTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cardTableViewCell forIndexPath:indexPath];
  [cell setCustomizeCell:[_resultList objectAtIndex:indexPath.row]];
  cell.selectionStyle = UITableViewCellSelectionStyleNone;
  return cell;
}


#pragma mark - table delegate methods
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
  return 350;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  if ([_resultList objectAtIndex:indexPath.row] != nil) {
    RPStoryCardDetailsViewController *storyCardDetailsVC = [[RPStoryCardDetailsViewController alloc]initWithNibName:@"RPStoryCardDetailsViewController" bundle:nil];
    storyCardDetailsVC.info = [_resultList objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:storyCardDetailsVC animated:YES];
  }
}


@end
