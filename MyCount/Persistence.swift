//
//  Persistence.swift
//  MyCount
//
//  Created by Victor Morel on 15/03/2021.
//

import Foundation
import CoreData

struct PersistenceController{
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer
    init() {
        container = NSPersistentContainer(name: "Counter")
        
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error: \(error)")
            }
        }
    }
}
