//
//  CoreDataManager.h
//  TestHeavyMigration
//
//  Created by Dubiel, Thomas on 09.01.18.
//  Copyright © 2018 Crazy Nexus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"

@interface CoreDataManager : NSObject

+(CoreDataManager *)shared:(AppDelegate*)appDelegate;

-(void)migrateStoreIfNeeded:(void(^)(void))callback;

@end
