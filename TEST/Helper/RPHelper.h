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


/*
 ** this function helps read data from a local file
 */

+ (NSArray*)dictionaryWithContentsOfJSONString:(NSString*)fileLocation;

@end
