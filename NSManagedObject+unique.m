#import "NSManagedObject+unique.h"

@implementation NSManagedObject(unique)

+ (NSString *)uniqueKeypath {
  return nil;
}

+ (NSString *)entityName {
  return @""; //Entity name
}

+ (NSArray *)allUniqueObjectsWith:(NSArray *)newObjects
                    uniqueKeyPath:(NSString *)aKeypath
             managedObjectContext:(NSManagedObjectContext *)aMoc{
  
  NSMutableIndexSet *uniqueIndexes;
  dispatch_queue_t concurrentQueue;
  NSFetchRequest *fetchRequest;
  NSArray *fetchedObjects;
  NSSet  *hashes;
  NSError *error;
  NSLock *lock;

  //Ensure that the newObjects doesn't contain managedObjects
  //new objects will be accessed on background thread
  if ([newObjects count] == 0 || !newObjects) {
    return [NSArray array];
  }
  
  NSAssert(![[newObjects objectAtIndex:0] isKindOfClass:[NSManagedObject class]], @"New objects contains Core Data objects");
  
  //Create a global concurrent queue
  concurrentQueue = dispatch_queue_create("com.queue", DISPATCH_QUEUE_CONCURRENT);
  
  //Create a index set
  uniqueIndexes = [NSMutableIndexSet indexSet];
  
  //Create a lock to synchronize the saving of indexes to the idx set
  lock = [[NSLock alloc] init];
  
  //Get all the local objects
  
  /**
   *  TODO: Get a dictionary of objects rather than the
   *  Get a count of the objects and load only a x at time, instead of everything
   *
   */
  fetchRequest = [NSFetchRequest fetchRequestWithEntityName:[self entityName]];
  
  [fetchRequest setReturnsObjectsAsFaults:YES];
  
  if (!(fetchedObjects = [aMoc executeFetchRequest:fetchRequest error:&error])) {
    NSLog(@"Fetch error %@",error);
  }
  
  //Create an a set of all the hashes
  hashes = [NSSet setWithArray:[fetchedObjects valueForKeyPath:[self uniqueKeypath]]];
    
  //Compare new hashes against all the known hashes on multiple threads
  dispatch_apply([newObjects count], concurrentQueue, ^(size_t idx) {
    
    //Note that everything that happens here is on a concurrent queue
    if (![hashes member:[[newObjects objectAtIndex:idx] valueForKeyPath:aKeypath]]) {

      /**
       *  Consider alternatives to using a lock
       *
       *  1. Use dispatch async and place all the objects in queue
       *
       */
      //We have synchronize access to the mutable indexset
      [lock lock];  //Lock the index set
      [uniqueIndexes addIndex:idx]; //add the unique index
      [lock unlock]; //Unlock the index set
    
    }
    
  });
  
  NSLog(@"Found %d uniques out of %d",[uniqueIndexes count],[newObjects count]);
  
  //Dervive a new array based on the unique indexes
  return [newObjects objectsAtIndexes:uniqueIndexes];
}


@end