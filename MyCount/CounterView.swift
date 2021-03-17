//
//  CounterView.swift
//  MyCount
//
//  Created by Victor Morel on 16/03/2021.
//

import SwiftUI


struct CounterView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @State var counter: Counter
    @State var counterValue: Int64
    @State var newValue: Int64 = 0
    
    var body: some View{
        
        
        
        NavigationView {
            
            VStack{
                Text(String(counterValue))
                    .foregroundColor(.primary)
                    .font(.system(size: 75))
                
                HStack{
                    TextField("Value", value: $newValue, formatter: NumberFormatter())
                        .frame(maxWidth: 200, alignment: .center)
                        .background(Color.gray)
                        .foregroundColor(.primary)
                        .cornerRadius(8)
                        .font(.system(size: 50))
                        
                    Button(action: {
                        setValue()
                    }, label: {
                        Text("Set").font(/*.system(size: 50, design: )*/.title)
                    })
                    .foregroundColor(.primary)
                    .padding().frame(idealWidth: 100).frame(alignment: .center)
                    .background(Color.orange)
                    .cornerRadius(8)
                    
                }
                
                
                HStack {
                    
                    
                    VStack {
                        
                        Button(action: {
                                addValue(counter: counter, value: -1
                                )}, label: {
                                    Text("-1")
                                        .foregroundColor(.primary)
                                        .padding().frame(maxWidth: .infinity)
                                        .background(Color.red)
                                        .cornerRadius(8)
                                        
                            })
                        
                        Button(action: {
                                addValue(counter: counter, value: -5
                                )}, label: {
                                    Text("-5")
                                        .foregroundColor(.primary)
                                        .padding().frame(maxWidth: .infinity)
                                        .background(Color.red)
                                        .cornerRadius(8)
                            })
                        
                        Button(action: {
                                addValue(counter: counter, value: -10
                                )}, label: {
                                    Text("-10")
                                        .foregroundColor(.primary)
                                        .padding().frame(maxWidth: .infinity)
                                        .background(Color.red)
                                        .cornerRadius(8)
                            })
                        
                    }
                    
                    VStack {
                        Button(action: {
                                addValue(counter: counter, value: 1
                                )}, label: {
                                    Text("+1")
                                        .foregroundColor(.primary)
                                        .padding().frame(maxWidth: .infinity)
                                        .background(Color.green)
                                        .cornerRadius(8)
                            })
                        
                        Button(action: {
                                addValue(counter: counter, value: 5
                                )}, label: {
                                    Text("+5")
                                        .foregroundColor(.primary)
                                        .padding().frame(maxWidth: .infinity)
                                        .background(Color.green)
                                        .cornerRadius(8)
                            })
                        
                        Button(action: {
                                addValue(counter: counter, value: 10
                                )}, label: {
                                    Text("+10")
                                        .foregroundColor(.primary)
                                        .padding().frame(maxWidth: .infinity)
                                        .background(Color.green)
                                        .cornerRadius(8)
                            })
                    }
                }
                
                
            }.navigationTitle(counter.title ?? "Untitled")
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

    func addValue(counter: Counter, value: Int64) {
        counterValue += value
        counter.value = counterValue
        
        saveContext()
    }
    
    func setValue() {
        counter.value = newValue
        counterValue = newValue
        
        saveContext()
        
    }
    
    
}



struct CounterView_Previews: PreviewProvider {
    static var previews: some View {
        CounterView(counter: Counter(), counterValue: Int64())
    }
}



