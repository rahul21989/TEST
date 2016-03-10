//
//  RPHelper.m
//  TEST
//
//  Created by Rahul on 10/03/16.
//  Copyright © 2016 ROPOSO. All rights reserved.
//

#import "RPHelper.h"

@implementation RPHelper

/*
 ** this function helps downloand image from URL Asynchronously
 ** scaling the original image
 */

+(void)downloadImageWithURL:(NSURL *)url completionBlock:(ImageDownloadCompletionHandler)handler
{
  
  NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
  [NSURLConnection sendAsynchronousRequest:request
                                     queue:[NSOperationQueue mainQueue]
                         completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
                           if ( !error && [[UIImage alloc] initWithData:data])
                           {
                             UIImage *originalImage = [[UIImage alloc] initWithData:data];
                             
                             CGRect rect = CGRectMake(0, 0, 700, 700);
                             CGImageRef imageRef = CGImageCreateWithImageInRect([originalImage CGImage], rect) ;
                             UIImage *result = [UIImage imageWithCGImage:imageRef
                                                                   scale:.3
                                                             orientation:originalImage.imageOrientation];
                             
                             handler(YES,result);
                           } else{
                             handler(NO,nil);
                           }
                         }];
}


/*
 ** this function helps read data from a local file
 */

+ (NSArray*)dictionaryWithContentsOfJSONString:(NSString*)fileLocation{
  NSString *filePath = [[NSBundle mainBundle] pathForResource:fileLocation ofType:@"json"];
  NSData *data = [NSData dataWithContentsOfFile:filePath];
  
  NSArray *result = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
  return result;
}

@end
