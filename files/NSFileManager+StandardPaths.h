//
//  NSFileManager+StandardPaths.h
//
//  Created by Nicolas Bouilleaud on 15/05/11.
//  Copyright 2011 Nicolas Bouilleaud. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (StandardPaths)
+ (NSString*) documentsDirectory;
+ (NSString*) cachesDirectory;
@end
