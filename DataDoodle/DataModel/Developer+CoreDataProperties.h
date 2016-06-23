//
//  Developer+CoreDataProperties.h
//  DataDoodle
//
//  Created by Eric Mentele on 6/23/16.
//  Copyright © 2016 Eric Mentele. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Developer.h"

NS_ASSUME_NONNULL_BEGIN

@interface Developer (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSNumber *salary;
@property (nullable, nonatomic, retain) NSDate *startDate;
@property (nullable, nonatomic, retain) NSString *title;
@property (nullable, nonatomic, retain) DevShop *devShop;

@end

NS_ASSUME_NONNULL_END
