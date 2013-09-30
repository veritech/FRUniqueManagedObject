#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

typedef NS_OPTIONS(int, FRUniqueManagedObjectOptions){
    FRUniqueManagedObjectOptionsNone, //No options
    FRUniqueManagedObjectOptionComplete, //Prefer objects will all attributes
    FRUniqueManagedObjectOptionsModified, //Prefer objects with a more recent "modifiedDate" keypath
    FRUniqueManagedObjectOptionsCreated, //Prefer objects with a more recent "createdDate" keypath
};

@interface FRUniqueManagedObject : NSManagedObject

/**
 *  The unique keypath for a given object
 */
+ (NSString *)uniqueKeypath;

/**
 *  The name of the entity
 */
+ (NSString *)entityName;

/**
 *  Determine the unique objects in a given import for the current entity
 *
 *  @param newObjects the objects to import
 *  @param aKeypath The Keypath in the import set to check
 *  @param aMoc The managed object context to search
 *  @return The objects that should be imported
 */
+ (NSArray *)allUniqueObjectsWith:(NSArray *)newObjects
                    uniqueKeyPath:(NSString *)aKeypath
             managedObjectContext:(NSManagedObjectContext *)aMoc;

/**
 *  Find all the duplicates within the managed object context
 *  @param aMoc A managedObjectContext
 *  @param options bitmask of options to apply to the search
 *  @return A list of all the duplicate objects
 */
+ (NSArray *)allDuplicatesWithManagedObjectContext:(NSManagedObjectContext *)aMoc
                                           options:(FRUniqueManagedObjectOptions)options;

@end