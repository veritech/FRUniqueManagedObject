//
//  FRAppDelegate.h
//  FRUniqueManagedObject
//
//  Created by Jonathan Dalrymple on 30/09/2013.
//  Copyright (c) 2013 Float right Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FRAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
