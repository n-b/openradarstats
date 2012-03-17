//
//  NSFileManager+ExtendedAttributes.h
//  
//
//  Created by Nicolas Bouilleaud on 06/01/11.
//

#import <Foundation/Foundation.h>

// Small NSFileManager extension to easily get and set metadata on a file.
//
// * The NSData can be used to encapsulate any kind of object, it's just bytes.
// * If you use custom attributes, the attribute name should be prefixed with something unique, like the app's Bundle ID.
// * As customary in Obj-C, the error parameter can be NULL.
@interface NSFileManager(ExtendedAttributes)
- (void) setData:(NSData*)data forExtendedAttribute:(NSString*)name ofItemAtPath:(NSString*)path error:(NSError**) error;
- (NSData*) dataForExtendedAttribute:(NSString*)name ofItemAtPath:(NSString*)path error:(NSError**) error;
@end

