// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DevShop.m instead.

#import "_DevShop.h"

@implementation DevShopID
@end

@implementation _DevShop

+ (instancetype)insertInManagedObjectContext:(NSManagedObjectContext *)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"DevShop" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"DevShop";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"DevShop" inManagedObjectContext:moc_];
}

- (DevShopID*)objectID {
	return (DevShopID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"numberOfEmployeesValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"numberOfEmployees"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"revenueValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"revenue"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic companyName;

@dynamic founded;

@dynamic numberOfEmployees;

- (int16_t)numberOfEmployeesValue {
	NSNumber *result = [self numberOfEmployees];
	return [result shortValue];
}

- (void)setNumberOfEmployeesValue:(int16_t)value_ {
	[self setNumberOfEmployees:@(value_)];
}

- (int16_t)primitiveNumberOfEmployeesValue {
	NSNumber *result = [self primitiveNumberOfEmployees];
	return [result shortValue];
}

- (void)setPrimitiveNumberOfEmployeesValue:(int16_t)value_ {
	[self setPrimitiveNumberOfEmployees:@(value_)];
}

@dynamic revenue;

- (double)revenueValue {
	NSNumber *result = [self revenue];
	return [result doubleValue];
}

- (void)setRevenueValue:(double)value_ {
	[self setRevenue:@(value_)];
}

- (double)primitiveRevenueValue {
	NSNumber *result = [self primitiveRevenue];
	return [result doubleValue];
}

- (void)setPrimitiveRevenueValue:(double)value_ {
	[self setPrimitiveRevenue:@(value_)];
}

@dynamic developers;

- (NSMutableSet<Developer*>*)developersSet {
	[self willAccessValueForKey:@"developers"];

	NSMutableSet<Developer*> *result = (NSMutableSet<Developer*>*)[self mutableSetValueForKey:@"developers"];

	[self didAccessValueForKey:@"developers"];
	return result;
}

@end

@implementation DevShopAttributes 
+ (NSString *)companyName {
	return @"companyName";
}
+ (NSString *)founded {
	return @"founded";
}
+ (NSString *)numberOfEmployees {
	return @"numberOfEmployees";
}
+ (NSString *)revenue {
	return @"revenue";
}
@end

@implementation DevShopRelationships 
+ (NSString *)developers {
	return @"developers";
}
@end

