//
//  CoreData.swift
//  Giúp Mac

// COREDAT STACK

//
//  Created by mhtran on 3/18/16.
//  Copyright © 2016 mhtran. All rights reserved.
//

import Foundation
import CoreData

class CoreData {
    let model = "Giúp Mac"
    
    private lazy var applicationDocumentsDirectory: NSURL = {
        let urls = NSFileManager.defaultManager().URLsForDirectory(NSSearchPathDirectory.DocumentDirectory, inDomains: NSSearchPathDomainMask.UserDomainMask)
        return urls[urls.count - 1]
    }()
    
    private lazy var managedObjectModel: NSManagedObjectModel = {
       let modelURL = NSBundle.mainBundle().URLForResource(self.model, withExtension: "momd")!
        return NSManagedObjectModel(contentsOfURL: modelURL)!
    }()
    
    private lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        let url = self.applicationDocumentsDirectory.URLByAppendingPathComponent(self.model)
        do {
            let options = [NSMigratePersistentStoresAutomaticallyOption: true]
            
            try coordinator.addPersistentStoreWithType(NSSQLiteStoreType,configuration: nil, URL: url, options: options)
        }
        catch {
            fatalError("Error adding persistence store")
        }
        return coordinator
    }()
    
    lazy var managedObjectContext: NSManagedObjectContext = {
        var context = NSManagedObjectContext(concurrencyType:.MainQueueConcurrencyType)
        context.persistentStoreCoordinator = self.persistentStoreCoordinator
        return context

    }()
    
    // Save Context Func
    
    
    func saveContext() {
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
            }
            catch {
                print("Error saving context")
                abort()
            }
        }
    }
}