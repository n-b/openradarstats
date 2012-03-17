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
    NSLog(@"cool %lu",data.length);
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
    
   
    NSDictionary * kvcMapping = [NSDictionary dictionaryWithObjectsAndKeys:
                                 @"status",			@"status",
                                 @"resolved",		@"resolvedDate",
                                 @"product",		@"product",
                                 @"description",	@"text",
                                 @"classification",	@"classification",
                                 @"title",			@"title",
                                 @"originated",		@"originatedDate",
                                 @"product_version",@"productVersion",
                                 @"number",			@"number",
                                 @"user",			@"user",
                                 @"reproducible",	@"reproducible",
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
