// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Developer.h instead.

#if __has_feature(modules)
    @import Foundation;
    @import CoreData;
#else
    #import <Foundation/Foundation.h>
    #import <CoreData/CoreData.h>
#endif

NS_ASSUME_NONNULL_BEGIN

@class DevShop;

@interface DeveloperID : NSManagedObjectID {}
@end

@interface _Developer : NSManagedObject
+ (instancetype)insertInManagedObjectContext:(NSManagedObjectContext *)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) DeveloperID *objectID;

@property (nonatomic, strong) NSString* name;

@property (nonatomic, strong) NSNumber* salary;

@property (atomic) int16_t salaryValue;
- (int16_t)salaryValue;
- (void)setSalaryValue:(int16_t)value_;

@property (nonatomic, strong) NSDate* startDate;

@property (nonatomic, strong) NSString* title;

@property (nonatomic, strong) DevShop *devShop;

@end

@interface _Developer (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;

- (NSNumber*)primitiveSalary;
- (void)setPrimitiveSalary:(NSNumber*)value;

- (int16_t)primitiveSalaryValue;
- (void)setPrimitiveSalaryValue:(int16_t)value_;

- (NSDate*)primitiveStartDate;
- (void)setPrimitiveStartDate:(NSDate*)value;

- (NSString*)primitiveTitle;
- (void)setPrimitiveTitle:(NSString*)value;

- (DevShop*)primitiveDevShop;
- (void)setPrimitiveDevShop:(DevShop*)value;

@end

@interface DeveloperAttributes: NSObject 
+ (NSString *)name;
+ (NSString *)salary;
+ (NSString *)startDate;
+ (NSString *)title;
@end

@interface DeveloperRelationships: NSObject
+ (NSString *)devShop;
@end

NS_ASSUME_NONNULL_END
