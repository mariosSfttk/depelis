//
//  CoreDataManager.swift
//  DePelis
//
//  Created by Mario Vargas on 13/11/24.
//

import CoreData


class CoreDataManager {
    private let modelName: String
    
    init(modelName: String) {
        self.modelName = modelName
    }
    
    private lazy var persistentContainer: NSPersistentContainer = {
       let container = NSPersistentContainer(name: modelName)
        
        container.loadPersistentStores { persistenDescription, error in
            if let error = error as? NSError {
                print(Strings.General.wrongMessage + error.localizedDescription)
            }
        }
        return container
    }()
    
    lazy var managedContext: NSManagedObjectContext = {
        return persistentContainer.viewContext
    }()
    
    func saveContext() {
        guard managedContext.hasChanges else {
            return
        }
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print(Strings.General.wrongMessage + error.localizedDescription)
        }
    }
}

