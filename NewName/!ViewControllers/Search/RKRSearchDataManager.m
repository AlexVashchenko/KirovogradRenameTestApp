//
//  RKRSearchDataManager.m
//  NewName
//
//  Created by Vladimir Kalinichenko on 7/5/16.
//  Copyright © 2016 Onix-systems. All rights reserved.
//

#import "RKRSearchDataManager.h"
#import "RKRDistricsService.h"

@interface RKRSearchDataManager()

@property RLMResults<RKRDistrict *> *districts;
@property RLMResults<RKRStreet *> *streets;

@property (nonatomic, strong) NSString *filterString;

@end

@implementation RKRSearchDataManager

- (void)setFilter:(NSString *)filter {
    _filterString = [filter copy];
}

- (instancetype)init {
    self = [super init];
    if(self) {
        self.districts = [RKRDistrict allObjects];
        self.streets = [RKRStreet allObjects];
        
        if([self.delegate respondsToSelector:@selector(dataManagerWillUpdate:)]) {
            [self.delegate dataManagerWillUpdate:self];
        }
        
        [RKRDistricsService getDistricsWithSuccess:^(NSArray<RKRDistrict *> *districts) {
            if([self.delegate respondsToSelector:@selector(dataManagerDidUpdate:)]) {
                [self.delegate dataManagerDidUpdate:self];
            }
        } failure:^(RKRError *error) {
            if([self.delegate respondsToSelector:@selector(dataManagerFailedToUpdate:withError:)]) {
                [self.delegate dataManagerFailedToUpdate:self withError:error];
            }
        }];
    }
    return self;
}

- (RLMResults<RKRDistrict *> *)allDistricts {
    if(self.filterString.length == 0) {
    return self.districts;
    }else {
        return nil;
    }
}

- (RLMResults<RKRStreet *> *)allStreets {
    if(self.filterString.length == 0) {
    return self.streets;
    }else {
        return [RKRStreet objectsWhere:[NSString stringWithFormat:@"nameOld CONTAINS '%@'",self.filterString]];
    }
}

@end
