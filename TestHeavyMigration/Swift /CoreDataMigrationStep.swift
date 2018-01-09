//
//  CoreDataMigrationStep.swift
//  TestHeavyMigration
//
//  Created by Dubiel, Thomas on 09.01.18.
//  Copyright © 2018 Crazy Nexus. All rights reserved.
//

import CoreData

struct CoreDataMigrationStep {
   
   let source: NSManagedObjectModel
   let destination: NSManagedObjectModel
   let mapping: NSMappingModel
}
