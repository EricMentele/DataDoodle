//
//  DevShop+CoreDataProperties.h
//  DataDoodle
//
//  Created by Eric Mentele on 6/23/16.
//  Copyright © 2016 Eric Mentele. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "DevShop.h"

NS_ASSUME_NONNULL_BEGIN

@interface DevShop (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *companyName;
@property (nullable, nonatomic, retain) NSDate *founded;
@property (nullable, nonatomic, retain) NSNumber *numberOfEmployees;
@property (nullable, nonatomic, retain) NSNumber *revenue;
@property (nullable, nonatomic, retain) NSSet<Developer *> *developers;

@end

@interface DevShop (CoreDataGeneratedAccessors)

- (void)addDevelopersObject:(Developer *)value;
- (void)removeDevelopersObject:(Developer *)value;
- (void)addDevelopers:(NSSet<Developer *> *)values;
- (void)removeDevelopers:(NSSet<Developer *> *)values;

@end

NS_ASSUME_NONNULL_END
