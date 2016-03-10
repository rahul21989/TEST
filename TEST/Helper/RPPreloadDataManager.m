//
//  RPPreloadDataManager.m
//  TEST
//
//  Created by Rahul on 10/03/16.
//  Copyright © 2016 ROPOSO. All rights reserved.
//

#import "RPPreloadDataManager.h"
#import "RPHelper.h"

@implementation RPPreloadDataManager

CWL_SYNTHESIZE_SINGLETON_FOR_CLASS(RPPreloadDataManager);

-(id)init {
  if (self = [super init]) {
  [RPPreloadDataManager sharedRPPreloadDataManager].data = [RPHelper dictionaryWithContentsOfJSONString:@"iOS-Android Data"];
  }
  return self;
}


@end
