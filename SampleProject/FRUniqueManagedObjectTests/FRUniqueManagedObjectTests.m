//
//  FRUniqueManagedObjectTests.m
//  FRUniqueManagedObjectTests
//
//  Created by Jonathan Dalrymple on 30/09/2013.
//  Copyright (c) 2013 Float right Ltd. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FRUniqueManagedObject.h"
#import "FRMockManagedObject.h"
#import "FRAppDelegate.h"

@interface FRUniqueManagedObjectTests : XCTestCase

@end

@implementation FRUniqueManagedObjectTests

- (NSManagedObjectContext *)managedObjectContext {
    return [(FRAppDelegate *)[[UIApplication sharedApplication] delegate] managedObjectContext];
}

- (NSArray *)generateObjects:(NSUInteger)aNumber {
    
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:aNumber];
    
    for (NSUInteger i=1; i < (aNumber+1); i++) {
        
        [array addObject:@{
                           @"stringValue":[NSString stringWithFormat:@"string%d",i],
                           @"numberValue":@(i)
                           }];
    }
    
    return [array copy];
}

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    
    //Destroy the context after each test
    [(FRAppDelegate *)[[UIApplication sharedApplication] delegate] setManagedObjectContext:nil];
}

- (void)testManagedObjectContext
{
    XCTAssertNotNil([self managedObjectContext], @"No Context");
}

- (void)testObject {
    
    FRMockManagedObject *mock;
    
    mock = [FRMockManagedObject mockObjectWithString:@"string"
                                managedObjectContext:[self managedObjectContext]];
    
    XCTAssertNotNil(mock, @"Couldn't create object");
    
    XCTAssertEqualObjects([mock stringValue], @"string", @"Strings don't match");
    
    XCTAssertEqualObjects([mock numberValue], nil, @"Numbers don't match");
}

- (void)testSameValue {

    FRMockManagedObject *mock;
    NSArray *uniqueObjects;
    NSArray *importObjects;
    
    importObjects = @[
                      @{@"stringValue":@"string",@"numberValue":@10}
                      ];

    mock = [FRMockManagedObject mockObjectWithString:@"string"
                                managedObjectContext:[self managedObjectContext]];
    
    uniqueObjects = [FRMockManagedObject allUniqueObjectsWith:importObjects
                                                uniqueKeyPath:@"stringValue"
                                         managedObjectContext:[self managedObjectContext]];
    
    XCTAssertNotNil(uniqueObjects, @"No object returned");
    
    XCTAssertTrue([uniqueObjects isKindOfClass:[NSArray class]], @"Not an array");
    
    XCTAssertEqual([uniqueObjects count], (NSUInteger)0, @"Invalid number objects");
    
}

- (void)testDifferentValue {
    
    NSArray *uniqueObjects;
    NSArray *importObjects;
    
    importObjects = @[
                      @{@"stringValue":@"stringA",@"numberValue":@10}
                      ];
    
    [FRMockManagedObject mockObjectWithString:@"string"
                         managedObjectContext:[self managedObjectContext]];
    
    uniqueObjects = [FRMockManagedObject allUniqueObjectsWith:importObjects
                                                uniqueKeyPath:@"stringValue"
                                         managedObjectContext:[self managedObjectContext]];
    
    XCTAssertNotNil(uniqueObjects, @"No object returned");
    
    XCTAssertTrue([uniqueObjects isKindOfClass:[NSArray class]], @"Not an array");
    
    XCTAssertEqual([uniqueObjects count], (NSUInteger)1, @"Invalid number objects");
    
    XCTAssertEqualObjects([uniqueObjects[0] objectForKey:@"stringValue"],@"stringA", @"Objects are not the same %@ %@",importObjects,uniqueObjects);
    
}

- (void)testMultipleInputValues {
    
    NSArray *uniqueObjects;
    NSArray *importObjects;
    
    importObjects = [self generateObjects:100];

    //Two of the same object
    [FRMockManagedObject mockObjectWithString:@"string"
                         managedObjectContext:[self managedObjectContext]];

    [FRMockManagedObject mockObjectWithString:@"string"
                         managedObjectContext:[self managedObjectContext]];
    
    [FRMockManagedObject mockObjectWithString:@"string10"
                         managedObjectContext:[self managedObjectContext]];
    
    [FRMockManagedObject mockObjectWithString:@"string100"
                         managedObjectContext:[self managedObjectContext]];
    
    uniqueObjects = [FRMockManagedObject allUniqueObjectsWith:importObjects
                                                uniqueKeyPath:@"stringValue"
                                         managedObjectContext:[self managedObjectContext]];
    
    XCTAssertNotNil(uniqueObjects, @"No object returned");
    
    XCTAssertTrue([uniqueObjects isKindOfClass:[NSArray class]], @"Not an array");
    
    XCTAssertEqual([uniqueObjects count], (NSUInteger)98, @"Invalid number objects");
    
}

@end
