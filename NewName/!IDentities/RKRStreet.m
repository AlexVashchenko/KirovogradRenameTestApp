//
//  RKRStreet.m
//  NewName
//
//  Created by Vladimir Kalinichenko on 7/5/16.
//  Copyright © 2016 Onix-systems. All rights reserved.
//

#import "RKRStreet.h"

@implementation RKRStreet

static NSString *APIKeyStreetId         = @"id";
static NSString *APIKeyStreetNewName    = @"new_name";
static NSString *APIKeyStreetOlsName    = @"old_name";

+ (NSString *)primaryKey {
    return @"id";
}

+ (NSArray<NSString *> *)indexedProperties {
    return @[@"nameOld, nameNew"];
}


- (instancetype)initWithJsonObject:(id)json {
    
    self = [super init];
    if(!self){
        return nil;
    }
    if(![json isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    NSDictionary *object = (NSDictionary *)json;
    
    self.id = [object[APIKeyStreetId] integerValue];
    self.nameNew = object[APIKeyStreetNewName];
    self.nameOld = object[APIKeyStreetOlsName];
    
    return self;
}


@end
