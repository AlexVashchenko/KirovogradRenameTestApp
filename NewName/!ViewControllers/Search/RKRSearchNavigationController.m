//
//  RKRSearchNavigationController.m
//  NewName
//
//  Created by Vladimir Kalinichenko on 7/5/16.
//  Copyright © 2016 Onix-systems. All rights reserved.
//

#import "RKRSearchNavigationController.h"

@interface RKRSearchNavigationController()

@property (nonatomic, strong) RKRSearchDataManager *dataManager;

@end


@implementation RKRSearchNavigationController

- (RKRSearchDataManager *)dataManager {
    if(_dataManager == nil){
        _dataManager = [RKRSearchDataManager new];
    }
    return _dataManager;
}

@end
