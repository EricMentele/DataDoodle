// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DevShop.h instead.

#if __has_feature(modules)
    @import Foundation;
    @import CoreData;
#else
    #import <Foundation/Foundation.h>
    #import <CoreData/CoreData.h>
#endif

NS_ASSUME_NONNULL_BEGIN

@class Developer;

@interface DevShopID : NSManagedObjectID {}
@end

@interface _DevShop : NSManagedObject
+ (instancetype)insertInManagedObjectContext:(NSManagedObjectContext *)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) DevShopID *objectID;

@property (nonatomic, strong) NSString* companyName;

@property (nonatomic, strong) NSDate* founded;

@property (nonatomic, strong, nullable) NSNumber* numberOfEmployees;

@property (atomic) int16_t numberOfEmployeesValue;
- (int16_t)numberOfEmployeesValue;
- (void)setNumberOfEmployeesValue:(int16_t)value_;

@property (nonatomic, strong, nullable) NSNumber* revenue;

@property (atomic) double revenueValue;
- (double)revenueValue;
- (void)setRevenueValue:(double)value_;

@property (nonatomic, strong, nullable) NSSet<Developer*> *developers;
- (nullable NSMutableSet<Developer*>*)developersSet;

@end

@interface _DevShop (DevelopersCoreDataGeneratedAccessors)
- (void)addDevelopers:(NSSet<Developer*>*)value_;
- (void)removeDevelopers:(NSSet<Developer*>*)value_;
- (void)addDevelopersObject:(Developer*)value_;
- (void)removeDevelopersObject:(Developer*)value_;

@end

@interface _DevShop (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveCompanyName;
- (void)setPrimitiveCompanyName:(NSString*)value;

- (NSDate*)primitiveFounded;
- (void)setPrimitiveFounded:(NSDate*)value;

- (NSNumber*)primitiveNumberOfEmployees;
- (void)setPrimitiveNumberOfEmployees:(NSNumber*)value;

- (int16_t)primitiveNumberOfEmployeesValue;
- (void)setPrimitiveNumberOfEmployeesValue:(int16_t)value_;

- (NSNumber*)primitiveRevenue;
- (void)setPrimitiveRevenue:(NSNumber*)value;

- (double)primitiveRevenueValue;
- (void)setPrimitiveRevenueValue:(double)value_;

- (NSMutableSet<Developer*>*)primitiveDevelopers;
- (void)setPrimitiveDevelopers:(NSMutableSet<Developer*>*)value;

@end

@interface DevShopAttributes: NSObject 
+ (NSString *)companyName;
+ (NSString *)founded;
+ (NSString *)numberOfEmployees;
+ (NSString *)revenue;
@end

@interface DevShopRelationships: NSObject
+ (NSString *)developers;
@end

NS_ASSUME_NONNULL_END
