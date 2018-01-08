//
//  StepOneEntityMigrationPolicy.m
//  TestHeavyMigration
//
//  Created by Thomas Dubiel on 05.01.18.
//  Copyright © 2018 Crazy Nexus. All rights reserved.
//

#import "StepOneEntityMigrationPolicy.h"

@implementation StepOneEntityMigrationPolicy

-(BOOL)createDestinationInstancesForSourceInstance:(NSManagedObject *)sInstance
                                     entityMapping:(NSEntityMapping *)mapping
                                           manager:(NSMigrationManager *)manager
                                             error:(NSError * _Nullable __autoreleasing *)error {
   
   // create a new object for the model context
   NSManagedObject *newObject = [NSEntityDescription insertNewObjectForEntityForName:[mapping destinationEntityName]
                                                              inManagedObjectContext:[manager destinationContext]];
   
   // do your transfer of NSDate to NSString
   NSDate *date = [sInstance valueForKey:@"timeStamp"];
   
   NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
   [formatter setTimeStyle:NSDateFormatterMediumStyle];
   [formatter setDateStyle:NSDateFormatterMediumStyle];
   
   // set the value for our new object
   [newObject setValue:[formatter stringFromDate:date] forKey:@"printedDate"];
   
   [manager associateSourceInstance:sInstance withDestinationInstance:newObject forEntityMapping:mapping];
   
   return YES;
}

@end
