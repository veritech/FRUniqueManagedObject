//
//  FRMockManagedObject.m
//  FRUniqueManagedObject
//
//  Created by Jonathan Dalrymple on 30/09/2013.
//  Copyright (c) 2013 Float right Ltd. All rights reserved.
//

#import "FRMockManagedObject.h"

@implementation FRMockManagedObject

+ (id)mockObjectWithString:(NSString *)aString
      managedObjectContext:(NSManagedObjectContext *)aMoc {
    
    id obj = [[self alloc] initWithEntity:[NSEntityDescription entityForName:[self entityName]
                                                      inManagedObjectContext:aMoc]
           insertIntoManagedObjectContext:aMoc];
    
    [obj setStringValue:aString];
    [obj setNumberValue:nil];
    
    return obj;
}

#pragma mark - Overidden FRUniqueManagedObject
+ (NSString *)uniqueKeypath {
    return @"stringValue";
}

+ (NSString *)entityName {
    return @"Mock";
}


@end
