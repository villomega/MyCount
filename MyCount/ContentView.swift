//
//  ContentView.swift
//  MyCount
//
//  Created by Victor Morel on 15/03/2021.
//

import SwiftUI



struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    
    @FetchRequest(sortDescriptors: [])
    private var counters: FetchedResults<Counter>
    
    @State private var showCounterView = false
    
    
    
    var body: some View {
        NavigationView{
            List{
                ForEach(counters) { counter in
                    Button(action: {
                        openCounterView(counter: counter)
                    }, label: {
                        HStack {
                            Text(counter.title ?? "Untitled")
                                

                            Text(String(counter.value)).foregroundColor(.secondary)
                                
                        }
                        
                    }).foregroundColor(.primary)
                    .sheet(isPresented: $showCounterView, content: {
                        CounterView(counter: counter, counterValue: counter.value )
                    })
                    
                }.onDelete(perform: deleteCounter)
                
                
            }.listStyle(InsetGroupedListStyle())
            
            .navigationTitle("Counters")
            .navigationBarItems(trailing: Button("Add Counter") {
                addCounter()
            })
        }
    }
    
    private func saveContext() {
        do {
            try viewContext.save()
        } catch  {
            let error = error as NSError
            fatalError("Unresolved error: \(error)")
        }
    }
    
    private func deleteCounter(offsets: IndexSet) {
        withAnimation{
            offsets.map { counters[$0] }.forEach(viewContext.delete(_:))
            saveContext()
        }
    }
    
    private func openCounterView(counter: Counter) {
        print("Counter \(counter.title ?? "Untitled") opened")
        showCounterView.toggle()
        
    }
    
    private func addCounter() {
        
        print(setTitle())
        
    }
    
    private func setTitle() -> String {
        
        
        let alert = UIAlertController(title: "Counter's title", message: "Give a title to your counter !", preferredStyle: .alert)
        alert.addTextField { title in
            title.placeholder = "Title"
        }
        
        let confirm = UIAlertAction(title: "Confirm", style: .default) { (_) in
            print("Confirmé")
            let title = alert.textFields![0].text ?? "Untitled"
            
            withAnimation {
                let newCounter = Counter(context: viewContext)
                newCounter.title = title
                newCounter.startingDate = Date()
                newCounter.value = 0
                
                saveContext()
            }
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .destructive) { (_) in
            print("Cancelled")
        }
        
        
        alert.addAction(cancel)
        alert.addAction(confirm)
        
        
        UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: {
            print("ok")
        })
        
        return "title"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
