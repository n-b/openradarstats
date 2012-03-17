//
//  NSFileManager+Etag.h
//  radarstats
//
//  Created by Nicolas Bouilleaud on 17/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager(Etag)
- (void) setEtag:(NSString*)etag atPath:(NSString*)path;
- (NSString*) etagAtPath:(NSString*)path;
@end