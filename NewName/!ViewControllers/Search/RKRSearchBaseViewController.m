//
//  RKRSearchBaseViewController.m
//  NewName
//
//  Created by Vladimir Kalinichenko on 7/5/16.
//  Copyright © 2016 Onix-systems. All rights reserved.
//

#import "RKRSearchBaseViewController.h"
#import "RKRSearchNavigationController.h"

@implementation RKRSearchBaseViewController

- (RKRSearchDataManager *)dataManager {
    if([self.navigationController isKindOfClass:[RKRSearchNavigationController class]]) {
        RKRSearchNavigationController *nc = (RKRSearchNavigationController *)self.navigationController;
        return nc.dataManager;
    }
    return nil;
}

@end
