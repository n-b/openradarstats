//
//  NSFileManager+Etag.m
//  radarstats
//
//  Created by Nicolas Bouilleaud on 17/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NSFileManager+Etag.h"
#import "NSFileManager+ExtendedAttributes.h"

#define kFileManagerEtagMetadataKey			@"org.appledevelopercommunity.filemanager.etag"


@implementation NSFileManager (Etag)

- (void) setEtag:(NSString*)etag atPath:(NSString*)path
{
    [self setData:[etag dataUsingEncoding:NSUTF8StringEncoding] forExtendedAttribute:kFileManagerEtagMetadataKey ofItemAtPath:path error:NULL];
}

- (NSString*) etagAtPath:(NSString*)path
{
	return [[NSString alloc] initWithData:[self dataForExtendedAttribute:kFileManagerEtagMetadataKey ofItemAtPath:path  error:NULL]
                                 encoding:NSUTF8StringEncoding];
}

@end