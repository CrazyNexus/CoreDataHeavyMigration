//
//  CoreDataManager.m
//  TestHeavyMigration
//
//  Created by Dubiel, Thomas on 09.01.18.
//  Copyright © 2018 Crazy Nexus. All rights reserved.
//

#import "CoreDataManager.h"
#import <CoreData/CoreData.h>

@interface CoreDataManager ()

@property(nonatomic, strong) AppDelegate *appDelegate;

@end

@implementation CoreDataManager

+(id)shared:(AppDelegate*)appDelegate {
   static CoreDataManager *sharedManager = nil;
   static dispatch_once_t onceToken;
   dispatch_once(&onceToken, ^{
      sharedManager = [[CoreDataManager alloc] init];
      // Do any other initialisation stuff here
      sharedManager.appDelegate = appDelegate;
   });
   return sharedManager;
}

-(id)init {
   if (self = [super init]) {
      // do the usual init stuff here
   }
   return self;
}

-(void)migrateStoreIfNeeded:(void(^)(void))completion {
   
   NSLog(@"Migrating Database");
   
   NSPersistentStoreCoordinator *psc = _appDelegate.persistentContainer.persistentStoreCoordinator;
   NSURL *sourceStoreURL = ((NSPersistentStoreDescription *)_appDelegate.persistentContainer.persistentStoreDescriptions.firstObject).URL;
   NSError *error = nil;
   
   NSDictionary *sourceMetaData = [NSPersistentStoreCoordinator metadataForPersistentStoreOfType:NSSQLiteStoreType
                                                                                             URL:sourceStoreURL
                                                                                         options:nil
                                                                                           error:&error];
   
   NSManagedObjectModel *destinationModel = [psc managedObjectModel];
   BOOL pscCompatible = [destinationModel isConfiguration:nil
                              compatibleWithStoreMetadata:sourceMetaData];
   
   
   // check if migration is necessary
   
   
   
   completion();
}

@end
