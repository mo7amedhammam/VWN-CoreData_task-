//
//  ContentView.swift
//  VWN-task
//
//  Created by wecancity on 16/04/2022.
//

import SwiftUI
//import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.name, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.scenePhase) var scenePhase
    
    var body: some View {
//        ZStack{
        NavigationView{
            ZStack{
        WelcomeView()
            .onChange(of: scenePhase, perform: { newPhase in
                    if newPhase == .active {
                        print("Active")
                    } else if newPhase == .inactive {
                        print("InActive")
                    } else if newPhase == .background {
                        print("BackGround")
                    }
            })
        
            
        
        
            }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        }
        
                    
//        NavigationView {
//            List {
//                ForEach(items) { item in
//                    NavigationLink {
//                        Text("Item at \(item.timestamp!, formatter: itemFormatter)")
//                    } label: {
//                        Text(item.timestamp!, formatter: itemFormatter)
//                    }
//                }
//                .onDelete(perform: deleteItems)
//            }
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    EditButton()
//                }
//                ToolbarItem {
//                    Button(action: addItem) {
//                        Label("Add Item", systemImage: "plus")
//                    }
//                }
//            }
//            Text("Select an item")
            
//        }
    }

     func addItem(name: String, info: String, meal: String, type: String,price:Double) {
        withAnimation {
            let newItem = Item(context: viewContext)
//            newItem.timestamp = Date()
            newItem.name = name
            newItem.info = info
            newItem.meal = meal
            newItem.type = type
            newItem.price = price
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    
//    func save() {
//        let context = viewContext
//
//        if context.hasChanges {
//            do {
//                try context.save()
//            } catch {
//                // Show some error here
//            }
//        }
//    }
//
    
    
     func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}


