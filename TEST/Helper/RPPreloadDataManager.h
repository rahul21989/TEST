//
//  RPPreloadDataManager.h
//  TEST
//
//  Created by Rahul on 10/03/16.
//  Copyright © 2016 ROPOSO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CWLSynthesizeSingleton.h"


@interface RPPreloadDataManager : NSObject

CWL_DECLARE_SINGLETON_FOR_CLASS(RPPreloadDataManager)

@property (strong, nonatomic) NSArray *data;

@end
