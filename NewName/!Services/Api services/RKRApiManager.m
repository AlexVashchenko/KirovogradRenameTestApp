//
//  RKRApiManager.m
//  NewName
//
//  Created by Vladimir Kalinichenko on 7/5/16.
//  Copyright © 2016 Onix-systems. All rights reserved.
//

#import "RKRApiManager.h"

static NSString *APIPathGetStreets = @"v1/streets";

@implementation RKRApiManager

- (NSURLSessionDataTask *)getDistrictsWithSuccess:(void (^)(id jsonDistricts))success failure:(void (^)(NSError *error))failure {

    return [self GET:APIPathGetStreets parameters:nil
             success:^(NSURLSessionDataTask *task, id responseObject) {
                 NSDictionary *responseDictionary = (NSDictionary *)responseObject;
                 success(responseDictionary);
             } failure:^(NSURLSessionDataTask *task, NSError *error) {
                 failure(error);
             }];
}

@end
