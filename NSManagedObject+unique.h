#import <CoreData/CoreData.h>

@inteface NSManagedObject(unique)

+ (NSString *)uniqueKeypath;

+ (NSString *)entityName;

+ (NSArray *)allUniqueObjectsWith:(NSArray *)newObjects
                    uniqueKeyPath:(NSString *)aKeypath
             managedObjectContext:(NSManagedObjectContext *)aMoc;
@end