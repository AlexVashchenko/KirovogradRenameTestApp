//
//  RKRSearchDataManager.h
//  NewName
//
//  Created by Vladimir Kalinichenko on 7/5/16.
//  Copyright © 2016 Onix-systems. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RKRDistrict.h"
#import "RKRStreet.h"
#import "RKRError.h"

@protocol RKRSearchDataManagerDelegate;


@interface RKRSearchDataManager : NSObject

@property (nonatomic, weak) id<RKRSearchDataManagerDelegate> delegate;

- (RLMResults<RKRDistrict *> *)allDistricts;
- (RLMResults<RKRStreet *> *)allStreets;

- (void)setFilter:(NSString *)filter;

@end


@protocol RKRSearchDataManagerDelegate <NSObject>

@optional
- (void)dataManagerWillUpdate:(RKRSearchDataManager *)dataManager;
- (void)dataManagerDidUpdate:(RKRSearchDataManager *)dataManager;
- (void)dataManagerFailedToUpdate:(RKRSearchDataManager *)dataManager withError:(RKRError *)error;

@end