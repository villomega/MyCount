//
//  MyCountApp.swift
//  MyCount
//
//  Created by Victor Morel on 15/03/2021.
//

import SwiftUI



@main
struct MyCountApp: App {
    let persistenceContainer = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup{
            ContentView()
                .environment(\.managedObjectContext, persistenceContainer.container.viewContext)
            
            
        }
        
        WindowGroup{
            CounterView(counter: Counter(), counterValue: Int64())
                .environment(\.managedObjectContext, persistenceContainer.container.viewContext)
        }
    }
}
