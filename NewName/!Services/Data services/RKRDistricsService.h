//
//  RKRDistricService.h
//  NewName
//
//  Created by Vladimir Kalinichenko on 7/5/16.
//  Copyright © 2016 Onix-systems. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RKRDistrict.h"
#import "RKRError.h"

@interface RKRDistricsService : NSObject

+ (void)getDistricsWithSuccess:(void(^)(NSArray<RKRDistrict *> *districts))success failure:(void(^)(RKRError *error))failure;

@end
