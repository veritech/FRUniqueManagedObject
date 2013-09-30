#import <CoreData/CoreData.h>

@inteface NSManagedObjectUnique : NSManagedObject

+ (NSString *)uniqueKeypath;

+ (NSString *)entityName;

+ (NSArray *)allUniqueObjectsWith:(NSArray *)newObjects
                    uniqueKeyPath:(NSString *)aKeypath
             managedObjectContext:(NSManagedObjectContext *)aMoc;
@end