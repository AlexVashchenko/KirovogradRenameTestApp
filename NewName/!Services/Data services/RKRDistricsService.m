//
//  RKRDistricService.m
//  NewName
//
//  Created by Vladimir Kalinichenko on 7/5/16.
//  Copyright © 2016 Onix-systems. All rights reserved.
//

#import "RKRDistricsService.h"
#import "RKRApiManager.h"

@implementation RKRDistricsService

+ (void)getDistricsWithSuccess:(void(^)(NSArray<RKRDistrict *> *districts))success failure:(void(^)(RKRError *error))failure {
    
    [[RKRApiManager sharedManager] getDistrictsWithSuccess:^(id jsonDistricts) {
        
        NSMutableArray<RKRDistrict *> *districts = [NSMutableArray new];
        
        if([jsonDistricts isKindOfClass:[NSDictionary class]]){
            NSDictionary *districtsDictionary = (NSDictionary *)jsonDistricts;
            for (NSString *key in districtsDictionary.allKeys) {
                NSDictionary *districtDict = districtsDictionary[key];
                RKRDistrict *district = [[RKRDistrict alloc] initWithJsonObject:districtDict];
                [districts addObject:district];
            }
        }
        
        RLMRealm *realm = [RLMRealm defaultRealm];
        [realm beginWriteTransaction];
        [realm addOrUpdateObjectsFromArray:districts];
        [realm commitWriteTransaction];
        
        success(districts);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

@end
