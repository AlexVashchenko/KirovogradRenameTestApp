//
//  RKRDistrict.h
//  NewName
//
//  Created by Vladimir Kalinichenko on 7/5/16.
//  Copyright © 2016 Onix-systems. All rights reserved.
//

#import <Realm/Realm.h>
#import "RKRStreet.h"

@interface RKRDistrict : RLMObject

//@property NSInteger id;
@property NSString *areaNameOld;
@property NSString *areaNameNew;
@property RLMArray<RKRStreet *><RKRStreet> *streets;

- (instancetype)initWithJsonObject:(id)json;

@end


