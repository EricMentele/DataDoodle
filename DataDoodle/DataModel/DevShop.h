//
//  DevShop.h
//  DataDoodle
//
//  Created by Eric Mentele on 6/23/16.
//  Copyright © 2016 Eric Mentele. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Developer;

NS_ASSUME_NONNULL_BEGIN

@interface DevShop : NSManagedObject

- (void) refreshNumberOfEmployees;

@end

NS_ASSUME_NONNULL_END

#import "DevShop+CoreDataProperties.h"
