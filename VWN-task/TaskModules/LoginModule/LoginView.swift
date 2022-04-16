//
//  LoginView.swift
//  VWN-task
//
//  Created by wecancity on 16/04/2022.
//

import SwiftUI

struct LoginView: View {
//    @FocusState private var isfocused : Bool
    @State var title = ""

    @State var UserName = ""
    @State var Password = ""
    @State var gotoaddproduct = false

    
    var body: some View {
        NavigationView {
            ZStack{
                ScrollView {
                    VStack{
                        
                        
                        Text("Hello Again!")
                            .multilineTextAlignment(.center)
                        
                            .font(.system(size: 43))
                            .padding(.top,50)
                        
                        Text("Welcome back to your second home!")
                            .multilineTextAlignment(.center)
                            .font(.system(size: 17))
                            .padding(.top,1)

                        VStack {
                            InputTextField( text: $UserName ,title: "UserName")
                                .keyboardType(.emailAddress)
                                .autocapitalization(.none)
                            .textInputAutocapitalization(.never)
                        
        //                    .focused($isfocused)
                                               
                        SecureInputView("Password", text: $Password)
                            .autocapitalization(.none)
                            .textInputAutocapitalization(.never)
        //                    .focused($isfocused)
                        }.padding()
                        
                        HStack{
                            Spacer()
                        Button(action: {
                            
                        }, label: {
                            Text("Recover Password")
                                .foregroundColor(.black).opacity(0.8)
                        })
                        }.padding(.trailing,30)
                        
                        
                        Button(action: {
                            // add review
                            if UserName == "admin" && Password == "admin"{
                                print("Success Login")
                                gotoaddproduct = true
                            } else{
                                gotoaddproduct = true

                                print("Wrong username or password")
                                print(UserName)
                                print(Password)
                            }
                            
                        }, label: {
                            HStack {
                                Text("Sign In")
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

                        
                        HStack{
                            Text("Not a member?")
                                .foregroundColor(.black).opacity(0.8)
                        Button(action: {
                            
                        }, label: {
                            Text("Register now")
                                .foregroundColor(.black)
                                .bold()
                        })
                        }.padding()
                        
                        Spacer()
                    }
                    .frame(width:UIScreen.main.bounds.width)
                }
            }
            .onAppear(perform: {
                self.title = ""
            })

            .onDisappear(perform: {
                self.title = "Add Product"
            })
            .background(
                Image("BackgroundImg")
                    .resizable()
            )
            
            .edgesIgnoringSafeArea(.all)
            .navigationTitle(title)
//            .navigationBarBackButtonHidden(true)
        }
        .navigationBarHidden(true)

        
        //            //  go to clinic info
                    NavigationLink(destination:AddProductView(),isActive: $gotoaddproduct) {
                          }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
