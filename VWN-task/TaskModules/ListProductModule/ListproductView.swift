//
//  ListproductView.swift
//  VWN-task
//
//  Created by wecancity on 17/04/2022.
//

import Foundation



import SwiftUI
struct ListproductView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
   

    
//    @FocusState private var isfocused : Bool
//    var columns = Array(repeating: GridItem(.fixed(120), spacing: 8), count: 2)
    var vGridLayout = [ GridItem(.adaptive(minimum: 120), spacing: 10) ]


    @State var Password = ""
    
    var body: some View {
        NavigationView {
            ZStack{
                    VStack{
//                        Spacer().frame(height:50)

                        Text("What would you\n like to eat")
                            .font(.system(size: 33))
                            .bold()
                            .multilineTextAlignment(.center)
                            .padding(.top, 80)
//                        ScrollView {

                        ScrollView() {

                                            LazyVGrid(columns: vGridLayout, spacing: 10) {
                                                
                                                
                                                ForEach(items, id:\.self){item in
                                                VStack{
//                                                    Image("WelcomeImg")


                                                    Image(uiImage: (UIImage(data: item.image ?? Data()) ?? UIImage(named: "WelcomeImg")) ?? UIImage())
                                                        .resizable()
                                                        .frame(height:150)
                                                        .padding(.horizontal,10)
                                                        .padding(.top,10)
                                                    VStack{

                                                        HStack {
                                                            Text( item.name ?? "" )
                                                                .font(.system(size: 22))
                                                            Spacer()
                                                        }
                                                        HStack {
                                                            Text(String(item.price )).font(.system(size: 18))
                                                            Spacer()
                                                        }

                                                    }
                                                    .padding(.horizontal)
                                                    .padding(.bottom)
                                                }
//                                                .frame( height: 250)
                                                .background(.white)

//                                                .padding()
                                                        .cornerRadius(20)
//                                                        .padding(.horizontal, 20)

                                                }
                                                .onDelete(perform: deleteItems)

                                                
                                                

                                               

                                            }
                                      
                        }
                        .listStyle(.plain)


                        .padding(.horizontal,10)
                            
                        Spacer()
                    }
                    .frame(width:UIScreen.main.bounds.width)
//                }
        
            

            }
            
            .background(
                Image("BackgroundImg")
                    .resizable()
            )
          
            .edgesIgnoringSafeArea(.all)
            

            
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
//                    EditButton()
                    Button (action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Text("Add Product")
                    })
                }
            }
            
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
////                    EditButton()
//                    Button(action: {
//                        
//                    }, label: {
//                        Text("Clear")
//                    })
//                }
//            }
            
        }
                   

//        .navigationTitle("What would you\n like to eat")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        
//        .navigationBarItems(leading: Button (action: {
//            self.presentationMode.wrappedValue.dismiss()
//        }, label: {
//            Text("Add Product")
//        }))
        
    }
    
    
    
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.name, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    private func addItem(name: String, info: String, meal: String, type: String,price:Double) {
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

struct ListproductView_Previews: PreviewProvider {
    static var previews: some View {
        ListproductView()
    }
}





