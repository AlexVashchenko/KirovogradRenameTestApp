//
//  RKRStreet.h
//  NewName
//
//  Created by Vladimir Kalinichenko on 7/5/16.
//  Copyright © 2016 Onix-systems. All rights reserved.
//

#import <Realm/Realm.h>

RLM_ARRAY_TYPE(RKRStreet)
@interface RKRStreet : RLMObject

@property NSInteger id;
@property NSString *nameOld;
@property NSString *nameNew;

- (instancetype)initWithJsonObject:(id)json;

@end
