//
//  DevShop.m
//  DataDoodle
//
//  Created by Eric Mentele on 6/23/16.
//  Copyright © 2016 Eric Mentele. All rights reserved.
//

#import "DevShop.h"
#import "Developer.h"

@implementation DevShop

- (void) willSave {
    [super willSave];
    
    [self refreshNumberOfEmployees];
}

- (void) refreshNumberOfEmployees {
    
    NSUInteger developersCount = self.developers.count;
    
    if (developersCount != self.numberOfEmployees.unsignedIntegerValue) {
        self.numberOfEmployees = @(developersCount);
    }
    
}

@end
