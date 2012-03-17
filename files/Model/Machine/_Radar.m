// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Radar.m instead.

#import "_Radar.h"

const struct RadarAttributes RadarAttributes = {
	.classification = @"classification",
	.number = @"number",
	.originatedDate = @"originatedDate",
	.product = @"product",
	.productVersion = @"productVersion",
	.reproducible = @"reproducible",
	.resolvedDate = @"resolvedDate",
	.status = @"status",
	.text = @"text",
	.title = @"title",
	.user = @"user",
};

const struct RadarRelationships RadarRelationships = {
};

const struct RadarFetchedProperties RadarFetchedProperties = {
};

@implementation RadarID
@end

@implementation _Radar

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Radar" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Radar";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Radar" inManagedObjectContext:moc_];
}

- (RadarID*)objectID {
	return (RadarID*)[super objectID];
}

+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"numberValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"number"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}

	return keyPaths;
}




@dynamic classification;






@dynamic number;



- (int)numberValue {
	NSNumber *result = [self number];
	return [result intValue];
}

- (void)setNumberValue:(int)value_ {
	[self setNumber:[NSNumber numberWithInt:value_]];
}

- (int)primitiveNumberValue {
	NSNumber *result = [self primitiveNumber];
	return [result intValue];
}

- (void)setPrimitiveNumberValue:(int)value_ {
	[self setPrimitiveNumber:[NSNumber numberWithInt:value_]];
}





@dynamic originatedDate;






@dynamic product;






@dynamic productVersion;






@dynamic reproducible;






@dynamic resolvedDate;






@dynamic status;






@dynamic text;






@dynamic title;






@dynamic user;










@end
