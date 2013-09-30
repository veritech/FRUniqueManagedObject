//
//  FRMockManagedObject.h
//  FRUniqueManagedObject
//
//  Created by Jonathan Dalrymple on 30/09/2013.
//  Copyright (c) 2013 Float right Ltd. All rights reserved.
//

#import "FRUniqueManagedObject.h"

@interface FRMockManagedObject : FRUniqueManagedObject

@property (nonatomic,copy) NSString *stringValue;
@property (nonatomic,copy) NSNumber *numberValue;

+ (id)mockObjectWithString:(NSString *)aString
      managedObjectContext:(NSManagedObjectContext *)aMoc;

@end
