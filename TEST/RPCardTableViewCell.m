//
//  RPCardTableViewCell.m
//  TEST
//
//  Created by Rahul on 10/03/16.
//  Copyright © 2016 ROPOSO. All rights reserved.
//

#import "RPCardTableViewCell.h"
#import "AsyncImageDownloadManager.h"

@interface RPCardTableViewCell()
@property (nonatomic, strong) IBOutlet UILabel *storyTitle;
@property (nonatomic, strong) IBOutlet UIImageView *storyImageView;


@end

@implementation RPCardTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

-(void)setCustomizeCell:(NSDictionary *)result {
  self.storyTitle.text = [result valueForKey:@"title"];
  
  NSString *imagePath  = [result valueForKey:@"si"];
  NSURL *url = [NSURL URLWithString:imagePath];
  
  
  [[AsyncImageDownloadManager sharedManager] downloadImageWithURL:url completionBlock:^(BOOL succeeded, UIImage *image) {
    if (succeeded && image) {
      dispatch_async(dispatch_get_main_queue(), ^{
        self.storyImageView.image = image;
      });
    }
  }];
}

@end
