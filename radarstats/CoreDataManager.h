//
//  CoreDataManager.h
//  
//
//  Created by Nicolas Bouilleaud on 15/05/11.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

extern NSString * const CoreDataManagerErrorDomain;
@protocol CoreDataManagerDelegate;

// Core Data Standard Machinery
@interface CoreDataManager : NSObject

- (id) init; // calls initWithModelName:NSStringFromClass([self class])
- (id) initWithModelName:(NSString*)modelName;

@property (readonly, nonatomic, strong) NSManagedObjectContext *moc;
@property (nonatomic, weak) id<CoreDataManagerDelegate> delegate; 

- (void) save;

@end

// reverse link to obtain the CoreDataManager from a moc, for example in the objects implementation.
@interface NSManagedObjectContext (AssociatedManager)
@property (nonatomic, retain, readonly) CoreDataManager * coreDataManager;
@end


// delegate
@protocol CoreDataManagerDelegate <NSObject>
@optional
- (void) coreDataManager:(CoreDataManager*)manager didSave:(BOOL)success withErrors:(NSArray*)errors;
@end
