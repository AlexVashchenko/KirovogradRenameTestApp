//
//  RKRStreetCell.m
//  NewName
//
//  Created by Vladimir Kalinichenko on 7/5/16.
//  Copyright © 2016 Onix-systems. All rights reserved.
//

#import "RKRStreetCell.h"

@implementation RKRStreetCell

- (void)setStreet:(RKRStreet *)street {
    self.nameNewLabel.text = street.nameNew;
    self.nameOldLabel.text = street.nameOld;
}

@end
