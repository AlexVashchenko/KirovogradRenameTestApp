//
//  RKRSessionManager.h
//  NewName
//
//  Created by Vladimir Kalinichenko on 7/5/16.
//  Copyright © 2016 Onix-systems. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface RKRSessionManager : AFHTTPSessionManager

+ (instancetype)sharedManager;

@end
