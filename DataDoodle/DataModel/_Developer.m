// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Developer.m instead.

#import "_Developer.h"

@implementation DeveloperID
@end

@implementation _Developer

+ (instancetype)insertInManagedObjectContext:(NSManagedObjectContext *)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Developer" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Developer";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Developer" inManagedObjectContext:moc_];
}

- (DeveloperID*)objectID {
	return (DeveloperID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"salaryValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"salary"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic name;

@dynamic salary;

- (int16_t)salaryValue {
	NSNumber *result = [self salary];
	return [result shortValue];
}

- (void)setSalaryValue:(int16_t)value_ {
	[self setSalary:@(value_)];
}

- (int16_t)primitiveSalaryValue {
	NSNumber *result = [self primitiveSalary];
	return [result shortValue];
}

- (void)setPrimitiveSalaryValue:(int16_t)value_ {
	[self setPrimitiveSalary:@(value_)];
}

@dynamic startDate;

@dynamic title;

@dynamic devShop;

@end

@implementation DeveloperAttributes 
+ (NSString *)name {
	return @"name";
}
+ (NSString *)salary {
	return @"salary";
}
+ (NSString *)startDate {
	return @"startDate";
}
+ (NSString *)title {
	return @"title";
}
@end

@implementation DeveloperRelationships 
+ (NSString *)devShop {
	return @"devShop";
}
@end

