//
//  NSFileManager+ExtendedAttributes.m
//  
//
//  Created by Nicolas Bouilleaud on 06/01/11.
//

#import "NSFileManager+ExtendedAttributes.h"
#include <sys/xattr.h>

@implementation NSFileManager(ExtendedAttributes)
- (void) setData:(NSData*)data forExtendedAttribute:(NSString*)name ofItemAtPath:(NSString*)path error:(NSError**) error_
{
	int err = 0;
	err = setxattr([path fileSystemRepresentation], [name fileSystemRepresentation], [data bytes], [data length], 0, XATTR_NOFOLLOW);
	if(err)
	{
#ifdef VSLog
		VSLog(@"setxattr failed with error %d for attribute %@ at path %@",errno, name, path);
#endif
		if(error_)
			*error_ = [NSError errorWithDomain:@"NSFileManager+ExtendedAttributes" code:errno userInfo:nil];
	}
		
}

- (NSData*) dataForExtendedAttribute:(NSString*)name ofItemAtPath:(NSString*)path error:(NSError**) error_
{
	ssize_t dataSize =  getxattr([path fileSystemRepresentation], [name fileSystemRepresentation], NULL, 0, 0, XATTR_NOFOLLOW);
	if (dataSize != -1) {
		NSMutableData * data = [NSMutableData dataWithLength:dataSize];
		ssize_t realSize = getxattr([path fileSystemRepresentation], [name fileSystemRepresentation], [data mutableBytes], dataSize, 0, XATTR_NOFOLLOW);
		if(realSize!=dataSize)
		{
#ifdef VSLog
            VSLog(@"could not obtain data for attribute %@ at path %@",name, path);
#endif
			if(error_)
				*error_ = [NSError errorWithDomain:@"NSFileManager+ExtendedAttributes" code:errno userInfo:nil];
		}
		return data;
	}
	return nil;
}
@end
