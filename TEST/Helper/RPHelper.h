//
//  RPHelper.h
//  TEST
//
//  Created by Rahul on 10/03/16.
//  Copyright © 2016 ROPOSO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface RPHelper : NSObject

typedef void(^ImageDownloadCompletionHandler)(BOOL succeeded, UIImage *image);


/*
 ** this function helps downloand image from URL Asynchronously
 ** scaling the original image
 */

+(void)downloadImageWithURL:(NSURL *)url completionBlock:(ImageDownloadCompletionHandler)block;


/*
 ** this function helps read data from a local file
 */

+ (NSArray*)dictionaryWithContentsOfJSONString:(NSString*)fileLocation;

@end
