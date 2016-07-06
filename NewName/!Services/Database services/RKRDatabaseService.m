//
//  RKRDatabaseService.m
//  NewName
//
//  Created by Vladimir Kalinichenko on 7/6/16.
//  Copyright © 2016 Onix-systems. All rights reserved.
//

#import "RKRDatabaseService.h"

@implementation RKRDatabaseService

+ (instancetype)sharedService {
    
    static RKRDatabaseService *service = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        service = [[self alloc] init];
    });
    return service;
}

- (instancetype)init {
    
    self = [super init];
    if(self) {
        
    }
    return self;
}

@end