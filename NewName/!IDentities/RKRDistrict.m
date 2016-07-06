//
//  RKRDistrict.m
//  NewName
//
//  Created by Vladimir Kalinichenko on 7/5/16.
//  Copyright © 2016 Onix-systems. All rights reserved.
//

#import "RKRDistrict.h"

static NSString *APIKeyDistrictNewName  = @"newAreaName";
static NSString *APIKeyDistrictOldName  = @"oldAreaName";
static NSString *APIKeyDistrictStreets  = @"objects";

@implementation RKRDistrict


+ (NSString *)primaryKey {
    return @"areaNameOld";
}

- (instancetype)initWithJsonObject:(id)json {
    
    self = [super init];
    if(!self){
        return self;
    }
    if(![json isKindOfClass:[NSDictionary class]]) {
        return self;
    }
    
    NSDictionary *object = (NSDictionary *)json;
    
    self.areaNameNew = object[APIKeyDistrictNewName];
    self.areaNameOld = object[APIKeyDistrictOldName];
    
    NSArray *array = object[APIKeyDistrictStreets];
    for (id jsonStreetObj in array) {
        if([jsonStreetObj isKindOfClass:[NSDictionary class]]) {
            RKRStreet *street = [[RKRStreet alloc] initWithJsonObject:jsonStreetObj];
            [self.streets addObject:street];
        }
    }
    return self;
}

@end