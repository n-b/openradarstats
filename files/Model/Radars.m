//
//  Radars.m
//  radarstats
//
//  Created by Nicolas Bouilleaud on 17/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Radars.h"
#import "NSFileManager+StandardPaths.h"
#import <KVCMapping/NSObject+KVCMapping.h>
#import "Radar.h"

@interface AllYouCanEatDateTransformer : NSValueTransformer
@end

/****************************************************************************/
#pragma mark -

@implementation Radars

- (NSString*) cachedFilePath
{
    return [[NSBundle mainBundle] pathForResource:@"radars" ofType:@"json"];
}

- (void) downloadAndParseWholeRadarList
{
    [self performSelectorOnMainThread:@selector(parseData) withObject:nil waitUntilDone:NO];
}

- (void) parseData
{
    NSData * data = [NSData dataWithContentsOfFile:[self cachedFilePath]];
    NSError * error;
    id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    if(!json || error)
    {
        NSLog(@"could not parse JSON (%@)",error);
        return;
    }
    if( ![json isKindOfClass:[NSDictionary self]] || ![[json objectForKey:@"result"] isKindOfClass:[NSArray self]] )
    {
        NSLog(@"invalid JSON");
        return;
    }

    [NSValueTransformer setValueTransformer:[AllYouCanEatDateTransformer new] forName:@"AllYouCanEatDateTransformer"];
    NSDictionary * kvcMapping = [NSDictionary dictionaryWithObjectsAndKeys:
                                 @"status",										@"status",
                                 @"AllYouCanEatDateTransformer:resolvedDate",	@"resolved",
                                 @"product",									@"product",
                                 @"text",										@"description",
                                 @"classification",								@"classification",
                                 @"title",										@"title",
                                 @"AllYouCanEatDateTransformer:originatedDate",	@"originated",
                                 @"productVersion",								@"product_version",
                                 @"number",										@"number",
                                 @"user",										@"user",
                                 @"reproducible",								@"reproducible",
                                 nil];
    
    NSArray * radarsJSONArray = [json objectForKey:@"result"];
    for (NSDictionary * radarJSONDict in radarsJSONArray) {
        Radar * radar = [Radar insertInManagedObjectContext:self.moc];
        [radar setValuesForKeysWithDictionary:radarJSONDict
                        withMappingDictionary:kvcMapping];
    }
    [self save];
}
@end


/****************************************************************************/
#pragma mark -

@implementation AllYouCanEatDateTransformer
{
    NSMutableArray * dateFormatters;
}

- (id)init
{
    self = [super init];
    if (self) {
        dateFormatters = [NSMutableArray new];
        NSArray * formats = [NSArray arrayWithObjects:
                             @"EEE, dd MMM yyyy HH:mm:ss zzz", 

                             @"yyyy-MM-dd'T'HH:mmZZZ",

                             @"dd MMM yyyy hh:mm:ss zzz",
                             @"dd-MMM-yyyy hh:mm:ss a",
                             @"dd-MMM-yyyy hh:mm a zzz",
                             @"dd MMM yyyy hh:mm a zzz",
                             @"dd-MMM-yyyy hh:mm a",
                             @"dd-MMM-yyyy HH:mm",
                             @"dd MMMM yyyy",

                             @"EEE MMM dd yyyy", 
                             @"EEE MMM dd, yyyy", 
                             @"MMMM dd, yyyy",
                             @"MMMM dd yyyy",
                             @"MMM dd, yyyy", 
                             @"MMM dd,yyyy", 
                             @"MM/dd/yyyy",
                             @"M-dd-yyyy",
                             @"MM.dd.yyyy",
                             @"MM/dd.yyyy",
                             @"MM.dd.yy",

                             @"dd-MMM-yyyy",
                             @"dd/MM/yyyy",
                             @"dd-MM-yyyy",
                             @"dd.MM.yyyy",
                             @"dd.MM.yy",

                             @"yyyy-MM-dd",
                             @"yyyy/MM/dd",
                             @"yyyyMMdd",
                             nil];
        for (NSString * format in formats) {
            NSDateFormatter * dateFormatter = [NSDateFormatter new];
            [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
            [dateFormatter setDateFormat:format];
            [dateFormatters addObject:dateFormatter];
        }

    }
    return self;
}

+ (Class)transformedValueClass
{
    return [NSDate self];
}

- (id)transformedValue:(id)value
{
    if(![value isKindOfClass:[NSString self]] || [value length]==0) return [NSDate distantPast];
    for (NSDateFormatter * formatter in dateFormatters) {
        NSDate* date = [formatter dateFromString:value];
        if (date)
            return date;
    }
    if(![value isEqual:@"NO"]&&![value isEqual:@"No"]&&![value isEqual:@"no"]&&![value isEqual:@"Yes"]&&![value isEqual:@"Unknown"]&&![value hasPrefix:@"Duplicate"])
        NSLog(@"unparsed string : %@",value);
    return [NSDate distantFuture];
}


@end

