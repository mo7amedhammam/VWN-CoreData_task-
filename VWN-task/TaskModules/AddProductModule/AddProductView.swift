//
//  AddProductView.swift
//  VWN-task
//
//  Created by wecancity on 16/04/2022.
//

import SwiftUI
struct AddProductView: View {
//    @FocusState private var isfocused : Bool

    @State var ProductName = ""
    @State var ProductInfo = ""

    @State var Password = ""
    
    var body: some View {
        ZStack{
            VStack{
                Spacer().frame(height:150)
                HStack{
                Text("Add Product Images")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 17))
                    .padding(.top,1)
                Spacer()
                }.padding()
                VStack {
                    InputTextField( text: $ProductName ,title: "Product Name")
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                    .textInputAutocapitalization(.never)
                
                    InputTextField( text: $ProductInfo ,title: "Product Info")
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                    .textInputAutocapitalization(.never)

                    
//                    ZStack(alignment: .leading){
//                    HStack{
//                        InputTextField( text: $ProductInfo ,title: "Product Info")
//                            .keyboardType(.emailAddress)
//                            .autocapitalization(.none)
//                        .textInputAutocapitalization(.never)
//
//                    }
//                        HStack{
//                            Spacer()
//                            Image(systemName: "chevron.forward")
//                                .padding(.trailing)
////                                .foregroundColor(Color("lightGray"))
//                        }
//                    }
                    Button (action:{
                        
                    }, label: {
                        ZStack(alignment: .leading){
                        HStack{
                            InputTextField( text: $ProductInfo ,title: "Meal")
                                .keyboardType(.emailAddress)
                                .autocapitalization(.none)
                            .textInputAutocapitalization(.never)
                            
                        }
                            HStack{
                                Spacer()
                                Image(systemName: "chevron.forward")
                                    .padding(.trailing)
    //                                .foregroundColor(Color("lightGray"))
                            }
                        }
                    })   .padding(.horizontal)
                        .buttonStyle(.plain)

                    Button (action:{
                        
                    }, label: {
                        ZStack(alignment: .leading){
                        HStack{
                            InputTextField( text: $ProductInfo ,title: "Item Type")
                                .keyboardType(.emailAddress)
                                .autocapitalization(.none)
                            .textInputAutocapitalization(.never)
                            
                        }
                            HStack{
                                Spacer()
                                Image(systemName: "chevron.forward")
                                    .padding(.trailing)
    //                                .foregroundColor(Color("lightGray"))
                            }
                        }
                    })   .padding(.horizontal)
                        .buttonStyle(.plain)

                 
                        ZStack(alignment: .leading){
                        HStack{
                            InputTextField( text: $ProductInfo ,title: "price")
                                .keyboardType(.emailAddress)
                                .autocapitalization(.none)
                            .textInputAutocapitalization(.never)

                        }
                            HStack{
                                Spacer()
                                Image(systemName: "chevron.forward")
                                    .padding(.trailing)
    //                                .foregroundColor(Color("lightGray"))
                            }
                        }.padding(.horizontal )
                    
                    
          
                }

                    
//                    .focused($isfocused)
                                       

                
                
                Button(action: {
                    // add review
                
                    
                }, label: {
                    HStack {
                        Text("Done")
                            .font(.system(size: 25))
//                            .fontWeight(.semibold)
//                            .font(.title3)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height:40)
                    .padding()
                    .background(.red).opacity(0.7)
                    .foregroundColor(.white).opacity(1.2)
    //                .background(LinearGradient(gradient: Gradient(colors: [Color("DarkGreen"), Color("LightGreen")]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(12)
                    .padding(.horizontal, 20)
                }).padding(.top)

                
               
                
                Spacer()
            }
            .frame(width:UIScreen.main.bounds.width)
    }
        .background(
            Image("BackgroundImg")
                .resizable()
        )
        
        .edgesIgnoringSafeArea(.all)
        .navigationBarHidden(true)
        
    }
}

struct AddProductView_Previews: PreviewProvider {
    static var previews: some View {
        AddProductView()
    }
}
