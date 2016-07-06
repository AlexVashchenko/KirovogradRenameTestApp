//
//  RKRSessionManager.m
//  NewName
//
//  Created by Vladimir Kalinichenko on 7/5/16.
//  Copyright © 2016 Onix-systems. All rights reserved.
//

#import "RKRSessionManager.h"

static NSString *const kBaseURL = @"http://rename.kr.ua/api/";

@implementation RKRSessionManager

+ (instancetype)sharedManager {
    
    static RKRSessionManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] init];
    });
    return manager;
}

- (instancetype)init {
    
    self = [super initWithBaseURL:[NSURL URLWithString:kBaseURL]];
    if(self) {
        self.responseSerializer = [AFJSONResponseSerializer serializer];
        self.requestSerializer = [AFJSONRequestSerializer serializer];
    }
    return self;
}

@end