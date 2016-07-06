//
//  RKRApiManager.h
//  NewName
//
//  Created by Vladimir Kalinichenko on 7/5/16.
//  Copyright © 2016 Onix-systems. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RKRDistrict.h"
#import "RKRSessionManager.h"

@interface RKRApiManager : RKRSessionManager

- (NSURLSessionDataTask *)getDistrictsWithSuccess:(void (^)(id jsonDistricts))success failure:(void (^)(NSError *error))failure;

@end
