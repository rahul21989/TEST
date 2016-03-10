//
//  RPStoryCardDetailsViewController.m
//  TEST
//
//  Created by Rahul on 10/03/16.
//  Copyright © 2016 ROPOSO. All rights reserved.
//

#import "RPStoryCardDetailsViewController.h"
#import "RPHelper.h"

@interface RPStoryCardDetailsViewController ()
@property (nonatomic, strong) IBOutlet UIImageView *imageView;
@property (nonatomic, strong) IBOutlet UILabel *storyDescription;
@end

@implementation RPStoryCardDetailsViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.storyDescription.text = [self.info valueForKey:@"description"];
  
  NSString *imagePath  = [self.info valueForKey:@"si"];
  NSURL *url = [NSURL URLWithString:imagePath];
  
  [RPHelper downloadImageWithURL:url completionBlock:^(BOOL succeeded, UIImage *image) {
    if (succeeded) {
      // change the image in the cell
      if (image) {
        self.imageView.image = image;
      }
    }
  }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(IBAction)backButtonTapped:(id)sender {
  [self.navigationController popViewControllerAnimated:YES];
}


@end
