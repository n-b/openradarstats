// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Radar.h instead.

#import <CoreData/CoreData.h>


extern const struct RadarAttributes {
	__unsafe_unretained NSString *classification;
	__unsafe_unretained NSString *number;
	__unsafe_unretained NSString *originatedDate;
	__unsafe_unretained NSString *product;
	__unsafe_unretained NSString *productVersion;
	__unsafe_unretained NSString *reproducible;
	__unsafe_unretained NSString *resolvedDate;
	__unsafe_unretained NSString *status;
	__unsafe_unretained NSString *text;
	__unsafe_unretained NSString *title;
	__unsafe_unretained NSString *user;
} RadarAttributes;

extern const struct RadarRelationships {
} RadarRelationships;

extern const struct RadarFetchedProperties {
} RadarFetchedProperties;














@interface RadarID : NSManagedObjectID {}
@end

@interface _Radar : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (RadarID*)objectID;




@property (nonatomic, strong) NSString *classification;


//- (BOOL)validateClassification:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSNumber *number;


@property int numberValue;
- (int)numberValue;
- (void)setNumberValue:(int)value_;

//- (BOOL)validateNumber:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSDate *originatedDate;


//- (BOOL)validateOriginatedDate:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString *product;


//- (BOOL)validateProduct:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString *productVersion;


//- (BOOL)validateProductVersion:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString *reproducible;


//- (BOOL)validateReproducible:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSDate *resolvedDate;


//- (BOOL)validateResolvedDate:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString *status;


//- (BOOL)validateStatus:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString *text;


//- (BOOL)validateText:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString *title;


//- (BOOL)validateTitle:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString *user;


//- (BOOL)validateUser:(id*)value_ error:(NSError**)error_;





@end

@interface _Radar (CoreDataGeneratedAccessors)

@end

@interface _Radar (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveClassification;
- (void)setPrimitiveClassification:(NSString*)value;




- (NSNumber*)primitiveNumber;
- (void)setPrimitiveNumber:(NSNumber*)value;

- (int)primitiveNumberValue;
- (void)setPrimitiveNumberValue:(int)value_;




- (NSDate*)primitiveOriginatedDate;
- (void)setPrimitiveOriginatedDate:(NSDate*)value;




- (NSString*)primitiveProduct;
- (void)setPrimitiveProduct:(NSString*)value;




- (NSString*)primitiveProductVersion;
- (void)setPrimitiveProductVersion:(NSString*)value;




- (NSString*)primitiveReproducible;
- (void)setPrimitiveReproducible:(NSString*)value;




- (NSDate*)primitiveResolvedDate;
- (void)setPrimitiveResolvedDate:(NSDate*)value;




- (NSString*)primitiveStatus;
- (void)setPrimitiveStatus:(NSString*)value;




- (NSString*)primitiveText;
- (void)setPrimitiveText:(NSString*)value;




- (NSString*)primitiveTitle;
- (void)setPrimitiveTitle:(NSString*)value;




- (NSString*)primitiveUser;
- (void)setPrimitiveUser:(NSString*)value;




@end
