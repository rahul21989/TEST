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
 ** this function helps read data from a local file
 */

+ (NSArray*)dictionaryWithContentsOfJSONString:(NSString*)fileLocation{
  NSString *filePath = [[NSBundle mainBundle] pathForResource:fileLocation ofType:@"json"];
  NSData *data = [NSData dataWithContentsOfFile:filePath];
  
  NSArray *result = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
  return result;
}

@end
